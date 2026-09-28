import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/model/calendar_to_ical.dart';
import 'package:celechron/model/calendar_to_system.dart';
import 'package:celechron/model/period.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(() => AppLanguage.use('zh'));

  test('iCalendar UID is stable across languages and source text stays intact',
      () {
    final period = Period(
      type: PeriodType.classes,
      summary: '高等数学',
      description: '教师: 张老师',
      location: '玉泉校区',
      startTime: DateTime(2026, 9, 28, 8),
      endTime: DateTime(2026, 9, 28, 9, 35),
    );
    AppLanguage.use('zh');
    final chinese = CalendarToIcal.generateIcal(periods: [period]);
    AppLanguage.use('en');
    final english = CalendarToIcal.generateIcal(periods: [period]);
    String uid(String ics) =>
        RegExp(r'^UID:(.*)$', multiLine: true).firstMatch(ics)!.group(1)!;
    expect(uid(english), uid(chinese));
    expect(chinese, contains('DESCRIPTION:教师: 张老师'));
    expect(english, contains('DESCRIPTION:Instructor: 张老师'));
    expect(english, contains('SUMMARY;LANGUAGE=en:高等数学'));
    expect(english, contains('X-WR-CALNAME:ZJU Schedule'));
    expect(period.description, '教师: 张老师');
  });

  test('user event descriptions are never translated', () {
    AppLanguage.use('en');
    final period = Period(
      type: PeriodType.user,
      summary: '教师:',
      description: '教师: My own note',
      startTime: DateTime(2026, 9, 28, 8),
      endTime: DateTime(2026, 9, 28, 9),
    );
    final ics = CalendarToIcal.generateIcal(periods: [period]);
    expect(ics, contains('DESCRIPTION:教师: My own note'));
    expect(ics, contains('SUMMARY;LANGUAGE=en:教师:'));
  });

  test('both legacy and English calendar names resolve to existing IDs', () {
    final unrelated = Calendar(id: 'other', name: 'Personal');
    final legacy = Calendar(
        id: 'legacy-id', name: CalendarToSystemManager.celechronCalendarName);
    final english = Calendar(
        id: 'english-id', name: CalendarToSystemManager.englishCalendarName);
    expect(
        CalendarToSystemManager.findExistingCalendar([unrelated, legacy])?.id,
        'legacy-id');
    expect(
        CalendarToSystemManager.findExistingCalendar([unrelated, english])?.id,
        'english-id');
    expect(CalendarToSystemManager.findExistingCalendar([unrelated]), isNull);
  });
}
