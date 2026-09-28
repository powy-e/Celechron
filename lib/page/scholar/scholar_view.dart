// Official packages
import 'package:celechron/page/scholar/todo/todo_card.dart';
import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/http/zjuServices/exceptions.dart';
import 'package:celechron/utils/platform_features.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Custom widgets and colors
import 'package:celechron/design/multiple_columns.dart';
import 'package:celechron/design/two_line_card.dart';
import 'package:celechron/design/round_rectangle_card.dart';
import 'package:celechron/design/custom_colors.dart';
import 'package:celechron/design/animate_button.dart';
import 'package:celechron/design/refresh_status_indicator.dart';
import 'package:celechron/design/rolling_shimmer_text.dart';

import 'package:celechron/page/search/search_view.dart';
import 'course_list/course_list_view.dart';
import 'course_schedule/course_schedule_view.dart';
import 'exam_list/exam_list_view.dart';
import 'grade_detail/grade_detail_view.dart';
import 'practice_score/practice_score_page.dart';
import 'scholar_controller.dart';
import 'package:celechron/page/option/option_controller.dart';

Future<void> showRefreshResultDialog(
    BuildContext context, List<String?> results) async {
  final messages = results.whereType<String>().toList();
  // 完全成功只通过数据、更新时间和页面状态反馈，不主动打断用户。
  if (messages.isEmpty) return;
  final degraded =
      messages.where(isDegradedRefreshText).toList(growable: false);
  final failures = messages
      .where((message) => !isDegradedRefreshText(message))
      .toList(growable: false);
  if (!context.mounted) return;
  final summaryLines = messages.map((error) {
    final compact = displayText(shortErrorText(error))
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    final prefix = isDegradedRefreshText(error)
        ? '${context.l10n.academicDegraded}: '
        : '${context.l10n.academicFailure}: ';
    final line = '$prefix$compact';
    return line.length <= 100 ? line : '${line.substring(0, 100)}…';
  }).toList();

  await showCupertinoDialog<void>(
    context: context,
    builder: (dialogContext) => CupertinoAlertDialog(
      title: Text(
        context.l10n.academicRefreshProblem(degraded.length, failures.length),
      ),
      content: Text(summaryLines.join('\n')),
      actions: [
        if (messages.isNotEmpty)
          CupertinoDialogAction(
            child: Text(context.l10n.academicViewDetails),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              showCupertinoDialog<void>(
                context: context,
                builder: (detailContext) => CupertinoAlertDialog(
                  title: Text(context.l10n.academicRefreshDetails),
                  content: SingleChildScrollView(
                    child: Text(
                      messages.map((error) {
                        final short = displayText(shortErrorText(error));
                        final details = displayText(detailedErrorText(error));
                        return details == short ? short : '$short\n$details';
                      }).join('\n\n'),
                    ),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(context.l10n.academicOK),
                      onPressed: () => Navigator.of(detailContext).pop(),
                    ),
                  ],
                ),
              );
            },
          ),
        CupertinoDialogAction(
          child: Text(context.l10n.academicOK),
          onPressed: () => Navigator.of(dialogContext).pop(),
        ),
      ],
    ),
  );
}

class ScholarPage extends StatelessWidget {
  ScholarPage({super.key});

  final _scholarController = Get.put(ScholarController());
  final ValueNotifier<bool> _isRefreshing = ValueNotifier(false);

  // 让页内横向列表在桌面端也响应鼠标拖动。外层 PageView 为支持鼠标切页开启了
  // 鼠标拖动，横向列表若不响应鼠标，拖动会漏到 PageView 上造成误切页；
  // 内层可滚动组件在手势竞技中优先，包上后拖动由列表自己消费（触屏行为不变）
  Widget _mouseDraggable(BuildContext context, Widget child) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        dragDevices: {
          ...ScrollConfiguration.of(context).dragDevices,
          PointerDeviceKind.mouse,
        },
      ),
      child: child,
    );
  }

  Widget _buildGradeBrief(BuildContext context) {
    final optionController =
        Get.find<OptionController>(tag: 'optionController');

    String maskGPA(String s) {
      // 绩点隐藏功能
      if (!optionController.hideHomeGpa) return s;
      return s.replaceAll('.', '').replaceAll(RegExp(r'[\d.]'), '*');
    }

    return RoundRectangleCard(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Hero(
                        tag: 'gradeBrief',
                        child: RoundRectangleCardWithForehead(
                            foreheadColor: CustomCupertinoDynamicColors
                                .okGreen.darkColor
                                .withValues(alpha: 0.25),
                            forehead: Obx(() => Row(children: [
                                  // University Icon
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 6, bottom: 6),
                                    child: Icon(
                                      Icons.school,
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.label, context),
                                      size: 18,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6, top: 6, bottom: 6),
                                      child: Text(context.l10n.academicGrades,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                            color:
                                                CupertinoDynamicColor.resolve(
                                                    CupertinoColors.label,
                                                    context),
                                          ))),
                                  const Spacer(),
                                  // alert icon
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, bottom: 4),
                                    child: Icon(
                                      _scholarController
                                                  .durationToLastUpdateGrade
                                                  .inMinutes <
                                              5
                                          ? CupertinoIcons
                                              .check_mark_circled_solid
                                          : CupertinoIcons
                                              .exclamationmark_circle_fill,
                                      color: CupertinoDynamicColor.resolve(
                                          CupertinoColors.label, context),
                                      size: 14,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4,
                                          top: 4,
                                          bottom: 4,
                                          right: 16),
                                      child: Text(
                                          _scholarController
                                                      .durationToLastUpdateGrade
                                                      .inMinutes >
                                                  10000000
                                              ? context.l10n
                                                  .academicFetchProblemShort
                                              : context.l10n
                                                  .academicUpdatedMinutesAgo(
                                                      _scholarController
                                                          .durationToLastUpdateGrade
                                                          .inMinutes),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                            color:
                                                CupertinoDynamicColor.resolve(
                                                    CupertinoColors.label,
                                                    context),
                                          )))
                                ])),
                            onTap: () async =>
                                Navigator.of(context, rootNavigator: true).push(
                                    CupertinoPageRoute(
                                        builder: (context) => GradeDetailPage(),
                                        fullscreenDialog: true)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Obx(() => TwoLineCard(
                                          title: context.l10n.academicFivePoint,
                                          content: maskGPA(_scholarController
                                              .gpa[0]
                                              .toStringAsFixed(2)),
                                          backgroundColor:
                                              CustomCupertinoDynamicColors
                                                  .cyan)),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Obx(() => TwoLineCard(
                                          title: context
                                              .l10n.academicEarnedCredits,
                                          content: maskGPA(_scholarController
                                              .scholar.credit
                                              .toStringAsFixed(1)),
                                          backgroundColor:
                                              CustomCupertinoDynamicColors
                                                  .peach)),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Obx(() => TwoLineCard(
                                          title: context.l10n.academicFourPoint,
                                          content: maskGPA(_scholarController
                                              .gpa[1]
                                              .toStringAsFixed(2)),
                                          extraContent: maskGPA(
                                              _scholarController.gpa[2]
                                                  .toStringAsFixed(2)),
                                          backgroundColor:
                                              CustomCupertinoDynamicColors
                                                  .spring)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Obx(() => TwoLineCard(
                                          title: context.l10n.academicMajorGpa,
                                          content: maskGPA(_scholarController
                                              .scholar.majorGpaAndCredit[0]
                                              .toStringAsFixed(2)),
                                          backgroundColor:
                                              CustomCupertinoDynamicColors
                                                  .sakura)),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Obx(() => TwoLineCard(
                                          title: context
                                              .l10n.academicMajorCreditsShort,
                                          content: maskGPA(_scholarController
                                              .scholar.majorGpaAndCredit[1]
                                              .toStringAsFixed(1)),
                                          backgroundColor:
                                              CustomCupertinoDynamicColors
                                                  .sand)),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Obx(() => TwoLineCard(
                                          title:
                                              context.l10n.academicPercentage,
                                          content: maskGPA(_scholarController
                                              .gpa[3]
                                              .toStringAsFixed(2)),
                                          backgroundColor:
                                              CustomCupertinoDynamicColors
                                                  .magenta)),
                                    ),
                                  ],
                                ),
                              ],
                            )))),
              ],
            ),
          ],
        ));
  }

  Widget _buildSemester(BuildContext context) {
    return RoundRectangleCard(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: RoundRectangleCardWithForehead(
                        animate: false,
                        foreheadColor: CustomCupertinoDynamicColors
                            .cyan.darkColor
                            .withValues(alpha: 0.25),
                        forehead: Obx(() => Row(children: [
                              // University Icon
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 6, bottom: 6),
                                child: Icon(
                                  Icons.calendar_month_rounded,
                                  color: CupertinoDynamicColor.resolve(
                                      CupertinoColors.label, context),
                                  size: 18,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6, top: 6, bottom: 6),
                                  child: Text(context.l10n.academicCourses,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.label, context),
                                      ))),
                              const Spacer(),
                              // alert icon
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, bottom: 4),
                                child: Icon(
                                  _scholarController.durationToLastUpdateCourse
                                              .inMinutes <
                                          5
                                      ? CupertinoIcons.check_mark_circled_solid
                                      : CupertinoIcons
                                          .exclamationmark_circle_fill,
                                  color: CupertinoDynamicColor.resolve(
                                      CupertinoColors.label, context),
                                  size: 14,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, top: 4, bottom: 4, right: 16),
                                  child: Text(
                                      _scholarController
                                                  .durationToLastUpdateCourse
                                                  .inMinutes >
                                              10000000
                                          ? context
                                              .l10n.academicFetchProblemShort
                                          : context.l10n
                                              .academicUpdatedMinutesAgo(
                                                  _scholarController
                                                      .durationToLastUpdateCourse
                                                      .inMinutes),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.label, context),
                                      )))
                            ])),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            MultipleColumns(
                              contents: [
                                Text(
                                    _scholarController
                                        .selectedSemester.courses.length
                                        .toString(),
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                Text(
                                    _scholarController
                                        .selectedSemester.courseCredit
                                        .toString(),
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                Text(
                                    _scholarController
                                        .selectedSemester.examCount
                                        .toString(),
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                              ],
                              titles: [
                                context.l10n.academicCourses,
                                context.l10n.academicCredits,
                                context.l10n.academicExams
                              ],
                              onTaps: [
                                () => Navigator.of(context, rootNavigator: true)
                                    .push(CupertinoPageRoute(
                                        builder: (context) => CourseListPage(
                                            initialSemesterName:
                                                _scholarController
                                                    .selectedSemester.name),
                                        title: context.l10n.academicCourses)),
                                null,
                                () => Navigator.of(context, rootNavigator: true)
                                    .push(CupertinoPageRoute(
                                        builder: (context) => ExamListPage(
                                            initialSemesterName:
                                                _scholarController
                                                    .selectedSemester.name),
                                        title: context.l10n.academicExams))
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TwoLineCard(
                                      animate: true,
                                      // With CupertinoPageTransition
                                      onTap: () =>
                                          Navigator.of(context, rootNavigator: true)
                                              .push(
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  CourseSchedulePage(
                                                      _scholarController
                                                          .selectedSemester
                                                          .name,
                                                      true),
                                              title:
                                                  context.l10n.academicSchedule,
                                            ),
                                          ),
                                      title: context.l10n.academicSemesterHours(
                                          displayText(_scholarController
                                              .selectedSemester.firstHalfName)),
                                      content: context.l10n
                                          .academicSessionsPerTwoWeeks(
                                              _scholarController
                                                  .selectedSemester
                                                  .firstHalfSessionCount),
                                      backgroundColor: _scholarController
                                                  .selectedSemester.name[9] ==
                                              '春'
                                          ? CustomCupertinoDynamicColors.spring
                                          : CustomCupertinoDynamicColors.autumn,
                                      withColoredFont: true),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TwoLineCard(
                                      animate: true,
                                      onTap: () =>
                                          Navigator.of(context, rootNavigator: true)
                                              .push(
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  CourseSchedulePage(
                                                      _scholarController
                                                          .selectedSemester
                                                          .name,
                                                      false),
                                              title:
                                                  context.l10n.academicSchedule,
                                            ),
                                          ),
                                      title: context.l10n.academicSemesterHours(
                                          displayText(_scholarController
                                              .selectedSemester
                                              .secondHalfName)),
                                      content: context.l10n
                                          .academicSessionsPerTwoWeeks(
                                              _scholarController
                                                  .selectedSemester
                                                  .secondHalfSessionCount),
                                      backgroundColor: _scholarController
                                                  .selectedSemester.name[9] ==
                                              '春'
                                          ? CustomCupertinoDynamicColors.summer
                                          : CustomCupertinoDynamicColors.winter,
                                      withColoredFont: true),
                                ),
                              ],
                            ),
                          ],
                        ))),
              ],
            ),
          ],
        ));
  }

  Widget _buildTodos(BuildContext context) {
    return RoundRectangleCard(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: RoundRectangleCardWithForehead(
                        animate: false,
                        foreheadColor: CustomCupertinoDynamicColors
                            .magenta.darkColor
                            .withValues(alpha: 0.25),
                        forehead: Obx(() => Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 6, bottom: 6),
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  color: CupertinoDynamicColor.resolve(
                                      CupertinoColors.label, context),
                                  size: 18,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6, top: 6, bottom: 6),
                                  child: Text(context.l10n.academicAssignment,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.label, context),
                                      ))),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, bottom: 4),
                                child: Icon(
                                  _scholarController
                                              .durationToLastUpdateHomework
                                              .inMinutes <
                                          5
                                      ? CupertinoIcons.check_mark_circled_solid
                                      : CupertinoIcons
                                          .exclamationmark_circle_fill,
                                  color: CupertinoDynamicColor.resolve(
                                      CupertinoColors.label, context),
                                  size: 14,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, top: 4, bottom: 4, right: 16),
                                  child: Text(
                                      _scholarController
                                                  .durationToLastUpdateHomework
                                                  .inMinutes >
                                              10000000
                                          ? context
                                              .l10n.academicFetchProblemShort
                                          : context.l10n.academicUpdatedMinutesAgo(
                                              _scholarController
                                                  .durationToLastUpdateHomework
                                                  .inMinutes),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.label, context),
                                      )))
                            ])),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            MultipleColumns(
                              contents: [
                                Text(_scholarController.todos.length.toString(),
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                Text(
                                    _scholarController.todosInOneDay.length
                                        .toString(),
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                Text(
                                    _scholarController.todosInOneWeek.length
                                        .toString(),
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .navTitleTextStyle
                                        .copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                              ],
                              titles: [
                                context.l10n.academicTotal,
                                context.l10n.academicDueToday,
                                context.l10n.academicDueThisWeek
                              ],
                              onTaps: [() {}, () {}, () {}],
                            ),
                            const SizedBox(height: 16),
                            if (_scholarController.todos.isNotEmpty)
                              SizedBox(
                                  height: 102,
                                  child: _mouseDraggable(
                                      context,
                                      ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              _scholarController.todos.length,
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(width: 8),
                                          itemBuilder: (context, index) {
                                            final todo =
                                                _scholarController.todos[index];
                                            return SizedBox(
                                                width: 200,
                                                child: TodoCard(todo: todo));
                                          })))
                          ],
                        ))),
              ],
            ),
          ],
        ));
  }

  Widget _buildPractice(BuildContext context) {
    return RoundRectangleCard(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: RoundRectangleCardWithForehead(
                        animate: false,
                        foreheadColor: CustomCupertinoDynamicColors
                            .peach.darkColor
                            .withValues(alpha: 0.25),
                        forehead: Obx(() => Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 6, bottom: 6),
                                child: Icon(
                                  Icons.star_rounded,
                                  color: CupertinoDynamicColor.resolve(
                                      CupertinoColors.label, context),
                                  size: 18,
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 6, top: 6, bottom: 6),
                                  child: Text(context.l10n.academicPractice,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.label, context),
                                      ))),
                              const Spacer(),
                              if (!_scholarController
                                  .scholar.isPracticeScoresGet)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, bottom: 4),
                                  child: Icon(
                                    CupertinoIcons.exclamationmark_circle_fill,
                                    color: CupertinoDynamicColor.resolve(
                                        CupertinoColors.label, context),
                                    size: 14,
                                  ),
                                ),
                              if (!_scholarController
                                  .scholar.isPracticeScoresGet)
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, top: 4, bottom: 4, right: 16),
                                    child: Text(
                                        context
                                            .l10n.academicPracticeFetchProblem,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          color: CupertinoDynamicColor.resolve(
                                              CupertinoColors.label, context),
                                        ))),
                            ])),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            Obx(
                              () => PracticeScoreColumns(
                                scholar: _scholarController.scholar,
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ))),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final narrowSearch = MediaQuery.sizeOf(context).width < 360;
    return CupertinoPageScaffold(
        /*backgroundColor: CupertinoDynamicColor.resolve(
            CupertinoColors.systemGroupedBackground, context),*/
        child: CustomScrollView(
      slivers: [
        SliverPinnedToBoxAdapter(
            child: Container(
          decoration: BoxDecoration(
            color: CupertinoDynamicColor.resolve(
                CupertinoColors.systemBackground, context),
            /*boxShadow: [
              BoxShadow(
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.systemGrey5, context),
                offset: const Offset(0, 0),
                blurRadius: 4,
              ),
            ],
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),*/
          ),
          child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 4,
                  top: 8 + MediaQuery.of(context).padding.top),
              child: Column(children: [
                Row(
                  children: [
                    const SizedBox(width: 2),
                    Text(
                      context.l10n.academicAcademics,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .copyWith(fontSize: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Semantics(
                        label: context.l10n.academicSearchCoursesTasks,
                        button: true,
                        child: CupertinoSearchTextField(
                          placeholder: narrowSearch
                              ? ''
                              : context.l10n.academicSearchShort,
                          placeholderStyle: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(
                                  color: CupertinoColors.systemGrey,
                                  height: 1.25,
                                  fontSize: 18),
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .copyWith(height: 1.25, fontSize: 18),
                          borderRadius: BorderRadius.circular(12),
                          itemColor: CupertinoColors.systemGrey,
                          itemSize: 20,
                          suffixInsets:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                          prefixInsets:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 8),
                          onTap: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute(
                                    builder: (context) => SearchPage()));
                          },
                          focusNode: AlwaysDisabledFocusNode(),
                          // Do not popup the keyboard
                        ),
                      ),
                    ),
                    if (PlatformFeatures.isDesktop)
                      ValueListenableBuilder(
                          valueListenable: _isRefreshing,
                          builder: (context, isRefreshing, child) =>
                              CupertinoButton(
                                onPressed: isRefreshing
                                    ? null
                                    : () async {
                                        _isRefreshing.value = true;
                                        late final List<String?> results;
                                        try {
                                          results = await _scholarController
                                              .fetchData();
                                        } finally {
                                          _isRefreshing.value = false;
                                        }
                                        if (context.mounted &&
                                            results.any(
                                                (result) => result != null)) {
                                          await showRefreshResultDialog(
                                              context, results);
                                        }
                                      },
                                child: isRefreshing
                                    ? const CupertinoActivityIndicator()
                                    : Icon(
                                        CupertinoIcons.refresh,
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.systemBlue,
                                            context),
                                        size: 20,
                                      ),
                              ))
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 30,
                        child: _mouseDraggable(
                          context,
                          Obx(
                            () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _scholarController.semesters.length,
                              itemBuilder: (context, index) {
                                final semester =
                                    _scholarController.semesters[index];
                                return Stack(
                                  children: [
                                    Obx(
                                      () => AnimateButton(
                                        text:
                                            '${semester.name.substring(2, 5)}${semester.name.substring(7, 11)}',
                                        onTap: () {
                                          _scholarController
                                              .semesterIndex.value = index;
                                          _scholarController.semesterIndex
                                              .refresh();
                                        },
                                        backgroundColor: _scholarController
                                                    .semesterIndex.value ==
                                                index
                                            ? CustomCupertinoDynamicColors.cyan
                                            : CupertinoColors.systemFill,
                                      ),
                                    ),
                                    const SizedBox(width: 90),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // 桌面端刷新超过 5 秒后的状态条：小转圈 + 滚动文案，随刷新结束收起。
                // 移动端的状态文案由下方 CupertinoSliverRefreshControl 的 builder 展示
                if (PlatformFeatures.isDesktop)
                  Obx(() {
                    final message = displayText(
                        _scholarController.refreshStatusMessage.value ?? '');
                    return AnimatedSize(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      alignment: Alignment.topCenter,
                      // AnimatedSwitcher 让收起时末条文案先淡出、条带再合拢，
                      // 而不是内容瞬间消失
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: message.isEmpty
                            ? const SizedBox(
                                key: ValueKey('refreshStatusStripEmpty'),
                                width: double.infinity)
                            : Padding(
                                key: const ValueKey('refreshStatusStrip'),
                                padding:
                                    const EdgeInsets.only(top: 6, bottom: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CupertinoActivityIndicator(radius: 7),
                                    const SizedBox(width: 6),
                                    Flexible(
                                        child: RollingShimmerText(message)),
                                  ],
                                ),
                              ),
                      ),
                    );
                  }),
                const SizedBox(height: 4),
                Divider(
                  thickness: 0,
                  color: CupertinoDynamicColor.resolve(
                      CupertinoColors.separator, context),
                  height: 14,
                ),
              ])),
        )),
        if (_scholarController.scholar.isLogan)
          CupertinoSliverRefreshControl(
            // 复刻原生转圈，刷新超过 5 秒后在其右侧滚动展示状态文案。
            // Obx 是必需的：刷新驻留期间 sliver 高度不变、builder 不会被重调，
            // 文案更新只能靠响应式重建
            builder: (context, refreshState, pulledExtent,
                    refreshTriggerPullDistance, refreshIndicatorExtent) =>
                Obx(() => RefreshStatusIndicator(
                      refreshState: refreshState,
                      pulledExtent: pulledExtent,
                      refreshTriggerPullDistance: refreshTriggerPullDistance,
                      refreshIndicatorExtent: refreshIndicatorExtent,
                      message: displayText(
                          _scholarController.refreshStatusMessage.value ?? ''),
                    )),
            onRefresh: () async {
              final results = await _scholarController.fetchData();
              if (context.mounted && results.any((result) => result != null)) {
                await showRefreshResultDialog(context, results);
              }
            },
          ),
        SliverToBoxAdapter(
          child: Obx(() {
            if (_scholarController.scholar.semesters.isNotEmpty) {
              return Padding(
                padding: EdgeInsets.only(
                    top: 8,
                    right: 16,
                    left: 16,
                    bottom: MediaQuery.of(context).padding.bottom + 4),
                child: Column(
                  children: _scholarController.scholar.isGrs
                      ? [
                          const SizedBox(height: 12),
                          _buildSemester(context),
                          const SizedBox(height: 12),
                          Divider(
                            thickness: 0,
                            color: CupertinoDynamicColor.resolve(
                                CupertinoColors.separator, context),
                            height: 14,
                          ),
                          const SizedBox(height: 12),
                          _buildTodos(context),
                        ]
                      : [
                          _buildGradeBrief(context),
                          const SizedBox(height: 12),
                          Divider(
                            thickness: 0,
                            color: CupertinoDynamicColor.resolve(
                                CupertinoColors.separator, context),
                            height: 14,
                          ),
                          const SizedBox(height: 12),
                          _buildSemester(context),
                          const SizedBox(height: 12),
                          Divider(
                            thickness: 0,
                            color: CupertinoDynamicColor.resolve(
                                CupertinoColors.separator, context),
                            height: 14,
                          ),
                          const SizedBox(height: 12),
                          _buildTodos(context),
                          const SizedBox(height: 12),
                          Divider(
                            thickness: 0,
                            color: CupertinoDynamicColor.resolve(
                                CupertinoColors.separator, context),
                            height: 14,
                          ),
                          const SizedBox(height: 12),
                          _buildPractice(context),
                          const SizedBox(height: 20),
                        ],
                ),
              );
            } else {
              return SizedBox(
                  height: 500,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Icon(
                          _scholarController.scholar.isLogan
                              ? CupertinoIcons.arrow_clockwise
                              : CupertinoIcons.person_crop_circle,
                          size: 48,
                          color: CupertinoDynamicColor.resolve(
                              CupertinoColors.secondaryLabel, context),
                        ),
                        const SizedBox(height: 12),
                        Text(
                            _scholarController.scholar.isLogan
                                ? context.l10n.academicPullToRefresh
                                : context.l10n.academicNotLoggedIn,
                            style:
                                CupertinoTheme.of(context).textTheme.textStyle),
                        if (_scholarController.scholar.isLogan)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              context.l10n.academicOfflineCacheNote,
                              style: TextStyle(
                                fontSize: 13,
                                color: CupertinoDynamicColor.resolve(
                                    CupertinoColors.secondaryLabel, context),
                              ),
                            ),
                          ),
                        const Spacer()
                      ]));
            }
          }),
        ),
      ],
    ));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
