import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/services/diagnostic_report.dart';
import 'package:flutter_test/flutter_test.dart';

import 'diagnostic_log_fixture.dart';

void main() {
  tearDown(() => AppLanguage.use('zh'));

  test('English diagnostic export translates report and preserves raw log', () {
    final raw = buildLatestDiagnosticFixture();
    final bundle = const DiagnosticReportParser().parse(raw);
    AppLanguage.use('en');
    final result = formatDiagnosticExport(
      bundle: bundle,
      rawLog: raw,
      version: '1.2.3',
      buildNumber: '4',
      platform: 'test',
      exportedAt: DateTime.utc(2026, 7, 16, 12),
      utcOffset: const Duration(hours: 8),
    );
    expect(result, contains('Celechron Diagnostic Log'));
    expect(result, contains('Readable diagnostic report'));
    expect(result, contains('Module results'));
    expect(result, contains('Complete raw log (UTC)'));
    expect(result.endsWith(raw), isTrue);
  });

  test('known service error text translates at display boundary', () {
    AppLanguage.use('en');
    expect(displayText('成绩查询出错：请求超时'), contains('Grades'));
    expect(displayText('成绩查询出错：请求超时'), contains('timed out'));
  });
}
