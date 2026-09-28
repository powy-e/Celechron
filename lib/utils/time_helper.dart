import 'package:celechron/l10n/l10n.dart';
import 'package:intl/intl.dart';
import 'package:celechron/utils/utils.dart';

class TimeHelper {
  static final RegExp _chineseCalendarDatePattern = RegExp(
    r'(\d{4})\s*年\s*(\d{1,2})\s*月\s*(\d{1,2})\s*日',
  );
  static final RegExp _numericCalendarDatePattern = RegExp(
    r'(\d{4})\s*[-/.]\s*(\d{1,2})\s*[-/.]\s*(\d{1,2})',
  );
  static final RegExp _timeRangePattern = RegExp(
    r'[（(]?\s*(\d{1,2}:\d{2})\s*[-–—~～至]\s*(\d{1,2}:\d{2})\s*[）)]?',
  );
  static final RegExp _examWeekDayPattern = RegExp(
    r'第\s*(\d+)\s*天',
  );

  static List<DateTime> parseExamDateTime(String datetimeStr) {
    final timeMatch = _timeRangePattern.firstMatch(datetimeStr);
    final timeBegin = timeMatch?.group(1) ?? '05:14';
    final timeEnd = timeMatch?.group(2) ?? '07:14';
    final calendarMatch = _calendarDateMatch(datetimeStr);
    if (calendarMatch != null) {
      final year = int.parse(calendarMatch.group(1)!);
      final month = int.parse(calendarMatch.group(2)!);
      final day = int.parse(calendarMatch.group(3)!);
      return [
        _dateTimeWithTime(year, month, day, timeBegin),
        _dateTimeWithTime(year, month, day, timeEnd),
      ];
    }

    final examWeekMatch = _examWeekDayPattern.firstMatch(datetimeStr);
    // 校历未出时 zdbk 不会有具体日期，使用 1970 年作为占位。
    final day = int.tryParse(examWeekMatch?.group(1) ?? '') ?? 14;
    final month = _examWeekPlaceholderMonth(datetimeStr);
    return [
      _dateTimeWithTime(1970, month, day, timeBegin),
      _dateTimeWithTime(1970, month, day, timeEnd),
    ];
  }

  static String? parseExamDateLabel(String datetimeStr) {
    if (_calendarDateMatch(datetimeStr) != null) return null;

    final timeMatch = _timeRangePattern.firstMatch(datetimeStr);
    final labelEnd = timeMatch?.start ?? datetimeStr.length;
    final label = datetimeStr
        .substring(0, labelEnd)
        .replaceAll(RegExp(r'[（(\s]+$'), '')
        .trim();
    if (label.isEmpty) return null;

    final normalizedLabel = label.replaceFirstMapped(
      _examWeekDayPattern,
      (match) => '第 ${int.parse(match.group(1)!)} 天',
    );
    return normalizedLabel.startsWith('第')
        ? '考试周$normalizedLabel'
        : normalizedLabel;
  }

  static RegExpMatch? _calendarDateMatch(String datetimeStr) {
    return _chineseCalendarDatePattern.firstMatch(datetimeStr) ??
        _numericCalendarDatePattern.firstMatch(datetimeStr);
  }

  static int _examWeekPlaceholderMonth(String datetimeStr) {
    final season = RegExp(r'[春夏秋冬]').firstMatch(datetimeStr)?.group(0);
    return switch (season) {
      '春' => 1,
      '夏' => 2,
      '秋' => 3,
      '冬' => 4,
      _ => 1,
    };
  }

  static DateTime _dateTimeWithTime(
    int year,
    int month,
    int day,
    String time,
  ) {
    final parts = time.split(':');
    return DateTime(
      year,
      month,
      day,
      int.parse(parts[0]),
      int.parse(parts[1]),
    );
  }

  static String chineseDateTime(DateTime dateTime) {
    if (dateTime.year == 1970) {
      return '${appL10n.sharedExamDay(dateTime.day)} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
    if (AppLanguage.isEnglish) return DateFormat('MMM d, yyyy HH:mm', 'en').format(dateTime);
    return '${dateTime.year} 年 ${dateTime.month} 月 ${dateTime.day} 日 ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  static String chineseDate(DateTime date) {
    if (date.year == 1970) {
      return appL10n.sharedExamDay(date.day);
    }
    if (AppLanguage.isEnglish) return DateFormat.yMMMd('en').format(date);
    return '${date.year} 年 ${date.month} 月 ${date.day} 日';
  }

  static String chineseTime(DateTime begin, DateTime end) {
    return '${chineseDateTime(begin)} - ${end.hour}:${end.minute.toString().padLeft(2, '0')}';
  }

  static String chineseDay(DateTime date) {
    if (date.year == 1970) {
      return '${appL10n.sharedExamDay(date.day)} ';
    }
    if (AppLanguage.isEnglish) return '${DateFormat.MMMd('en').format(date)} ';
    return '${date.month} 月 ${date.day} 日 ';
  }

  static String toHM(Duration duration) {
    var hours = duration.inHours;
    var minutes = duration.inMinutes - hours * 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  static String toHMS(Duration duration) {
    var hours = duration.inHours;
    var minutes = duration.inMinutes - hours * 60;
    var seconds = duration.inSeconds - hours * 3600 - minutes * 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static String chineseDayAfterRelation(DateTime now, DateTime nex) {
    now = dateOnly(now);
    nex = dateOnly(nex);
    int diff = nex.difference(now).inDays;
    if (diff < 0) {
      return appL10n.sharedDaysAgo(-diff);
    } else if (diff == 0) {
      return '';
    } else if (diff == 1) {
      return appL10n.sharedNextDay;
    } else {
      return appL10n.sharedDaysLater(diff);
    }
  }

  static String chineseDayRelation(DateTime date) {
    var day = date.copyWith(
        hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    var today = DateTime.now().copyWith(
        hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    var diff = day.difference(today).inDays;
    if (diff == 0) {
      return '';
    } else if (diff == 1) {
      return appL10n.sharedTomorrow;
    } else if (diff == 2) {
      return appL10n.sharedDayAfterTomorrow;
    } else if (diff == -1) {
      return appL10n.sharedYesterday;
    } else if (diff == -2) {
      return appL10n.sharedDayBeforeYesterday;
    } else {
      return chineseDay(date);
    }
  }
}
