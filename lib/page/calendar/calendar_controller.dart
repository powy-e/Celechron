import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/model/task.dart';
import 'package:celechron/utils/utils.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:celechron/model/period.dart';
import 'package:celechron/model/scholar.dart';
import 'package:celechron/model/semester.dart';

enum CalendarViewMode {
  calendar,
  schedule,
}

class CalendarController extends GetxController {
  final selectedDay = DateTime.now().obs;
  final focusedDay = DateTime.now().obs;
  final calendarFormat = CalendarFormat.month.obs;
  final events = <DateTime, List<Period>>{}.obs;
  final scholar = Get.find<Rx<Scholar>>(tag: 'scholar');
  final taskList = Get.find<RxList<Task>>(tag: 'taskList');
  final viewMode = CalendarViewMode.calendar.obs;

  static List<String> numToChinese = ['一', '二', '三', '四', '五', '六', '七', '八'];

  String dayDescription(DateTime day) {
    var semester = scholar.value.semesters.firstWhereOrNull(
        (e) => !day.isBefore(e.firstDay) && !day.isAfter(e.lastDay));
    if (semester == null) return appL10n.coreExamWeekOrBreak;

    var toFirstWeek = day.difference(semester.firstDay).inDays ~/ 7;
    if (toFirstWeek < 8) {
      if (AppLanguage.isEnglish) {
        return appL10n.coreSeasonWeek(
            displayText(semester.firstHalfName), toFirstWeek + 1);
      }
      return displayText('${semester.name[9]}${numToChinese[toFirstWeek]}周');
    }
    var toLastWeek = 7 - semester.lastDay.difference(day).inDays ~/ 7;
    if (toLastWeek < 8) {
      if (AppLanguage.isEnglish) {
        return appL10n.coreSeasonWeek(
            displayText(semester.secondHalfName), toLastWeek + 1);
      }
      return displayText('${semester.name[10]}${numToChinese[toLastWeek]}周');
    }
    return appL10n.coreExamWeekOrBreak;
  }

  @override
  void onInit() {
    refreshEvents();
    ever(scholar, (callback) => refreshEvents());
    super.onInit();
  }

  void refreshEvents() {
    events.clear();
    Set<DateTime> keySet = {};
    for (var element in Get.find<Rx<Scholar>>(tag: 'scholar').value.periods) {
      DateTime chop = chopDate(element.startTime);
      if (events[chop] == null) events[chop] = <Period>[];
      events[chop]!.add(element);
      keySet.add(chop);
    }
    for (var i in keySet) {
      events[i]!.sort((a, b) => a.startTime.compareTo(b.startTime));
    }
  }

  DateTime chopDate(DateTime day) {
    return DateTime(day.year, day.month, day.day);
  }

  List<Period> getEventsForDay(DateTime day) {
    DateTime chop = chopDate(day);
    var eventsOfDay = <Period>[];
    if (events[chop] != null) {
      for (var event in events[chop]!) {
        eventsOfDay.add(event.copyWith());
      }
    }
    for (var deadline in taskList) {
      if (deadline.type == TaskType.fixed ||
          deadline.type == TaskType.fixedlegacy) {
        List<Period> periods = deadline.getPeriodOfDay(dateOnly(day));
        for (var p in periods) {
          eventsOfDay.add(p);
        }
      }
    }
    eventsOfDay.sort((a, b) => a.startTime.compareTo(b.startTime));
    return eventsOfDay;
  }

  void toggleViewMode() {
    viewMode.value = viewMode.value == CalendarViewMode.calendar
        ? CalendarViewMode.schedule
        : CalendarViewMode.calendar;
  }

  Semester? getCurrentSemester() {
    final now = DateTime.now();
    return scholar.value.semesters.firstWhereOrNull(
      (e) => !now.isBefore(e.firstDay) && !now.isAfter(e.lastDay),
    );
  }

  bool isFirstHalfSemester(Semester semester) {
    final now = DateTime.now();
    final toFirstWeek = now.difference(semester.firstDay).inDays ~/ 7;
    return toFirstWeek < 8;
  }

  String getCurrentSemesterDisplayName() {
    final semester = getCurrentSemester();
    if (semester == null) return appL10n.coreNoSemesterInfo;

    final isFirstHalf = isFirstHalfSemester(semester);
    final semesterName =
        '${semester.name.substring(2, 5)}${semester.name.substring(7, 11)}';
    final halfName =
        isFirstHalf ? semester.firstHalfName : semester.secondHalfName;
    if (AppLanguage.isEnglish) {
      return appL10n.coreSemesterDisplay(
          semester.name.substring(0, 9), displayText(halfName));
    }
    return displayText('$semesterName $halfName学期');
  }
}
