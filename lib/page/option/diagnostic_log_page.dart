import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/services/diagnostic_log_service.dart';
import 'package:celechron/services/diagnostic_report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DiagnosticLogPage extends StatefulWidget {
  final String version;
  final String buildNumber;
  final String? initialLogText;
  final Future<void> Function()? clearLogs;

  const DiagnosticLogPage({
    required this.version,
    this.buildNumber = '1',
    this.initialLogText,
    this.clearLogs,
    super.key,
  });

  @override
  State<DiagnosticLogPage> createState() => _DiagnosticLogPageState();
}

class _DiagnosticLogPageState extends State<DiagnosticLogPage> {
  final _parser = const DiagnosticReportParser();
  final _expandedReports = <String>{};
  final _expandedIssues = <String>{};
  final _expandedStacks = <String>{};
  late final PageController _pageController;
  String _logText = '';
  DiagnosticReportBundle _bundle = DiagnosticReportBundle.empty;
  int _mode = 0;
  bool _loading = true;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.initialLogText != null) {
      _setLogText(widget.initialLogText!);
    } else {
      _reload();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _setLogText(String text) {
    _logText = text;
    _bundle = _parser.parse(text);
    _loading = false;
    final latest = _bundle.latestReport;
    if (latest != null && _expandedReports.isEmpty) {
      _expandedReports.add(latest.refreshId);
    }
  }

  Future<void> _reload() async {
    final text = await DiagnosticLogService.instance.recentText();
    if (!mounted) return;
    setState(() => _setLogText(text));
  }

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: _logText));
    if (mounted)
      await _showMessage(
          context.l10n.coreCopied, context.l10n.coreRawLogsCopied);
  }

  Future<void> _export() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final fileName = await DiagnosticLogService.instance.exportAndShare(
        version: widget.version,
        buildNumber: widget.buildNumber,
      );
      if (mounted)
        await _showMessage(context.l10n.coreExportSucceeded,
            context.l10n.coreFileCreated(fileName));
    } on Object catch (error, stackTrace) {
      DiagnosticLogService.instance.record(
        level: CelechronLogLevel.error,
        module: '诊断日志',
        operation: 'export',
        error: error,
        stackTrace: stackTrace,
      );
      if (mounted)
        await _showMessage(context.l10n.coreExportFailed,
            '${context.l10n.coreUnableExportLogs} $error');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _clear() async {
    await (widget.clearLogs ?? DiagnosticLogService.instance.clear)();
    if (widget.initialLogText == null) {
      await _reload();
    } else if (mounted) {
      setState(() => _setLogText(''));
    }
    if (mounted)
      await _showMessage(
          context.l10n.coreCleared, context.l10n.coreLogsCleared);
  }

  Future<void> _confirmClear() async {
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(context.l10n.coreConfirmClearLogs),
        content: Text(context.l10n.coreClearLogsWarning),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(context.l10n.coreCancel),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(context.l10n.coreClear),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) await _clear();
  }

  Future<void> _showMessage(String title, String message) {
    return showCupertinoDialog<void>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(context.l10n.coreConfirm),
          ),
        ],
      ),
    );
  }

  void _setMode(int value) {
    if (_mode == value) return;
    setState(() => _mode = value);
    _pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(context.l10n.coreDiagnostics),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Semantics(
                label: context.l10n.coreDiagnosticDisplayMode,
                child: SizedBox(
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl<int>(
                    key: const ValueKey('diagnostic-mode-switch'),
                    groupValue: _mode,
                    children: {
                      0: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                        child: Text(context.l10n.coreReadableReport),
                      ),
                      1: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                        child: Text(context.l10n.coreRawLogs),
                      ),
                    },
                    onValueChanged: (value) {
                      if (value != null) _setMode(value);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                key: const ValueKey('diagnostic-mode-pages'),
                controller: _pageController,
                onPageChanged: (value) => setState(() => _mode = value),
                children: [
                  _buildReadablePage(context),
                  _buildRawPage(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReadablePage(BuildContext context) {
    if (_loading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (_bundle.reports.isEmpty) {
      return ListView(
        key: const ValueKey('readable-report-page'),
        padding: const EdgeInsets.all(16),
        children: [
          _card(
            context,
            child: Column(
              children: [
                Icon(CupertinoIcons.doc_text_search, size: 36),
                SizedBox(height: 12),
                Text(context.l10n.coreNoReadableRefreshRecords),
                SizedBox(height: 6),
                Text(context.l10n.coreRefreshRecordsHint),
              ],
            ),
          ),
        ],
      );
    }
    return CupertinoScrollbar(
      child: ListView(
        key: const ValueKey('readable-report-page'),
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 28),
        children: [
          if (_bundle.damagedLineCount > 0)
            _noticeCard(
              context,
              context.l10n.coreDamagedLogLines(_bundle.damagedLineCount),
            ),
          if (_bundle.globalTimeline.isNotEmpty)
            _globalTimelineCard(context, _bundle.globalTimeline),
          for (final report in _bundle.reports) ...[
            _reportCard(context, report),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  Widget _reportCard(BuildContext context, DiagnosticRefreshReport report) {
    final expanded = _expandedReports.contains(report.refreshId);
    final statusColor = _severityColor(context, report.severity);
    final description = diagnosticReportDescription(report);
    return Semantics(
      container: true,
      label: '${displayText(diagnosticOriginLabel(report.origin))}，'
          '${displayText(diagnosticReportTitle(report))}，'
          '${formatLocalDiagnosticTime(report.startedAtUtc)}',
      child: _card(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(_severityIcon(report.severity),
                    color: statusColor, size: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayText(diagnosticReportTitle(report)),
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${displayText(diagnosticOriginLabel(report.origin))} · '
                        '${formatLocalDiagnosticTime(report.startedAtUtc)}',
                        style: TextStyle(
                          color: CupertinoDynamicColor.resolve(
                            CupertinoColors.secondaryLabel,
                            context,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (description != null) ...[
              const SizedBox(height: 12),
              Text(displayText(description)),
            ],
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _metric(context, context.l10n.coreTotalDuration,
                    formatDuration(report.durationMs)),
                if (report.performedModuleRequests) ...[
                  _metric(context, context.l10n.coreSuccess,
                      '${report.successCount}'),
                  _metric(context, context.l10n.coreDegraded,
                      '${report.degradedCount}'),
                  _metric(context, context.l10n.coreFailed,
                      '${report.failedCount}'),
                ],
              ],
            ),
            if (report.performedModuleRequests) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 6,
                children: [
                  _flag(context.l10n.coreRelogged, report.relogged),
                  _flag(context.l10n.coreRetried, report.retried),
                  _flag(context.l10n.coreCacheFallback, report.cacheUsed),
                ],
              ),
            ],
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                key: ValueKey('toggle-report-${report.refreshId}'),
                padding: const EdgeInsets.only(top: 8),
                onPressed: () => setState(() {
                  if (expanded) {
                    _expandedReports.remove(report.refreshId);
                  } else {
                    _expandedReports.add(report.refreshId);
                  }
                }),
                child: Text(expanded
                    ? context.l10n.coreHideDetails
                    : context.l10n.coreViewDetails),
              ),
            ),
            if (expanded) ...[
              _divider(context),
              if (report.modules.isNotEmpty) ...[
                _sectionTitle(context.l10n.coreModuleStatus),
                for (final module in report.modules)
                  _moduleCard(context, module),
                const SizedBox(height: 10),
              ],
              _sectionTitle(context.l10n.coreKeyTimeline),
              if (report.timeline.isEmpty)
                Text(context.l10n.coreNoKeyEvents)
              else
                for (final event in report.timeline)
                  _timelineRow(context, event),
              const SizedBox(height: 10),
              _sectionTitle(context.l10n.coreIssuesFound),
              if (report.issues.isEmpty)
                Text(context.l10n.coreNoIssues)
              else
                for (final issue in report.issues) _issueCard(context, issue),
            ],
          ],
        ),
      ),
    );
  }

  Widget _moduleCard(BuildContext context, DiagnosticModuleReport module) {
    final color = _moduleColor(context, module.state);
    final cacheTime = module.cacheUpdatedAtUtc == null
        ? module.cacheUpdatedText
        : formatLocalDiagnosticTime(module.cacheUpdatedAtUtc!);
    return Container(
      key: ValueKey('module-${module.name}'),
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.tertiarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  displayText(module.name),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                displayText(diagnosticModuleStateLabel(module.state)),
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(displayText(module.reason)),
          const SizedBox(height: 6),
          Wrap(
            spacing: 10,
            runSpacing: 4,
            children: [
              Text(formatModuleDuration(module)),
              if (module.relogged) Text(context.l10n.coreReauthenticated),
              if (module.retried) Text(context.l10n.coreRetried),
              if (cacheTime != null)
                Text('${context.l10n.coreCacheUpdatedAt} ${displayText(cacheTime)}'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timelineRow(BuildContext context, DiagnosticTimelineEvent event) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(CupertinoIcons.circle_fill, size: 8),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(displayText(event.title)),
                Text(
                  '${formatLocalDiagnosticTime(event.timestampUtc)}'
                  '${event.description == null ? '' : ' · ${displayText(event.description!)}'}',
                  style: TextStyle(
                    color: CupertinoDynamicColor.resolve(
                      CupertinoColors.secondaryLabel,
                      context,
                    ),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _issueCard(BuildContext context, DiagnosticIssue issue) {
    final expanded = _expandedIssues.contains(issue.id);
    final stackExpanded = _expandedStacks.contains(issue.id);
    final details = issue.details;
    return Container(
      key: ValueKey('issue-${issue.id}'),
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          issue.severity == DiagnosticIssueSeverity.error
              ? CupertinoColors.systemRed.withValues(alpha: 0.08)
              : CupertinoColors.tertiarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            diagnosticIssueCategoryLabel(issue.category),
            style: TextStyle(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.secondaryLabel,
                context,
              ),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 3),
          Text(displayText(issue.title),
              style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(displayText(issue.explanation)),
          CupertinoButton(
            key: ValueKey('toggle-issue-${issue.id}'),
            padding: const EdgeInsets.only(top: 7),
            onPressed: () => setState(() {
              if (expanded) {
                _expandedIssues.remove(issue.id);
              } else {
                _expandedIssues.add(issue.id);
              }
            }),
            child: Text(expanded
                ? context.l10n.coreHideTechnicalDetails
                : context.l10n.coreViewTechnicalDetails),
          ),
          if (expanded) ...[
            _technicalRow('refreshId', details.refreshId),
            _technicalRow(context.l10n.coreUtcTime,
                formatUtcDiagnosticTime(details.timestampUtc)),
            _technicalRow(
                context.l10n.coreHttpStatus, '${details.statusCode ?? '-'}'),
            _technicalRow(context.l10n.coreRequestInterface,
                displayText(details.interfaceName)),
            _technicalRow(context.l10n.coreRedactedUrl, details.url ?? '-'),
            _technicalRow(context.l10n.coreExceptionType,
                displayText(details.exceptionType ?? '-')),
            _technicalRow(context.l10n.coreExceptionSummary,
                displayText(details.exceptionSummary ?? '-')),
            if (details.stack != null) ...[
              CupertinoButton(
                key: ValueKey('toggle-stack-${issue.id}'),
                padding: const EdgeInsets.only(top: 6),
                onPressed: () => setState(() {
                  if (stackExpanded) {
                    _expandedStacks.remove(issue.id);
                  } else {
                    _expandedStacks.add(issue.id);
                  }
                }),
                child: Text(stackExpanded
                    ? context.l10n.coreHideStack
                    : context.l10n.coreShowStack),
              ),
              if (stackExpanded)
                Text(
                  details.stack!,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 11),
                ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _globalTimelineCard(
    BuildContext context,
    List<DiagnosticTimelineEvent> events,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: _card(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(context.l10n.coreAppBackgroundCoordination),
            for (final event in events) _timelineRow(context, event),
          ],
        ),
      ),
    );
  }

  Widget _buildRawPage(BuildContext context) {
    final displayText = _loading
        ? context.l10n.coreReadingLogs
        : _logText.isEmpty
            ? context.l10n.coreNoDiagnosticLogs
            : _logText;
    return CupertinoScrollbar(
      child: ListView(
        key: const ValueKey('raw-log-page'),
        padding: const EdgeInsets.only(top: 4, bottom: 24),
        children: [
          CupertinoListSection.insetGrouped(
            header: Text(context.l10n.coreFullRawLogs),
            footer: Text(
              context.l10n.coreRawLogRetention,
            ),
            children: [
              CupertinoListTile(
                title: Text(context.l10n.coreCopyRawLogs),
                onTap: _copy,
              ),
              CupertinoListTile(
                title: Text(_busy
                    ? context.l10n.coreExporting
                    : context.l10n.coreExportShareTxt),
                subtitle: Text(context.l10n.coreExportContents),
                onTap: _busy ? null : _export,
              ),
              CupertinoListTile(
                title: Text(
                  context.l10n.coreClearTestLogs,
                  style: TextStyle(color: CupertinoColors.systemRed),
                ),
                onTap: _confirmClear,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CupertinoDynamicColor.resolve(
                CupertinoColors.secondarySystemGroupedBackground,
                context,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              displayText,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(BuildContext context, {required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.secondarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }

  Widget _noticeCard(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: _card(
        context,
        child: Row(
          children: [
            const Icon(CupertinoIcons.info_circle),
            const SizedBox(width: 10),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }

  Widget _metric(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.tertiarySystemGroupedBackground,
          context,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('$label $value'),
    );
  }

  Widget _flag(String label, bool enabled) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          enabled
              ? CupertinoIcons.check_mark_circled_solid
              : CupertinoIcons.minus_circle,
          size: 15,
        ),
        const SizedBox(width: 4),
        Text('$label ${enabled ? context.l10n.coreYes : context.l10n.coreNo}'),
      ],
    );
  }

  Widget _technicalRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text('$label：$value'),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 0.5,
      margin: const EdgeInsets.only(bottom: 14),
      color: CupertinoDynamicColor.resolve(CupertinoColors.separator, context),
    );
  }

  Color _severityColor(
      BuildContext context, DiagnosticReportSeverity severity) {
    final color = switch (severity) {
      DiagnosticReportSeverity.success => CupertinoColors.systemGreen,
      DiagnosticReportSeverity.degraded => CupertinoColors.systemOrange,
      DiagnosticReportSeverity.failed => CupertinoColors.systemRed,
      DiagnosticReportSeverity.incomplete => CupertinoColors.systemYellow,
      DiagnosticReportSeverity.coordinated => CupertinoColors.systemBlue,
    };
    return CupertinoDynamicColor.resolve(color, context);
  }

  IconData _severityIcon(DiagnosticReportSeverity severity) {
    return switch (severity) {
      DiagnosticReportSeverity.success =>
        CupertinoIcons.check_mark_circled_solid,
      DiagnosticReportSeverity.degraded =>
        CupertinoIcons.exclamationmark_triangle_fill,
      DiagnosticReportSeverity.failed => CupertinoIcons.xmark_circle_fill,
      DiagnosticReportSeverity.incomplete =>
        CupertinoIcons.question_circle_fill,
      DiagnosticReportSeverity.coordinated =>
        CupertinoIcons.arrow_2_circlepath_circle_fill,
    };
  }

  Color _moduleColor(BuildContext context, DiagnosticModuleState state) {
    final color = switch (state) {
      DiagnosticModuleState.liveSuccess => CupertinoColors.systemGreen,
      DiagnosticModuleState.cache => CupertinoColors.systemOrange,
      DiagnosticModuleState.failed => CupertinoColors.systemRed,
      DiagnosticModuleState.notExecuted => CupertinoColors.secondaryLabel,
    };
    return CupertinoDynamicColor.resolve(color, context);
  }
}
