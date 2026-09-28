import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/design/multiple_columns.dart';
import 'package:celechron/model/practice_score_item.dart';
import 'package:celechron/model/scholar.dart';
import 'package:flutter/cupertino.dart';

class PracticeScoreColumns extends StatelessWidget {
  final Scholar scholar;

  const PracticeScoreColumns({super.key, required this.scholar});

  @override
  Widget build(BuildContext context) {
    Widget score(int categoryId, double value) => Text(
          value.toStringAsFixed(2),
          key: ValueKey('practice-score-category-$categoryId'),
          style: CupertinoTheme.of(context)
              .textTheme
              .navTitleTextStyle
              .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        );

    void open(int categoryId) {
      Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (_) => PracticeScorePage(
            scholar: scholar,
            categoryId: categoryId,
          ),
        ),
      );
    }

    final passed = <String>[
      if (scholar.practiceMyPassed != null)
        context.l10n.academicArtPassed(scholar.practiceMyPassed!
            ? context.l10n.academicPassed
            : context.l10n.academicNotPassed),
      if (scholar.practiceLyPassed != null)
        context.l10n.academicLaborPassed(scholar.practiceLyPassed!
            ? context.l10n.academicPassed
            : context.l10n.academicNotPassed),
    ];
    return Column(
      children: [
        MultipleColumns(
          contents: [
            score(1, scholar.pt2),
            score(2, scholar.pt3),
            score(3, scholar.pt4),
          ],
          titles: [
            context.l10n.academicClassroomPointsShort,
            context.l10n.academicClassroomPointsMid,
            context.l10n.academicClassroomPointsLong
          ],
          onTaps: [
            () => open(1),
            () => open(2),
            () => open(3),
          ],
        ),
        if (passed.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(
            passed.join(' · '),
            key: const ValueKey('practice-passed-status'),
            style: const TextStyle(
              color: CupertinoColors.secondaryLabel,
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }
}

class PracticeScorePage extends StatelessWidget {
  final Scholar scholar;
  final int categoryId;

  const PracticeScorePage({
    super.key,
    required this.scholar,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    final categoryName = switch (categoryId) {
      1 => context.l10n.academicSecondClassroom,
      2 => context.l10n.academicThirdClassroom,
      3 => context.l10n.academicFourthClassroom,
      _ => context.l10n.academicPracticeClassroom,
    };
    final items = scholar.practiceScoreItems
        .where((item) => item.categoryId == categoryId)
        .toList()
      ..sort((a, b) => _sortDate(b).compareTo(_sortDate(a)));
    final included =
        items.where((item) => item.countsTowardTotal).toList(growable: false);
    final excluded =
        items.where((item) => !item.countsTowardTotal).toList(growable: false);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(context.l10n.academicPracticeProjects(categoryName)),
      ),
      backgroundColor: CupertinoDynamicColor.resolve(
        CupertinoColors.systemGroupedBackground,
        context,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            _SummaryCard(
              categoryName: categoryName,
              total: switch (categoryId) {
                1 => scholar.pt2,
                2 => scholar.pt3,
                3 => scholar.pt4,
                _ => 0,
              },
              includedCount: included.length,
              excludedCount: excluded.length,
              source: scholar.practiceSummarySource,
              detailSource: scholar.practiceDataSource,
              updatedAt: scholar.practiceUpdatedAt,
              stale: scholar.practiceSummaryStale,
              detailsStale: scholar.practiceDetailsStale,
            ),
            const SizedBox(height: 16),
            if (!scholar.practiceDetailsAvailable)
              _NoDetailsCard(source: scholar.practiceDataSource)
            else ...[
              _SectionTitle(
                  title: context.l10n.academicCountedTowardTotal,
                  count: included.length),
              if (included.isEmpty)
                _EmptyGroup(text: context.l10n.academicNoCountedProjects)
              else
                ...included.map(
                  (item) => _PracticeItemCard(
                    item: item,
                    onTap: () => _openDetail(context, item),
                  ),
                ),
              const SizedBox(height: 12),
              _SectionTitle(
                  title: context.l10n.academicPendingOrExcluded,
                  count: excluded.length),
              if (excluded.isEmpty)
                _EmptyGroup(text: context.l10n.academicNoPendingProjects)
              else
                ...excluded.map(
                  (item) => _PracticeItemCard(
                    item: item,
                    onTap: () => _openDetail(context, item),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  void _openDetail(BuildContext context, PracticeScoreItem item) {
    Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (_) => PracticeScoreDetailPage(item: item),
      ),
    );
  }

  static DateTime _sortDate(PracticeScoreItem item) =>
      item.updatedAt ?? item.activityStart ?? DateTime(1970);
}

class PracticeScoreDetailPage extends StatelessWidget {
  final PracticeScoreItem item;

  const PracticeScoreDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String)>[
      (context.l10n.academicProjectName, item.projectName),
      (context.l10n.academicPointsEarned, _score(item)),
      (context.l10n.academicClassroomCategory, displayText(item.categoryName)),
      (context.l10n.academicReviewStatus, displayText(item.statusLabel)),
      (context.l10n.academicProjectCategory, displayText(item.projectType)),
      (context.l10n.academicQualityCategory, displayText(item.qualityType)),
      (
        context.l10n.academicRoleOrReason,
        item.role == null
            ? context.l10n.academicNotFilled
            : displayText(item.role!)
      ),
      (
        context.l10n.academicDescription,
        item.remark == null
            ? context.l10n.academicNotFilled
            : displayText(item.remark!)
      ),
      (context.l10n.academicActivityStart, _dateTime(item.activityStart)),
      (context.l10n.academicActivityEnd, _dateTime(item.activityEnd)),
      (context.l10n.academicLastUpdated, _dateTime(item.updatedAt)),
    ];
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text(context.l10n.academicPracticeDetails)),
      backgroundColor: CupertinoDynamicColor.resolve(
        CupertinoColors.systemGroupedBackground,
        context,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          children: [
            _Card(
              child: Column(
                children: [
                  for (var index = 0; index < rows.length; index++) ...[
                    _DetailRow(label: rows[index].$1, value: rows[index].$2),
                    if (index != rows.length - 1) const _Divider(),
                  ],
                ],
              ),
            ),
            if (!item.countsTowardTotal) ...[
              const SizedBox(height: 12),
              Text(
                context.l10n.academicNotCountedNotice,
                style: TextStyle(
                  color: CupertinoColors.systemOrange,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String categoryName;
  final double total;
  final int includedCount;
  final int excludedCount;
  final PracticeSummarySource source;
  final PracticeDataSource detailSource;
  final DateTime? updatedAt;
  final bool stale;
  final bool detailsStale;

  const _SummaryCard({
    required this.categoryName,
    required this.total,
    required this.includedCount,
    required this.excludedCount,
    required this.source,
    required this.detailSource,
    required this.updatedAt,
    required this.stale,
    required this.detailsStale,
  });

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.academicOfficialPointsTotal,
            style: TextStyle(color: CupertinoColors.secondaryLabel),
          ),
          const SizedBox(height: 4),
          Text(
            total.toStringAsFixed(2),
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(context.l10n
              .academicIncludedExcludedCounts(includedCount, excludedCount)),
          const SizedBox(height: 6),
          Text(
            context.l10n.academicPointsSource(displayText(source.label)),
            style: const TextStyle(color: CupertinoColors.secondaryLabel),
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.academicDetailsSource(displayText(detailSource.label)),
            style: const TextStyle(color: CupertinoColors.secondaryLabel),
          ),
          const SizedBox(height: 4),
          Text(
            context.l10n.academicUpdatedAt(_dateTime(updatedAt)),
            style: const TextStyle(color: CupertinoColors.secondaryLabel),
          ),
          if (stale) ...[
            const SizedBox(height: 10),
          Text(
            context.l10n.academicCachedPoints,
              style: TextStyle(color: CupertinoColors.systemOrange),
            ),
          ],
          if (detailsStale) ...[
            const SizedBox(height: 6),
            Text(
              context.l10n.academicCachedDetails,
              style: TextStyle(color: CupertinoColors.systemOrange),
            ),
          ],
          const SizedBox(height: 10),
          Text(
            context.l10n.academicPointsMayDiffer,
            style: TextStyle(
              color: CupertinoColors.secondaryLabel,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _NoDetailsCard extends StatelessWidget {
  final PracticeDataSource source;

  const _NoDetailsCard({required this.source});

  @override
  Widget build(BuildContext context) {
    final zdbkOnly = source == PracticeDataSource.zdbkLive ||
        source == PracticeDataSource.zdbkCache;
    return _Card(
      child: Text(
        zdbkOnly
            ? context.l10n.academicLegacyPracticeOnly
            : context.l10n.academicPracticeDetailsUnavailable,
        key: const ValueKey('practice-no-details'),
        style: const TextStyle(
          color: CupertinoColors.secondaryLabel,
          height: 1.5,
        ),
      ),
    );
  }
}

class _PracticeItemCard extends StatelessWidget {
  final PracticeScoreItem item;
  final VoidCallback onTap;

  const _PracticeItemCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final counted = item.countsTowardTotal;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CupertinoButton(
        key: ValueKey('practice-item-${item.id}'),
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: _Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.projectName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      counted
                          ? displayText(item.statusLabel)
                          : '${displayText(item.statusLabel)} · ${context.l10n.academicNotCounted}',
                      style: TextStyle(
                        color: counted
                            ? CupertinoColors.systemGreen
                            : CupertinoColors.systemOrange,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${displayText(item.projectType)} · ${displayText(item.qualityType)}',
                      style: const TextStyle(
                        color: CupertinoColors.secondaryLabel,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.l10n
                          .academicUpdatedAtShort(_dateTime(item.updatedAt)),
                      style: const TextStyle(
                        color: CupertinoColors.tertiaryLabel,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${counted ? '+' : ''}${_score(item)}',
                style: TextStyle(
                  color: counted
                      ? CupertinoColors.systemGreen
                      : CupertinoColors.label,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                CupertinoIcons.chevron_forward,
                size: 14,
                color: CupertinoColors.tertiaryLabel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final int count;

  const _SectionTitle({required this.title, required this.count});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 10),
        child: Text(
          context.l10n.academicSectionCount(title, count),
          style: const TextStyle(
            color: CupertinoColors.secondaryLabel,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}

class _EmptyGroup extends StatelessWidget {
  final String text;

  const _EmptyGroup({required this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 18),
        child: Text(
          text,
          style: const TextStyle(color: CupertinoColors.secondaryLabel),
        ),
      );
}

class _Card extends StatelessWidget {
  final Widget child;

  const _Card({required this.child});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.secondarySystemGroupedBackground,
            context,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: CupertinoDynamicColor.resolve(
              CupertinoColors.label,
              context,
            ),
            fontSize: 15,
          ),
          child: child,
        ),
      );
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 112,
              child: Text(
                label,
                style: const TextStyle(color: CupertinoColors.secondaryLabel),
              ),
            ),
            Expanded(
              child: Text(value, textAlign: TextAlign.right),
            ),
          ],
        ),
      );
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) => Container(
        height: 0.5,
        color: CupertinoDynamicColor.resolve(
          CupertinoColors.separator,
          context,
        ),
      );
}

String _score(PracticeScoreItem item) => item.score.isFinite && item.score >= 0
    ? item.score.toStringAsFixed(2)
    : '—';

String _dateTime(DateTime? value) {
  if (value == null) return appL10n.academicUnknown;
  String two(int number) => number.toString().padLeft(2, '0');
  return '${value.year}-${two(value.month)}-${two(value.day)} '
      '${two(value.hour)}:${two(value.minute)}';
}
