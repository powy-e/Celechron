import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @academicAcademics.
  ///
  /// In zh, this message translates to:
  /// **'学业'**
  String get academicAcademics;

  /// No description provided for @academicActivityEnd.
  ///
  /// In zh, this message translates to:
  /// **'活动结束时间'**
  String get academicActivityEnd;

  /// No description provided for @academicActivityStart.
  ///
  /// In zh, this message translates to:
  /// **'活动开始时间'**
  String get academicActivityStart;

  /// No description provided for @academicArtPassed.
  ///
  /// In zh, this message translates to:
  /// **'美育：{status}'**
  String academicArtPassed(String status);

  /// No description provided for @academicArts.
  ///
  /// In zh, this message translates to:
  /// **'美育'**
  String get academicArts;

  /// No description provided for @academicAssignment.
  ///
  /// In zh, this message translates to:
  /// **'作业'**
  String get academicAssignment;

  /// No description provided for @academicBack.
  ///
  /// In zh, this message translates to:
  /// **'返回'**
  String get academicBack;

  /// No description provided for @academicBasicInfo.
  ///
  /// In zh, this message translates to:
  /// **'基本信息'**
  String get academicBasicInfo;

  /// No description provided for @academicBySemester.
  ///
  /// In zh, this message translates to:
  /// **'按学期'**
  String get academicBySemester;

  /// No description provided for @academicCachedDetails.
  ///
  /// In zh, this message translates to:
  /// **'项目明细为缓存或上一次结果。'**
  String get academicCachedDetails;

  /// No description provided for @academicCachedPoints.
  ///
  /// In zh, this message translates to:
  /// **'当前记点使用缓存或项目合计，请在网络恢复后刷新。'**
  String get academicCachedPoints;

  /// No description provided for @academicCheckPortal.
  ///
  /// In zh, this message translates to:
  /// **'请务必前往教务网核对'**
  String get academicCheckPortal;

  /// No description provided for @academicChooseCourse.
  ///
  /// In zh, this message translates to:
  /// **'要查看哪一个？'**
  String get academicChooseCourse;

  /// No description provided for @academicClassSessions.
  ///
  /// In zh, this message translates to:
  /// **'课时'**
  String get academicClassSessions;

  /// No description provided for @academicClassroomCategory.
  ///
  /// In zh, this message translates to:
  /// **'课堂类别'**
  String get academicClassroomCategory;

  /// No description provided for @academicClassroomPointsLong.
  ///
  /// In zh, this message translates to:
  /// **'四课记点'**
  String get academicClassroomPointsLong;

  /// No description provided for @academicClassroomPointsMid.
  ///
  /// In zh, this message translates to:
  /// **'三课记点'**
  String get academicClassroomPointsMid;

  /// No description provided for @academicClassroomPointsShort.
  ///
  /// In zh, this message translates to:
  /// **'二课记点'**
  String get academicClassroomPointsShort;

  /// No description provided for @academicConflictCourse.
  ///
  /// In zh, this message translates to:
  /// **'冲突课程'**
  String get academicConflictCourse;

  /// No description provided for @academicCountedTowardTotal.
  ///
  /// In zh, this message translates to:
  /// **'已计入总分'**
  String get academicCountedTowardTotal;

  /// No description provided for @academicCourseCode.
  ///
  /// In zh, this message translates to:
  /// **'课号：{code}'**
  String academicCourseCode(String code);

  /// No description provided for @academicCourseCredit.
  ///
  /// In zh, this message translates to:
  /// **'课程'**
  String get academicCourseCredit;

  /// No description provided for @academicCourseCreditValue.
  ///
  /// In zh, this message translates to:
  /// **'{credits} 学分'**
  String academicCourseCreditValue(String credits);

  /// No description provided for @academicCourseDetails.
  ///
  /// In zh, this message translates to:
  /// **'课程详情'**
  String get academicCourseDetails;

  /// No description provided for @academicCourseIdValue.
  ///
  /// In zh, this message translates to:
  /// **'课号：{code}'**
  String academicCourseIdValue(String code);

  /// No description provided for @academicCourses.
  ///
  /// In zh, this message translates to:
  /// **'课程'**
  String get academicCourses;

  /// No description provided for @academicCredits.
  ///
  /// In zh, this message translates to:
  /// **'学分'**
  String get academicCredits;

  /// No description provided for @academicDegraded.
  ///
  /// In zh, this message translates to:
  /// **'降级'**
  String get academicDegraded;

  /// No description provided for @academicDescription.
  ///
  /// In zh, this message translates to:
  /// **'情况说明'**
  String get academicDescription;

  /// No description provided for @academicDetailsSource.
  ///
  /// In zh, this message translates to:
  /// **'项目明细来源：{source}'**
  String academicDetailsSource(String source);

  /// No description provided for @academicDueThisWeek.
  ///
  /// In zh, this message translates to:
  /// **'本周截止'**
  String get academicDueThisWeek;

  /// No description provided for @academicDueToday.
  ///
  /// In zh, this message translates to:
  /// **'一天内'**
  String get academicDueToday;

  /// No description provided for @academicEarnedCredits.
  ///
  /// In zh, this message translates to:
  /// **'获得学分'**
  String get academicEarnedCredits;

  /// No description provided for @academicExamTime.
  ///
  /// In zh, this message translates to:
  /// **'时间：{time}'**
  String academicExamTime(String time);

  /// No description provided for @academicExams.
  ///
  /// In zh, this message translates to:
  /// **'考试'**
  String get academicExams;

  /// No description provided for @academicFailure.
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get academicFailure;

  /// No description provided for @academicFetchProblem.
  ///
  /// In zh, this message translates to:
  /// **'获取数据时遇到问题。请检查网络连接情况，并尝试重新获取数据。\n注意：你需要完成所有的教学评价才能获取成绩信息。'**
  String get academicFetchProblem;

  /// No description provided for @academicFetchProblemShort.
  ///
  /// In zh, this message translates to:
  /// **'获取数据时遇到问题'**
  String get academicFetchProblemShort;

  /// No description provided for @academicFivePoint.
  ///
  /// In zh, this message translates to:
  /// **'五分制'**
  String get academicFivePoint;

  /// No description provided for @academicFourPoint.
  ///
  /// In zh, this message translates to:
  /// **'四分制'**
  String get academicFourPoint;

  /// No description provided for @academicFourthClassroom.
  ///
  /// In zh, this message translates to:
  /// **'第四课堂'**
  String get academicFourthClassroom;

  /// No description provided for @academicFriday.
  ///
  /// In zh, this message translates to:
  /// **'五'**
  String get academicFriday;

  /// No description provided for @academicGrade.
  ///
  /// In zh, this message translates to:
  /// **'成绩：{grade} / {scale}'**
  String academicGrade(String grade, String scale);

  /// No description provided for @academicGradeCredit.
  ///
  /// In zh, this message translates to:
  /// **'{id} / {credits} 学分'**
  String academicGradeCredit(String id, String credits);

  /// No description provided for @academicGradeValue.
  ///
  /// In zh, this message translates to:
  /// **'成绩：{grade} / {scale}'**
  String academicGradeValue(String grade, String scale);

  /// No description provided for @academicGrades.
  ///
  /// In zh, this message translates to:
  /// **'成绩'**
  String get academicGrades;

  /// No description provided for @academicHideCourseInfo.
  ///
  /// In zh, this message translates to:
  /// **'隐藏课程信息'**
  String get academicHideCourseInfo;

  /// No description provided for @academicIncludedExcludedCounts.
  ///
  /// In zh, this message translates to:
  /// **'已计入 {includedCount} 项 · 未计入 {excludedCount} 项'**
  String academicIncludedExcludedCounts(int includedCount, int excludedCount);

  /// No description provided for @academicLabor.
  ///
  /// In zh, this message translates to:
  /// **'劳育'**
  String get academicLabor;

  /// No description provided for @academicLaborPassed.
  ///
  /// In zh, this message translates to:
  /// **'劳育：{status}'**
  String academicLaborPassed(String status);

  /// No description provided for @academicLastUpdated.
  ///
  /// In zh, this message translates to:
  /// **'最近更新时间'**
  String get academicLastUpdated;

  /// No description provided for @academicLegacyPracticeOnly.
  ///
  /// In zh, this message translates to:
  /// **'当前仅获取到旧实践汇总，暂无 getSqjl 项目明细。'**
  String get academicLegacyPracticeOnly;

  /// No description provided for @academicLocation.
  ///
  /// In zh, this message translates to:
  /// **'地点：{location}'**
  String academicLocation(String location);

  /// No description provided for @academicLocationLabel.
  ///
  /// In zh, this message translates to:
  /// **'地点：{location}'**
  String academicLocationLabel(String location);

  /// No description provided for @academicLongPressClear.
  ///
  /// In zh, this message translates to:
  /// **'长按清空'**
  String get academicLongPressClear;

  /// No description provided for @academicMajorCredits.
  ///
  /// In zh, this message translates to:
  /// **'学年主修学分'**
  String get academicMajorCredits;

  /// No description provided for @academicMajorCreditsShort.
  ///
  /// In zh, this message translates to:
  /// **'主修学分'**
  String get academicMajorCreditsShort;

  /// No description provided for @academicMajorFourPoint.
  ///
  /// In zh, this message translates to:
  /// **'学年主修四分制'**
  String get academicMajorFourPoint;

  /// No description provided for @academicMajorGpa.
  ///
  /// In zh, this message translates to:
  /// **'主修均绩'**
  String get academicMajorGpa;

  /// No description provided for @academicMidterm.
  ///
  /// In zh, this message translates to:
  /// **'（期中）'**
  String get academicMidterm;

  /// No description provided for @academicMonday.
  ///
  /// In zh, this message translates to:
  /// **'一'**
  String get academicMonday;

  /// No description provided for @academicNoCountedProjects.
  ///
  /// In zh, this message translates to:
  /// **'暂无已计入总分的项目'**
  String get academicNoCountedProjects;

  /// No description provided for @academicNoEndTime.
  ///
  /// In zh, this message translates to:
  /// **'无'**
  String get academicNoEndTime;

  /// No description provided for @academicNoPendingProjects.
  ///
  /// In zh, this message translates to:
  /// **'暂无审核中或未计入的项目'**
  String get academicNoPendingProjects;

  /// No description provided for @academicNotCounted.
  ///
  /// In zh, this message translates to:
  /// **'未计入总分'**
  String get academicNotCounted;

  /// No description provided for @academicNotCountedNotice.
  ///
  /// In zh, this message translates to:
  /// **'该项目当前未计入总分。'**
  String get academicNotCountedNotice;

  /// No description provided for @academicNotFilled.
  ///
  /// In zh, this message translates to:
  /// **'未填写'**
  String get academicNotFilled;

  /// No description provided for @academicNotLoggedIn.
  ///
  /// In zh, this message translates to:
  /// **'未登录'**
  String get academicNotLoggedIn;

  /// No description provided for @academicNotPassed.
  ///
  /// In zh, this message translates to:
  /// **'未通过'**
  String get academicNotPassed;

  /// No description provided for @academicOK.
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get academicOK;

  /// No description provided for @academicOfficialPointsTotal.
  ///
  /// In zh, this message translates to:
  /// **'正式汇总记点'**
  String get academicOfficialPointsTotal;

  /// No description provided for @academicOfflineCacheNote.
  ///
  /// In zh, this message translates to:
  /// **'离线数据将在同步失败时自动使用'**
  String get academicOfflineCacheNote;

  /// No description provided for @academicOnlineCourse.
  ///
  /// In zh, this message translates to:
  /// **'线上课程'**
  String get academicOnlineCourse;

  /// No description provided for @academicPassed.
  ///
  /// In zh, this message translates to:
  /// **'已通过'**
  String get academicPassed;

  /// No description provided for @academicPendingOrExcluded.
  ///
  /// In zh, this message translates to:
  /// **'审核中或未计入'**
  String get academicPendingOrExcluded;

  /// No description provided for @academicPendingUpdate.
  ///
  /// In zh, this message translates to:
  /// **'待更新'**
  String get academicPendingUpdate;

  /// No description provided for @academicPercentage.
  ///
  /// In zh, this message translates to:
  /// **'百分制'**
  String get academicPercentage;

  /// No description provided for @academicPointsEarned.
  ///
  /// In zh, this message translates to:
  /// **'获得记点'**
  String get academicPointsEarned;

  /// No description provided for @academicPointsMayDiffer.
  ///
  /// In zh, this message translates to:
  /// **'正式汇总与项目记录可能不完全一致，项目明细仍按 getSqjl 原样展示。'**
  String get academicPointsMayDiffer;

  /// No description provided for @academicPointsSource.
  ///
  /// In zh, this message translates to:
  /// **'记点来源：{source}'**
  String academicPointsSource(String source);

  /// No description provided for @academicPractice.
  ///
  /// In zh, this message translates to:
  /// **'实践'**
  String get academicPractice;

  /// No description provided for @academicPracticeClassroom.
  ///
  /// In zh, this message translates to:
  /// **'实践课堂'**
  String get academicPracticeClassroom;

  /// No description provided for @academicPracticeDetails.
  ///
  /// In zh, this message translates to:
  /// **'实践项目详情'**
  String get academicPracticeDetails;

  /// No description provided for @academicPracticeDetailsUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'当前 getSqjl 项目明细不可用，请稍后刷新。'**
  String get academicPracticeDetailsUnavailable;

  /// No description provided for @academicPracticeFetchProblem.
  ///
  /// In zh, this message translates to:
  /// **'获取实践记点时遇到问题'**
  String get academicPracticeFetchProblem;

  /// No description provided for @academicPracticeProjects.
  ///
  /// In zh, this message translates to:
  /// **'{category}项目'**
  String academicPracticeProjects(String category);

  /// No description provided for @academicProjectCategory.
  ///
  /// In zh, this message translates to:
  /// **'项目类别'**
  String get academicProjectCategory;

  /// No description provided for @academicProjectName.
  ///
  /// In zh, this message translates to:
  /// **'项目名称'**
  String get academicProjectName;

  /// No description provided for @academicPullToRefresh.
  ///
  /// In zh, this message translates to:
  /// **'下拉刷新以获取数据'**
  String get academicPullToRefresh;

  /// No description provided for @academicQualityCategory.
  ///
  /// In zh, this message translates to:
  /// **'素质类别'**
  String get academicQualityCategory;

  /// No description provided for @academicRefreshDetails.
  ///
  /// In zh, this message translates to:
  /// **'刷新详情'**
  String get academicRefreshDetails;

  /// No description provided for @academicRefreshProblem.
  ///
  /// In zh, this message translates to:
  /// **'刷新遇到问题：{degradedCount} 项降级，{failureCount} 项失败'**
  String academicRefreshProblem(int degradedCount, int failureCount);

  /// No description provided for @academicReset.
  ///
  /// In zh, this message translates to:
  /// **'重置'**
  String get academicReset;

  /// No description provided for @academicRetry.
  ///
  /// In zh, this message translates to:
  /// **'重新获取数据'**
  String get academicRetry;

  /// No description provided for @academicReviewStatus.
  ///
  /// In zh, this message translates to:
  /// **'审核状态'**
  String get academicReviewStatus;

  /// No description provided for @academicRoleOrReason.
  ///
  /// In zh, this message translates to:
  /// **'参与身份或得分原因'**
  String get academicRoleOrReason;

  /// No description provided for @academicSaturday.
  ///
  /// In zh, this message translates to:
  /// **'六'**
  String get academicSaturday;

  /// No description provided for @academicSchedule.
  ///
  /// In zh, this message translates to:
  /// **'课表'**
  String get academicSchedule;

  /// No description provided for @academicSchoolYearCredits.
  ///
  /// In zh, this message translates to:
  /// **'学年学分'**
  String get academicSchoolYearCredits;

  /// No description provided for @academicSchoolYearFourPoint.
  ///
  /// In zh, this message translates to:
  /// **'学年四分制'**
  String get academicSchoolYearFourPoint;

  /// No description provided for @academicSchoolYearGpa.
  ///
  /// In zh, this message translates to:
  /// **'学年均绩'**
  String get academicSchoolYearGpa;

  /// No description provided for @academicSearchCoursesTasks.
  ///
  /// In zh, this message translates to:
  /// **'搜索课程、事项...'**
  String get academicSearchCoursesTasks;

  /// No description provided for @academicSearchShort.
  ///
  /// In zh, this message translates to:
  /// **'搜索'**
  String get academicSearchShort;

  /// No description provided for @academicSeat.
  ///
  /// In zh, this message translates to:
  /// **'座位：{seat}'**
  String academicSeat(String seat);

  /// No description provided for @academicSeatLabel.
  ///
  /// In zh, this message translates to:
  /// **'座位：{seat}'**
  String academicSeatLabel(String seat);

  /// No description provided for @academicSecondClassroom.
  ///
  /// In zh, this message translates to:
  /// **'第二课堂'**
  String get academicSecondClassroom;

  /// No description provided for @academicSectionCount.
  ///
  /// In zh, this message translates to:
  /// **'{title}（{count}）'**
  String academicSectionCount(String title, int count);

  /// No description provided for @academicSelectAll.
  ///
  /// In zh, this message translates to:
  /// **'全选'**
  String get academicSelectAll;

  /// No description provided for @academicSelectedCredits.
  ///
  /// In zh, this message translates to:
  /// **'已选学分'**
  String get academicSelectedCredits;

  /// No description provided for @academicSelectedFivePoint.
  ///
  /// In zh, this message translates to:
  /// **'已选五分制'**
  String get academicSelectedFivePoint;

  /// No description provided for @academicSelectedFourPoint.
  ///
  /// In zh, this message translates to:
  /// **'已选四分制'**
  String get academicSelectedFourPoint;

  /// No description provided for @academicSelectedPercentage.
  ///
  /// In zh, this message translates to:
  /// **'已选百分制'**
  String get academicSelectedPercentage;

  /// No description provided for @academicSemesterHours.
  ///
  /// In zh, this message translates to:
  /// **'{semester}学期课时'**
  String academicSemesterHours(String semester);

  /// No description provided for @academicSemesterSuffix.
  ///
  /// In zh, this message translates to:
  /// **'{semester}学期课时'**
  String academicSemesterSuffix(String semester);

  /// No description provided for @academicSessionCount.
  ///
  /// In zh, this message translates to:
  /// **'{count}节/两周'**
  String academicSessionCount(int count);

  /// No description provided for @academicSessionsPerTwoWeeks.
  ///
  /// In zh, this message translates to:
  /// **'{count}节/两周'**
  String academicSessionsPerTwoWeeks(double count);

  /// No description provided for @academicSunday.
  ///
  /// In zh, this message translates to:
  /// **'日'**
  String get academicSunday;

  /// No description provided for @academicTeacher.
  ///
  /// In zh, this message translates to:
  /// **'教师：{teacher}'**
  String academicTeacher(String teacher);

  /// No description provided for @academicTeacherValue.
  ///
  /// In zh, this message translates to:
  /// **'教师：{teacher}'**
  String academicTeacherValue(String teacher);

  /// No description provided for @academicThirdClassroom.
  ///
  /// In zh, this message translates to:
  /// **'第三课堂'**
  String get academicThirdClassroom;

  /// No description provided for @academicThursday.
  ///
  /// In zh, this message translates to:
  /// **'四'**
  String get academicThursday;

  /// No description provided for @academicTimeLabel.
  ///
  /// In zh, this message translates to:
  /// **'时间：{time}'**
  String academicTimeLabel(String time);

  /// No description provided for @academicTotal.
  ///
  /// In zh, this message translates to:
  /// **'总计'**
  String get academicTotal;

  /// No description provided for @academicTuesday.
  ///
  /// In zh, this message translates to:
  /// **'二'**
  String get academicTuesday;

  /// No description provided for @academicUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未知'**
  String get academicUnknown;

  /// No description provided for @academicUnselectedFivePoint.
  ///
  /// In zh, this message translates to:
  /// **'未选五分制'**
  String get academicUnselectedFivePoint;

  /// No description provided for @academicUnselectedFourPoint.
  ///
  /// In zh, this message translates to:
  /// **'未选四分制'**
  String get academicUnselectedFourPoint;

  /// No description provided for @academicUpdatedAt.
  ///
  /// In zh, this message translates to:
  /// **'更新时间：{time}'**
  String academicUpdatedAt(String time);

  /// No description provided for @academicUpdatedAtShort.
  ///
  /// In zh, this message translates to:
  /// **'更新于 {time}'**
  String academicUpdatedAtShort(String time);

  /// No description provided for @academicUpdatedMinutesAgo.
  ///
  /// In zh, this message translates to:
  /// **'更新于 {minutes} 分钟前'**
  String academicUpdatedMinutesAgo(int minutes);

  /// No description provided for @academicViewDetails.
  ///
  /// In zh, this message translates to:
  /// **'查看详情'**
  String get academicViewDetails;

  /// No description provided for @academicWednesday.
  ///
  /// In zh, this message translates to:
  /// **'三'**
  String get academicWednesday;

  /// No description provided for @academicWeight.
  ///
  /// In zh, this message translates to:
  /// **'加权比例'**
  String get academicWeight;

  /// No description provided for @academicWeightedCredits.
  ///
  /// In zh, this message translates to:
  /// **'加权学分'**
  String get academicWeightedCredits;

  /// No description provided for @academicWeightedFivePoint.
  ///
  /// In zh, this message translates to:
  /// **'加权五分制'**
  String get academicWeightedFivePoint;

  /// No description provided for @academicWeightedGrades.
  ///
  /// In zh, this message translates to:
  /// **'加权成绩'**
  String get academicWeightedGrades;

  /// No description provided for @academicRefreshingCalendar.
  ///
  /// In zh, this message translates to:
  /// **'正在同步校历...'**
  String get academicRefreshingCalendar;

  /// No description provided for @academicFetchingSchedule.
  ///
  /// In zh, this message translates to:
  /// **'正在获取课表...'**
  String get academicFetchingSchedule;

  /// No description provided for @academicParsingExams.
  ///
  /// In zh, this message translates to:
  /// **'正在解析考试安排...'**
  String get academicParsingExams;

  /// No description provided for @academicWaitingGrades.
  ///
  /// In zh, this message translates to:
  /// **'正在等待成绩数据...'**
  String get academicWaitingGrades;

  /// No description provided for @academicCheckingMajorGrades.
  ///
  /// In zh, this message translates to:
  /// **'正在核对主修成绩...'**
  String get academicCheckingMajorGrades;

  /// No description provided for @academicSyncingAssignments.
  ///
  /// In zh, this message translates to:
  /// **'正在同步作业列表...'**
  String get academicSyncingAssignments;

  /// No description provided for @academicCountingPracticeCredits.
  ///
  /// In zh, this message translates to:
  /// **'正在统计实践学分...'**
  String get academicCountingPracticeCredits;

  /// No description provided for @academicParsingUndergraduateExams.
  ///
  /// In zh, this message translates to:
  /// **'正在解析本科生考试...'**
  String get academicParsingUndergraduateExams;

  /// No description provided for @academicWaitingUndergraduateGrades.
  ///
  /// In zh, this message translates to:
  /// **'正在等待本科生成绩...'**
  String get academicWaitingUndergraduateGrades;

  /// No description provided for @academicParsingGraduateExams.
  ///
  /// In zh, this message translates to:
  /// **'正在解析研究生考试...'**
  String get academicParsingGraduateExams;

  /// No description provided for @academicWaitingGraduateGrades.
  ///
  /// In zh, this message translates to:
  /// **'正在等待研究生成绩...'**
  String get academicWaitingGraduateGrades;

  /// No description provided for @academicCalendarUpdated.
  ///
  /// In zh, this message translates to:
  /// **'校历已更新'**
  String get academicCalendarUpdated;

  /// No description provided for @academicScheduleFetched.
  ///
  /// In zh, this message translates to:
  /// **'成功获取课表'**
  String get academicScheduleFetched;

  /// No description provided for @academicExamsFetched.
  ///
  /// In zh, this message translates to:
  /// **'成功获取考试安排'**
  String get academicExamsFetched;

  /// No description provided for @academicGradesFetched.
  ///
  /// In zh, this message translates to:
  /// **'成功获取考试成绩'**
  String get academicGradesFetched;

  /// No description provided for @academicMajorGradesUpdated.
  ///
  /// In zh, this message translates to:
  /// **'主修成绩已更新'**
  String get academicMajorGradesUpdated;

  /// No description provided for @academicAssignmentsFetched.
  ///
  /// In zh, this message translates to:
  /// **'成功获取作业列表'**
  String get academicAssignmentsFetched;

  /// No description provided for @academicActivityCreditsUpdated.
  ///
  /// In zh, this message translates to:
  /// **'实践学分已更新'**
  String get academicActivityCreditsUpdated;

  /// No description provided for @academicConfigUpdated.
  ///
  /// In zh, this message translates to:
  /// **'校历已更新'**
  String get academicConfigUpdated;

  /// No description provided for @academicUndergraduateExamsFetched.
  ///
  /// In zh, this message translates to:
  /// **'成功获取本科生考试'**
  String get academicUndergraduateExamsFetched;

  /// No description provided for @academicUndergraduateGradesFetched.
  ///
  /// In zh, this message translates to:
  /// **'成功获取本科生成绩'**
  String get academicUndergraduateGradesFetched;

  /// No description provided for @academicGraduateExamsFetched.
  ///
  /// In zh, this message translates to:
  /// **'成功获取研究生考试'**
  String get academicGraduateExamsFetched;

  /// No description provided for @academicGraduateGradesFetched.
  ///
  /// In zh, this message translates to:
  /// **'成功获取研究生成绩'**
  String get academicGraduateGradesFetched;

  /// No description provided for @academicCalendarFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'校历获取失败'**
  String get academicCalendarFetchFailed;

  /// No description provided for @academicScheduleFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'课表获取失败'**
  String get academicScheduleFetchFailed;

  /// No description provided for @academicExamsFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'考试安排获取失败'**
  String get academicExamsFetchFailed;

  /// No description provided for @academicGradesFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'成绩获取失败'**
  String get academicGradesFetchFailed;

  /// No description provided for @academicMajorGradesFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'主修成绩获取失败'**
  String get academicMajorGradesFetchFailed;

  /// No description provided for @academicAssignmentsFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'作业获取失败'**
  String get academicAssignmentsFetchFailed;

  /// No description provided for @academicActivityCreditsFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'实践学分获取失败'**
  String get academicActivityCreditsFetchFailed;

  /// No description provided for @academicConfigFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'校历配置获取失败'**
  String get academicConfigFetchFailed;

  /// No description provided for @academicUndergraduateExamsFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'本科生考试获取失败'**
  String get academicUndergraduateExamsFetchFailed;

  /// No description provided for @academicUndergraduateGradesFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'本科生成绩获取失败'**
  String get academicUndergraduateGradesFetchFailed;

  /// No description provided for @academicGraduateExamsFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'研究生考试获取失败'**
  String get academicGraduateExamsFetchFailed;

  /// No description provided for @academicGraduateGradesFetchFailed.
  ///
  /// In zh, this message translates to:
  /// **'研究生成绩获取失败'**
  String get academicGraduateGradesFetchFailed;

  /// No description provided for @academicSyncingData.
  ///
  /// In zh, this message translates to:
  /// **'正在同步教务数据...'**
  String get academicSyncingData;

  /// No description provided for @academicWaitingServer.
  ///
  /// In zh, this message translates to:
  /// **'正在等待服务器响应...'**
  String get academicWaitingServer;

  /// No description provided for @academicStillFetching.
  ///
  /// In zh, this message translates to:
  /// **'仍在努力获取中...'**
  String get academicStillFetching;

  /// No description provided for @academicFinishingRefresh.
  ///
  /// In zh, this message translates to:
  /// **'正在完成刷新...'**
  String get academicFinishingRefresh;

  /// Core UI: coreUpNext
  ///
  /// In zh, this message translates to:
  /// **'接下来'**
  String get coreUpNext;

  /// Core UI: coreCalendar
  ///
  /// In zh, this message translates to:
  /// **'日程'**
  String get coreCalendar;

  /// Core UI: coreTasks
  ///
  /// In zh, this message translates to:
  /// **'任务'**
  String get coreTasks;

  /// Core UI: coreAcademics
  ///
  /// In zh, this message translates to:
  /// **'学业'**
  String get coreAcademics;

  /// Core UI: coreSettings
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get coreSettings;

  /// Core UI: coreUpdateAvailable
  ///
  /// In zh, this message translates to:
  /// **'更新可用'**
  String get coreUpdateAvailable;

  /// Core UI: coreIgnore
  ///
  /// In zh, this message translates to:
  /// **'忽略'**
  String get coreIgnore;

  /// Core UI: coreVisitWebsite
  ///
  /// In zh, this message translates to:
  /// **'访问网站'**
  String get coreVisitWebsite;

  /// Core UI: coreTimeUntilEnd
  ///
  /// In zh, this message translates to:
  /// **'离结束还有'**
  String get coreTimeUntilEnd;

  /// Core UI: coreTimeUntilStart
  ///
  /// In zh, this message translates to:
  /// **'开始还有'**
  String get coreTimeUntilStart;

  /// Core UI: coreStartPlanning
  ///
  /// In zh, this message translates to:
  /// **'开始规划'**
  String get coreStartPlanning;

  /// Core UI: coreTapToChangeStartTime
  ///
  /// In zh, this message translates to:
  /// **'点击修改开始时间'**
  String get coreTapToChangeStartTime;

  /// Core UI: coreBack
  ///
  /// In zh, this message translates to:
  /// **'返回'**
  String get coreBack;

  /// Core UI: coreConfirm
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get coreConfirm;

  /// Core UI: coreBreakTimeShortened
  ///
  /// In zh, this message translates to:
  /// **'休息时间已压缩'**
  String get coreBreakTimeShortened;

  /// Core UI: coreStartTimeMustBeFuture
  ///
  /// In zh, this message translates to:
  /// **'开始时间必须晚于现在'**
  String get coreStartTimeMustBeFuture;

  /// Core UI: coreAdjustStartTime
  ///
  /// In zh, this message translates to:
  /// **'请调整开始时间。'**
  String get coreAdjustStartTime;

  /// Core UI: coreCreate
  ///
  /// In zh, this message translates to:
  /// **'创建'**
  String get coreCreate;

  /// Core UI: corePlanExpired
  ///
  /// In zh, this message translates to:
  /// **'规划方案已过期'**
  String get corePlanExpired;

  /// Core UI: coreReplan
  ///
  /// In zh, this message translates to:
  /// **'重新规划'**
  String get coreReplan;

  /// Core UI: coreNothingToDoToday
  ///
  /// In zh, this message translates to:
  /// **'今日无事可做'**
  String get coreNothingToDoToday;

  /// Core UI: coreInProgress
  ///
  /// In zh, this message translates to:
  /// **'正在进行'**
  String get coreInProgress;

  /// Core UI: coreStartingSoon
  ///
  /// In zh, this message translates to:
  /// **'即将开始'**
  String get coreStartingSoon;

  /// Core UI: coreLaterPlans
  ///
  /// In zh, this message translates to:
  /// **'之后的安排'**
  String get coreLaterPlans;

  /// Core UI: coreExamWeekOrBreak
  ///
  /// In zh, this message translates to:
  /// **'考试周/假期'**
  String get coreExamWeekOrBreak;

  /// Core UI: coreNoSemesterInfo
  ///
  /// In zh, this message translates to:
  /// **'无学期信息'**
  String get coreNoSemesterInfo;

  /// Core UI: coreOutsideSemester
  ///
  /// In zh, this message translates to:
  /// **'当前不在学期内'**
  String get coreOutsideSemester;

  /// Core UI: coreToday
  ///
  /// In zh, this message translates to:
  /// **'今天'**
  String get coreToday;

  /// Core UI: coreSwitchView
  ///
  /// In zh, this message translates to:
  /// **'切换视图'**
  String get coreSwitchView;

  /// Core UI: coreShowFullMonth
  ///
  /// In zh, this message translates to:
  /// **'显示整月'**
  String get coreShowFullMonth;

  /// Core UI: coreShowWeek
  ///
  /// In zh, this message translates to:
  /// **'显示一周'**
  String get coreShowWeek;

  /// Core UI: coreRepeatedEventUpcoming
  ///
  /// In zh, this message translates to:
  /// **'重复日程，接下来的时段：'**
  String get coreRepeatedEventUpcoming;

  /// Core UI: coreEdit
  ///
  /// In zh, this message translates to:
  /// **'编辑'**
  String get coreEdit;

  /// Core UI: coreDelete
  ///
  /// In zh, this message translates to:
  /// **'删除'**
  String get coreDelete;

  /// Core UI: coreTimePlanning
  ///
  /// In zh, this message translates to:
  /// **'时间规划'**
  String get coreTimePlanning;

  /// Core UI: coreExpectedDuration
  ///
  /// In zh, this message translates to:
  /// **'预期用时'**
  String get coreExpectedDuration;

  /// Core UI: coreHours
  ///
  /// In zh, this message translates to:
  /// **'小时'**
  String get coreHours;

  /// Core UI: coreMinutes
  ///
  /// In zh, this message translates to:
  /// **'分钟'**
  String get coreMinutes;

  /// Core UI: coreTimeSpent
  ///
  /// In zh, this message translates to:
  /// **'已经用时'**
  String get coreTimeSpent;

  /// Core UI: coreAllowBreaks
  ///
  /// In zh, this message translates to:
  /// **'允许插入休息时间'**
  String get coreAllowBreaks;

  /// Core UI: coreEventSettings
  ///
  /// In zh, this message translates to:
  /// **'日程设置'**
  String get coreEventSettings;

  /// Core UI: coreRepeat
  ///
  /// In zh, this message translates to:
  /// **'重复'**
  String get coreRepeat;

  /// Core UI: coreRepeatInterval
  ///
  /// In zh, this message translates to:
  /// **'重复周期'**
  String get coreRepeatInterval;

  /// Core UI: coreRepeatUntil
  ///
  /// In zh, this message translates to:
  /// **'重复截止日期'**
  String get coreRepeatUntil;

  /// Core UI: coreExcludeFromPlanning
  ///
  /// In zh, this message translates to:
  /// **'不在这个日程中安排任务'**
  String get coreExcludeFromPlanning;

  /// Core UI: coreAdditionalInfo
  ///
  /// In zh, this message translates to:
  /// **'附加信息'**
  String get coreAdditionalInfo;

  /// Core UI: coreLocation
  ///
  /// In zh, this message translates to:
  /// **'地点'**
  String get coreLocation;

  /// Core UI: coreDescription
  ///
  /// In zh, this message translates to:
  /// **'说明'**
  String get coreDescription;

  /// Core UI: coreDeleteTask
  ///
  /// In zh, this message translates to:
  /// **'删除任务'**
  String get coreDeleteTask;

  /// Core UI: coreNotStarted
  ///
  /// In zh, this message translates to:
  /// **'未开始'**
  String get coreNotStarted;

  /// Core UI: coreEnded
  ///
  /// In zh, this message translates to:
  /// **'已结束'**
  String get coreEnded;

  /// Core UI: coreOngoing
  ///
  /// In zh, this message translates to:
  /// **'进行中'**
  String get coreOngoing;

  /// Core UI: coreDeleteCompletedTasks
  ///
  /// In zh, this message translates to:
  /// **'删除已完成任务'**
  String get coreDeleteCompletedTasks;

  /// Core UI: coreDeleteExpiredTasks
  ///
  /// In zh, this message translates to:
  /// **'删除已过期任务'**
  String get coreDeleteExpiredTasks;

  /// Core UI: corePauseAllTasks
  ///
  /// In zh, this message translates to:
  /// **'暂停所有任务'**
  String get corePauseAllTasks;

  /// Core UI: coreResumeAllTasks
  ///
  /// In zh, this message translates to:
  /// **'继续所有任务'**
  String get coreResumeAllTasks;

  /// Core UI: coreCancel
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get coreCancel;

  /// Core UI: coreNoTasks
  ///
  /// In zh, this message translates to:
  /// **'没有任务'**
  String get coreNoTasks;

  /// Core UI: coreToDo
  ///
  /// In zh, this message translates to:
  /// **'待办'**
  String get coreToDo;

  /// Core UI: coreCompleted
  ///
  /// In zh, this message translates to:
  /// **'已完成'**
  String get coreCompleted;

  /// Core UI: coreEventList
  ///
  /// In zh, this message translates to:
  /// **'日程列表'**
  String get coreEventList;

  /// Core UI: coreSearchPlaceholder
  ///
  /// In zh, this message translates to:
  /// **'搜索课程、事项...'**
  String get coreSearchPlaceholder;

  /// Core UI: coreSecurityVerification
  ///
  /// In zh, this message translates to:
  /// **'安全验证'**
  String get coreSecurityVerification;

  /// Core UI: coreTapImageToRefresh
  ///
  /// In zh, this message translates to:
  /// **'点击图片刷新'**
  String get coreTapImageToRefresh;

  /// Core UI: coreEnterCaptcha
  ///
  /// In zh, this message translates to:
  /// **'请输入验证码'**
  String get coreEnterCaptcha;

  /// Core UI: coreCampusLogin
  ///
  /// In zh, this message translates to:
  /// **'统一身份认证登录'**
  String get coreCampusLogin;

  /// Core UI: coreStudentId
  ///
  /// In zh, this message translates to:
  /// **'学号'**
  String get coreStudentId;

  /// Core UI: corePassword
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get corePassword;

  /// Core UI: coreLoginFailed
  ///
  /// In zh, this message translates to:
  /// **'登录失败'**
  String get coreLoginFailed;

  /// Core UI: coreLogin
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get coreLogin;

  /// Core UI: corePaymentCode
  ///
  /// In zh, this message translates to:
  /// **'付款码'**
  String get corePaymentCode;

  /// Core UI: coreLoading
  ///
  /// In zh, this message translates to:
  /// **'加载中...'**
  String get coreLoading;

  /// Core UI: coreRefreshQrCode
  ///
  /// In zh, this message translates to:
  /// **'刷新二维码'**
  String get coreRefreshQrCode;

  /// Core UI: coreOriginalCourseCode
  ///
  /// In zh, this message translates to:
  /// **'原课号'**
  String get coreOriginalCourseCode;

  /// Core UI: coreNewCourseCode
  ///
  /// In zh, this message translates to:
  /// **'新课号'**
  String get coreNewCourseCode;

  /// Core UI: coreDisplayName
  ///
  /// In zh, this message translates to:
  /// **'备注名'**
  String get coreDisplayName;

  /// Core UI: coreError
  ///
  /// In zh, this message translates to:
  /// **'错误'**
  String get coreError;

  /// Core UI: coreFillAllFields
  ///
  /// In zh, this message translates to:
  /// **'请填写所有字段'**
  String get coreFillAllFields;

  /// Core UI: coreSave
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get coreSave;

  /// Core UI: coreCustomCourseCodeMapping
  ///
  /// In zh, this message translates to:
  /// **'自定义课程代码映射'**
  String get coreCustomCourseCodeMapping;

  /// Core UI: coreAddMapping
  ///
  /// In zh, this message translates to:
  /// **'添加新的映射关系'**
  String get coreAddMapping;

  /// Core UI: coreAcademicPortal
  ///
  /// In zh, this message translates to:
  /// **'教务'**
  String get coreAcademicPortal;

  /// Core UI: coreBackgroundRefreshExplanation
  ///
  /// In zh, this message translates to:
  /// **'Celechron 将不定期自动运行以刷新数据。请开启通知权限，且不要将 Celechron 从后台中移除。'**
  String get coreBackgroundRefreshExplanation;

  /// Core UI: coreLogOut
  ///
  /// In zh, this message translates to:
  /// **'退出'**
  String get coreLogOut;

  /// Core UI: coreLogOutTitle
  ///
  /// In zh, this message translates to:
  /// **'退出登录'**
  String get coreLogOutTitle;

  /// Core UI: coreConfirmLogOut
  ///
  /// In zh, this message translates to:
  /// **'确定要退出当前账号吗？'**
  String get coreConfirmLogOut;

  /// Core UI: coreRetakeGpaCalculation
  ///
  /// In zh, this message translates to:
  /// **'重修绩点计算'**
  String get coreRetakeGpaCalculation;

  /// Core UI: coreUseFirstAttempt
  ///
  /// In zh, this message translates to:
  /// **'取首次'**
  String get coreUseFirstAttempt;

  /// Core UI: coreUseHighestAttempt
  ///
  /// In zh, this message translates to:
  /// **'取最高'**
  String get coreUseHighestAttempt;

  /// Core UI: coreHideGpa
  ///
  /// In zh, this message translates to:
  /// **'隐藏绩点'**
  String get coreHideGpa;

  /// Core UI: coreAsyncRefresh
  ///
  /// In zh, this message translates to:
  /// **'异步刷新'**
  String get coreAsyncRefresh;

  /// Core UI: coreGradeChangeNotifications
  ///
  /// In zh, this message translates to:
  /// **'推送成绩变动'**
  String get coreGradeChangeNotifications;

  /// Core UI: coreDeadlineNotifications
  ///
  /// In zh, this message translates to:
  /// **'推送作业截止提醒'**
  String get coreDeadlineNotifications;

  /// Core UI: coreTapToLogIn
  ///
  /// In zh, this message translates to:
  /// **'点击登录'**
  String get coreTapToLogIn;

  /// Core UI: coreWorkDuration
  ///
  /// In zh, this message translates to:
  /// **'工作段时间长度'**
  String get coreWorkDuration;

  /// Core UI: coreBreakDuration
  ///
  /// In zh, this message translates to:
  /// **'休息段时间长度'**
  String get coreBreakDuration;

  /// Core UI: coreAvailableWorkPeriods
  ///
  /// In zh, this message translates to:
  /// **'可用的工作时段'**
  String get coreAvailableWorkPeriods;

  /// Core UI: coreSyncSystemCalendar
  ///
  /// In zh, this message translates to:
  /// **'同步到系统日历'**
  String get coreSyncSystemCalendar;

  /// Core UI: coreScheduleSyncOptions
  ///
  /// In zh, this message translates to:
  /// **'课表同步选项'**
  String get coreScheduleSyncOptions;

  /// Core UI: coreSelectSemester
  ///
  /// In zh, this message translates to:
  /// **'选择学期'**
  String get coreSelectSemester;

  /// Core UI: coreExportIcal
  ///
  /// In zh, this message translates to:
  /// **'导出为iCal文件'**
  String get coreExportIcal;

  /// Core UI: coreTools
  ///
  /// In zh, this message translates to:
  /// **'工具'**
  String get coreTools;

  /// Core UI: coreDarkMode
  ///
  /// In zh, this message translates to:
  /// **'暗色模式'**
  String get coreDarkMode;

  /// Core UI: coreFollowSystem
  ///
  /// In zh, this message translates to:
  /// **'跟随系统设置'**
  String get coreFollowSystem;

  /// Core UI: coreLightMode
  ///
  /// In zh, this message translates to:
  /// **'亮色模式'**
  String get coreLightMode;

  /// Core UI: coreAbout
  ///
  /// In zh, this message translates to:
  /// **'关于'**
  String get coreAbout;

  /// Core UI: coreDiagnostics
  ///
  /// In zh, this message translates to:
  /// **'诊断与测试'**
  String get coreDiagnostics;

  /// Core UI: coreTestLogs
  ///
  /// In zh, this message translates to:
  /// **'测试日志'**
  String get coreTestLogs;

  /// Core UI: coreDiagnosticLogsDescription
  ///
  /// In zh, this message translates to:
  /// **'查看、复制或导出脱敏 TXT'**
  String get coreDiagnosticLogsDescription;

  /// Core UI: coreAboutCelechron
  ///
  /// In zh, this message translates to:
  /// **'关于 Celechron'**
  String get coreAboutCelechron;

  /// Core UI: coreTermsOfService
  ///
  /// In zh, this message translates to:
  /// **'服务条款'**
  String get coreTermsOfService;

  /// Core UI: coreProjectWebsite
  ///
  /// In zh, this message translates to:
  /// **'前往项目网站'**
  String get coreProjectWebsite;

  /// Core UI: coreNewVersionAvailable
  ///
  /// In zh, this message translates to:
  /// **'有新版本可用'**
  String get coreNewVersionAvailable;

  /// Core UI: coreEditTask
  ///
  /// In zh, this message translates to:
  /// **'编辑任务'**
  String get coreEditTask;

  /// Core UI: coreTaskName
  ///
  /// In zh, this message translates to:
  /// **'任务名'**
  String get coreTaskName;

  /// Core UI: coreStartTime
  ///
  /// In zh, this message translates to:
  /// **'开始时间'**
  String get coreStartTime;

  /// Core UI: coreEndTime
  ///
  /// In zh, this message translates to:
  /// **'结束时间'**
  String get coreEndTime;

  /// Core UI: coreDueAt
  ///
  /// In zh, this message translates to:
  /// **'截止于'**
  String get coreDueAt;

  /// Core UI: coreEndsAt
  ///
  /// In zh, this message translates to:
  /// **'结束于 {time}'**
  String coreEndsAt(String time);

  /// Core UI: coreStartsAt
  ///
  /// In zh, this message translates to:
  /// **'开始于 {time}'**
  String coreStartsAt(String time);

  /// Core UI: coreStartAfterEnd
  ///
  /// In zh, this message translates to:
  /// **'开始时间必须晚于结束时间'**
  String get coreStartAfterEnd;

  /// Core UI: coreStartBeforeRepeatEnd
  ///
  /// In zh, this message translates to:
  /// **'开始时间不能晚于重复截止日期'**
  String get coreStartBeforeRepeatEnd;

  /// Core UI: coreRepeatedEventTooLong
  ///
  /// In zh, this message translates to:
  /// **'这个重复日程的持续时间太长'**
  String get coreRepeatedEventTooLong;

  /// Core UI: coreChangePeriod
  ///
  /// In zh, this message translates to:
  /// **'更改时段'**
  String get coreChangePeriod;

  /// Core UI: coreChange
  ///
  /// In zh, this message translates to:
  /// **'更改'**
  String get coreChange;

  /// Core UI: corePeriodsCannotOverlap
  ///
  /// In zh, this message translates to:
  /// **'时间段之间不能有重合或直接相邻'**
  String get corePeriodsCannotOverlap;

  /// Core UI: coreEditAvailablePeriods
  ///
  /// In zh, this message translates to:
  /// **'编辑可用工作时段'**
  String get coreEditAvailablePeriods;

  /// Core UI: coreAvailablePeriodsList
  ///
  /// In zh, this message translates to:
  /// **'可用工作时段列表'**
  String get coreAvailablePeriodsList;

  /// Core UI: coreAddPeriod
  ///
  /// In zh, this message translates to:
  /// **'添加一个时段'**
  String get coreAddPeriod;

  /// Core UI: coreCredits
  ///
  /// In zh, this message translates to:
  /// **'制作人员'**
  String get coreCredits;

  /// Core UI: coreDesign
  ///
  /// In zh, this message translates to:
  /// **'🎨设计'**
  String get coreDesign;

  /// Core UI: coreDevelopment
  ///
  /// In zh, this message translates to:
  /// **'🧑‍💻开发'**
  String get coreDevelopment;

  /// Core UI: coreGplNotice
  ///
  /// In zh, this message translates to:
  /// **'本程序采用 GPLv3 协议开源'**
  String get coreGplNotice;

  /// Core UI: coreDisclaimer
  ///
  /// In zh, this message translates to:
  /// **'免责声明'**
  String get coreDisclaimer;

  /// Core UI: coreWarrantyDisclaimer
  ///
  /// In zh, this message translates to:
  /// **'在适用的法律范围内，该程序不提供任何质量保证。除非另有书面说明，版权持有者和程序提供者应按照原样提供程序，并且不提供任何明示或者暗示的保证，包括但不限于适销性和特定用途适用性的暗示保证。使用该程序所产生的全部风险，比如程序的质量和性能问题，全部由你承担。如果程序出现缺陷，你将承担所有必要的修复和更正服务带来的损失。'**
  String get coreWarrantyDisclaimer;

  /// Core UI: coreLiabilityLimitation
  ///
  /// In zh, this message translates to:
  /// **'责任限制'**
  String get coreLiabilityLimitation;

  /// Core UI: coreLiabilityText
  ///
  /// In zh, this message translates to:
  /// **'除非有适用法律或书面协议要求，任何版权持有者，或该程序按照本协议可能存在的第三方修改和再发布者，都不对你的损失负有责任，包括由于使用或者不能使用该程序造成的任何一般的、特殊的、偶发的或重大的损失（包括但不限于数据丢失、数据失真、你或第三方的后续损失、该程序无法和其他程序协同工作等），即使他们声称会对此负责。'**
  String get coreLiabilityText;

  /// Core UI: coreViewFullGpl
  ///
  /// In zh, this message translates to:
  /// **'查看 GPLv3 协议全文'**
  String get coreViewFullGpl;

  /// Core UI: coreDiagnosticDisplayMode
  ///
  /// In zh, this message translates to:
  /// **'诊断日志显示模式'**
  String get coreDiagnosticDisplayMode;

  /// Core UI: coreReadableReport
  ///
  /// In zh, this message translates to:
  /// **'易读报告'**
  String get coreReadableReport;

  /// Core UI: coreRawLogs
  ///
  /// In zh, this message translates to:
  /// **'原始日志'**
  String get coreRawLogs;

  /// Core UI: coreNoReadableRefreshRecords
  ///
  /// In zh, this message translates to:
  /// **'暂无可读的刷新记录'**
  String get coreNoReadableRefreshRecords;

  /// Core UI: coreRefreshRecordsHint
  ///
  /// In zh, this message translates to:
  /// **'执行一次刷新后，这里会显示刷新结果、模块状态和关键时间线。'**
  String get coreRefreshRecordsHint;

  /// Core UI: coreTotalDuration
  ///
  /// In zh, this message translates to:
  /// **'总耗时'**
  String get coreTotalDuration;

  /// Core UI: coreSuccess
  ///
  /// In zh, this message translates to:
  /// **'成功'**
  String get coreSuccess;

  /// Core UI: coreDegraded
  ///
  /// In zh, this message translates to:
  /// **'降级'**
  String get coreDegraded;

  /// Core UI: coreFailed
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get coreFailed;

  /// Core UI: coreRelogged
  ///
  /// In zh, this message translates to:
  /// **'重新登录'**
  String get coreRelogged;

  /// Core UI: coreRetried
  ///
  /// In zh, this message translates to:
  /// **'已重试'**
  String get coreRetried;

  /// Core UI: coreCacheFallback
  ///
  /// In zh, this message translates to:
  /// **'缓存回退'**
  String get coreCacheFallback;

  /// Core UI: coreHideDetails
  ///
  /// In zh, this message translates to:
  /// **'收起详情'**
  String get coreHideDetails;

  /// Core UI: coreViewDetails
  ///
  /// In zh, this message translates to:
  /// **'查看详情'**
  String get coreViewDetails;

  /// Core UI: coreModuleStatus
  ///
  /// In zh, this message translates to:
  /// **'模块状态'**
  String get coreModuleStatus;

  /// Core UI: coreKeyTimeline
  ///
  /// In zh, this message translates to:
  /// **'关键时间线'**
  String get coreKeyTimeline;

  /// Core UI: coreNoKeyEvents
  ///
  /// In zh, this message translates to:
  /// **'没有可展示的关键事件。'**
  String get coreNoKeyEvents;

  /// Core UI: coreIssuesFound
  ///
  /// In zh, this message translates to:
  /// **'发现的问题'**
  String get coreIssuesFound;

  /// Core UI: coreNoIssues
  ///
  /// In zh, this message translates to:
  /// **'未发现需要说明的问题。'**
  String get coreNoIssues;

  /// Core UI: coreReauthenticated
  ///
  /// In zh, this message translates to:
  /// **'已重新登录'**
  String get coreReauthenticated;

  /// Core UI: coreCacheUpdatedAt
  ///
  /// In zh, this message translates to:
  /// **'缓存更新于 '**
  String get coreCacheUpdatedAt;

  /// Core UI: coreHideTechnicalDetails
  ///
  /// In zh, this message translates to:
  /// **'收起技术详情'**
  String get coreHideTechnicalDetails;

  /// Core UI: coreViewTechnicalDetails
  ///
  /// In zh, this message translates to:
  /// **'查看技术详情'**
  String get coreViewTechnicalDetails;

  /// Core UI: coreUtcTime
  ///
  /// In zh, this message translates to:
  /// **'UTC 时间'**
  String get coreUtcTime;

  /// Core UI: coreHttpStatus
  ///
  /// In zh, this message translates to:
  /// **'HTTP 状态码'**
  String get coreHttpStatus;

  /// Core UI: coreRequestInterface
  ///
  /// In zh, this message translates to:
  /// **'请求接口'**
  String get coreRequestInterface;

  /// Core UI: coreRedactedUrl
  ///
  /// In zh, this message translates to:
  /// **'已脱敏 URL'**
  String get coreRedactedUrl;

  /// Core UI: coreExceptionType
  ///
  /// In zh, this message translates to:
  /// **'异常类型'**
  String get coreExceptionType;

  /// Core UI: coreExceptionSummary
  ///
  /// In zh, this message translates to:
  /// **'异常摘要'**
  String get coreExceptionSummary;

  /// Core UI: coreHideStack
  ///
  /// In zh, this message translates to:
  /// **'隐藏堆栈'**
  String get coreHideStack;

  /// Core UI: coreShowStack
  ///
  /// In zh, this message translates to:
  /// **'显示堆栈'**
  String get coreShowStack;

  /// Core UI: coreAppBackgroundCoordination
  ///
  /// In zh, this message translates to:
  /// **'App 与后台协调'**
  String get coreAppBackgroundCoordination;

  /// Core UI: coreReadingLogs
  ///
  /// In zh, this message translates to:
  /// **'正在读取日志…'**
  String get coreReadingLogs;

  /// Core UI: coreNoDiagnosticLogs
  ///
  /// In zh, this message translates to:
  /// **'暂无诊断日志。执行一次刷新后再试。'**
  String get coreNoDiagnosticLogs;

  /// Core UI: coreFullRawLogs
  ///
  /// In zh, this message translates to:
  /// **'完整原始日志'**
  String get coreFullRawLogs;

  /// Core UI: coreCopyRawLogs
  ///
  /// In zh, this message translates to:
  /// **'复制完整原始日志'**
  String get coreCopyRawLogs;

  /// Core UI: coreExportShareTxt
  ///
  /// In zh, this message translates to:
  /// **'导出并分享 TXT'**
  String get coreExportShareTxt;

  /// Core UI: coreExportContents
  ///
  /// In zh, this message translates to:
  /// **'包含易读报告和完整原始日志'**
  String get coreExportContents;

  /// Core UI: coreClearTestLogs
  ///
  /// In zh, this message translates to:
  /// **'清空测试日志'**
  String get coreClearTestLogs;

  /// Core UI: coreYes
  ///
  /// In zh, this message translates to:
  /// **'是'**
  String get coreYes;

  /// Core UI: coreNo
  ///
  /// In zh, this message translates to:
  /// **'否'**
  String get coreNo;

  /// Core UI: coreCopied
  ///
  /// In zh, this message translates to:
  /// **'已复制'**
  String get coreCopied;

  /// Core UI: coreRawLogsCopied
  ///
  /// In zh, this message translates to:
  /// **'完整原始日志已复制到剪贴板。'**
  String get coreRawLogsCopied;

  /// Core UI: coreExportSucceeded
  ///
  /// In zh, this message translates to:
  /// **'导出成功'**
  String get coreExportSucceeded;

  /// Core UI: coreExportFailed
  ///
  /// In zh, this message translates to:
  /// **'导出失败'**
  String get coreExportFailed;

  /// Core UI: coreUnableExportLogs
  ///
  /// In zh, this message translates to:
  /// **'无法导出日志：'**
  String get coreUnableExportLogs;

  /// Core UI: coreCleared
  ///
  /// In zh, this message translates to:
  /// **'已清空'**
  String get coreCleared;

  /// Core UI: coreLogsCleared
  ///
  /// In zh, this message translates to:
  /// **'测试日志已清空。'**
  String get coreLogsCleared;

  /// Core UI: coreConfirmClearLogs
  ///
  /// In zh, this message translates to:
  /// **'确定清空测试日志？'**
  String get coreConfirmClearLogs;

  /// Core UI: coreClearLogsWarning
  ///
  /// In zh, this message translates to:
  /// **'清空后，当前保存的诊断记录将无法在 App 内恢复。'**
  String get coreClearLogsWarning;

  /// Core UI: coreYearMonth
  ///
  /// In zh, this message translates to:
  /// **'{year} 年 {month} 月'**
  String coreYearMonth(int year, int month);

  /// Core UI: coreWeekdayMon
  ///
  /// In zh, this message translates to:
  /// **'一'**
  String get coreWeekdayMon;

  /// Core UI: coreWeekdayTue
  ///
  /// In zh, this message translates to:
  /// **'二'**
  String get coreWeekdayTue;

  /// Core UI: coreWeekdayWed
  ///
  /// In zh, this message translates to:
  /// **'三'**
  String get coreWeekdayWed;

  /// Core UI: coreWeekdayThu
  ///
  /// In zh, this message translates to:
  /// **'四'**
  String get coreWeekdayThu;

  /// Core UI: coreWeekdayFri
  ///
  /// In zh, this message translates to:
  /// **'五'**
  String get coreWeekdayFri;

  /// Core UI: coreWeekdaySat
  ///
  /// In zh, this message translates to:
  /// **'六'**
  String get coreWeekdaySat;

  /// Core UI: coreWeekdaySun
  ///
  /// In zh, this message translates to:
  /// **'日'**
  String get coreWeekdaySun;

  /// Core UI: coreEndsIn
  ///
  /// In zh, this message translates to:
  /// **'结束还有{duration}'**
  String coreEndsIn(String duration);

  /// Core UI: coreStartsIn
  ///
  /// In zh, this message translates to:
  /// **'开始还有{duration}'**
  String coreStartsIn(String duration);

  /// Core UI: coreWorkBreakSummary
  ///
  /// In zh, this message translates to:
  /// **'工作 {work} - 休息 {breakDuration}'**
  String coreWorkBreakSummary(String work, String breakDuration);

  /// Core UI: coreNotEnoughTime
  ///
  /// In zh, this message translates to:
  /// **'时间不够了！'**
  String get coreNotEnoughTime;

  /// Core UI: coreTasksDoNotFit
  ///
  /// In zh, this message translates to:
  /// **'即使是完全不休息也有任务无法完成。请压缩任务的预期时间，或者检查是否有任务在规划开始时间之前就结束。'**
  String get coreTasksDoNotFit;

  /// Core UI: coreBreaksMustShrink
  ///
  /// In zh, this message translates to:
  /// **'因为任务过多，你需要把休息时间压缩到 {duration}才能完成任务。'**
  String coreBreaksMustShrink(String duration);

  /// Core UI: coreLocationValue
  ///
  /// In zh, this message translates to:
  /// **'地点：{value}'**
  String coreLocationValue(String value);

  /// Core UI: coreDescriptionValue
  ///
  /// In zh, this message translates to:
  /// **'说明：{value}'**
  String coreDescriptionValue(String value);

  /// Core UI: coreTimeValue
  ///
  /// In zh, this message translates to:
  /// **'时间：{value}'**
  String coreTimeValue(String value);

  /// Settings language selector label
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get coreLanguage;

  /// Core UI: coreDueWithExpired
  ///
  /// In zh, this message translates to:
  /// **'截止于 {time}{expired, select, true{ - 已过期} other{}}'**
  String coreDueWithExpired(String time, String expired);

  /// Core UI: coreDays
  ///
  /// In zh, this message translates to:
  /// **'{count} 天'**
  String coreDays(int count);

  /// Core UI: coreTaskProgress
  ///
  /// In zh, this message translates to:
  /// **'{percent}% 已完成：预期 {expected}，还要 {remaining}'**
  String coreTaskProgress(int percent, String expected, String remaining);

  /// Core UI: coreMarkIncomplete
  ///
  /// In zh, this message translates to:
  /// **'标记为未完成'**
  String get coreMarkIncomplete;

  /// Core UI: coreMarkComplete
  ///
  /// In zh, this message translates to:
  /// **'标记为完成'**
  String get coreMarkComplete;

  /// Core UI: corePause
  ///
  /// In zh, this message translates to:
  /// **'暂停'**
  String get corePause;

  /// Core UI: coreResume
  ///
  /// In zh, this message translates to:
  /// **'继续'**
  String get coreResume;

  /// Core UI: coreLoggedIn
  ///
  /// In zh, this message translates to:
  /// **'已登录: {username}'**
  String coreLoggedIn(String username);

  /// Core UI: corePeriodCount
  ///
  /// In zh, this message translates to:
  /// **'{count} 个时段'**
  String corePeriodCount(int count);

  /// Core UI: coreFileCreated
  ///
  /// In zh, this message translates to:
  /// **'已生成 {fileName}'**
  String coreFileCreated(String fileName);

  /// Core UI: coreDamagedLogLines
  ///
  /// In zh, this message translates to:
  /// **'有 {count} 行日志无法解析，已安全跳过。'**
  String coreDamagedLogLines(int count);

  /// Core UI: coreExporting
  ///
  /// In zh, this message translates to:
  /// **'正在导出…'**
  String get coreExporting;

  /// Core UI: coreRawLogRetention
  ///
  /// In zh, this message translates to:
  /// **'原始日志继续使用 UTC 时间并保留完整脱敏技术字段；最多保留 2000 行和最近 10 个导出文件。'**
  String get coreRawLogRetention;

  /// Core UI: corePaymentCodeStatus
  ///
  /// In zh, this message translates to:
  /// **'付款码：{status}'**
  String corePaymentCodeStatus(String status);

  /// Core UI: coreLoadFailed
  ///
  /// In zh, this message translates to:
  /// **'加载失败'**
  String get coreLoadFailed;

  /// Core UI: coreVersion
  ///
  /// In zh, this message translates to:
  /// **'{version} 版本'**
  String coreVersion(String version);

  /// Core UI: coreContributorKate
  ///
  /// In zh, this message translates to:
  /// **'空之探险队的 Kate'**
  String get coreContributorKate;

  /// Core UI: coreStartValue
  ///
  /// In zh, this message translates to:
  /// **'开始：{time}'**
  String coreStartValue(String time);

  /// Core UI: coreEndValue
  ///
  /// In zh, this message translates to:
  /// **'结束：{time}'**
  String coreEndValue(String time);

  /// Core UI: coreStartMustBeBeforeEnd
  ///
  /// In zh, this message translates to:
  /// **'开始时间必须早于结束时间'**
  String get coreStartMustBeBeforeEnd;

  /// Core UI: coreClear
  ///
  /// In zh, this message translates to:
  /// **'清空'**
  String get coreClear;

  /// No description provided for @coreSeasonWeek.
  ///
  /// In zh, this message translates to:
  /// **'{season}{week}周'**
  String coreSeasonWeek(String season, int week);

  /// No description provided for @coreSemesterDisplay.
  ///
  /// In zh, this message translates to:
  /// **'{year} {season}学期'**
  String coreSemesterDisplay(String year, String season);

  /// No description provided for @diagnosticExportTitle.
  ///
  /// In zh, this message translates to:
  /// **'Celechron 诊断日志'**
  String get diagnosticExportTitle;

  /// No description provided for @diagnosticExportLocalTime.
  ///
  /// In zh, this message translates to:
  /// **'本地导出时间：{time}'**
  String diagnosticExportLocalTime(String time);

  /// No description provided for @diagnosticExportUtcTime.
  ///
  /// In zh, this message translates to:
  /// **'UTC 导出时间：{time}'**
  String diagnosticExportUtcTime(String time);

  /// No description provided for @diagnosticExportVersion.
  ///
  /// In zh, this message translates to:
  /// **'App 版本：{version}'**
  String diagnosticExportVersion(String version);

  /// No description provided for @diagnosticExportPlatform.
  ///
  /// In zh, this message translates to:
  /// **'平台：{platform}'**
  String diagnosticExportPlatform(String platform);

  /// No description provided for @diagnosticExportRefreshId.
  ///
  /// In zh, this message translates to:
  /// **'refreshId：{id}'**
  String diagnosticExportRefreshId(String id);

  /// No description provided for @diagnosticExportOrigin.
  ///
  /// In zh, this message translates to:
  /// **'来源：{origin}'**
  String diagnosticExportOrigin(String origin);

  /// No description provided for @diagnosticExportReadable.
  ///
  /// In zh, this message translates to:
  /// **'=== 1. 易读诊断报告 ==='**
  String get diagnosticExportReadable;

  /// No description provided for @diagnosticExportNoReports.
  ///
  /// In zh, this message translates to:
  /// **'暂无可解析的刷新记录。'**
  String get diagnosticExportNoReports;

  /// No description provided for @diagnosticExportTotalTime.
  ///
  /// In zh, this message translates to:
  /// **'总耗时：{duration}'**
  String diagnosticExportTotalTime(String duration);

  /// No description provided for @diagnosticExportModuleCounts.
  ///
  /// In zh, this message translates to:
  /// **'模块：成功 {success} / 降级 {degraded} / 失败 {failed}'**
  String diagnosticExportModuleCounts(
      String success, String degraded, String failed);

  /// No description provided for @diagnosticExportFlags.
  ///
  /// In zh, this message translates to:
  /// **'重新登录：{relogged}；重试：{retried}；缓存回退：{cached}'**
  String diagnosticExportFlags(String relogged, String retried, String cached);

  /// No description provided for @diagnosticExportYes.
  ///
  /// In zh, this message translates to:
  /// **'是'**
  String get diagnosticExportYes;

  /// No description provided for @diagnosticExportNo.
  ///
  /// In zh, this message translates to:
  /// **'否'**
  String get diagnosticExportNo;

  /// No description provided for @diagnosticExportModules.
  ///
  /// In zh, this message translates to:
  /// **'=== 2. 模块结果 ==='**
  String get diagnosticExportModules;

  /// No description provided for @diagnosticExportNoModuleRequests.
  ///
  /// In zh, this message translates to:
  /// **'{title}：未发起独立模块请求。'**
  String diagnosticExportNoModuleRequests(String title);

  /// No description provided for @diagnosticExportModuleRow.
  ///
  /// In zh, this message translates to:
  /// **'{name}：{state}；{duration}；{reason}'**
  String diagnosticExportModuleRow(
      String name, String state, String duration, String reason);

  /// No description provided for @diagnosticExportTimeline.
  ///
  /// In zh, this message translates to:
  /// **'=== 3. 关键时间线 ==='**
  String get diagnosticExportTimeline;

  /// No description provided for @diagnosticExportNoTimeline.
  ///
  /// In zh, this message translates to:
  /// **'无关键时间线事件。'**
  String get diagnosticExportNoTimeline;

  /// No description provided for @diagnosticExportIssues.
  ///
  /// In zh, this message translates to:
  /// **'=== 4. 发现的问题 ==='**
  String get diagnosticExportIssues;

  /// No description provided for @diagnosticExportNoIssues.
  ///
  /// In zh, this message translates to:
  /// **'未发现需要说明的问题。'**
  String get diagnosticExportNoIssues;

  /// No description provided for @diagnosticExportTechnical.
  ///
  /// In zh, this message translates to:
  /// **'  refreshId={id}；UTC={utc}；HTTP={http}；接口={interfaceName}；URL={url}；异常={exceptionType}；摘要={summary}；堆栈={stack}'**
  String diagnosticExportTechnical(
      String id,
      String utc,
      String http,
      String interfaceName,
      String url,
      String exceptionType,
      String summary,
      String stack);

  /// No description provided for @diagnosticExportRaw.
  ///
  /// In zh, this message translates to:
  /// **'=== 5. 完整原始日志（UTC） ==='**
  String get diagnosticExportRaw;

  /// No description provided for @diagnosticExportRawNote.
  ///
  /// In zh, this message translates to:
  /// **'以下时间保持 ISO 8601 UTC；与上方本地时间存在时区偏移是正常的。'**
  String get diagnosticExportRawNote;

  /// No description provided for @diagnosticExportShare.
  ///
  /// In zh, this message translates to:
  /// **'Celechron 测试日志：{fileName}'**
  String diagnosticExportShare(String fileName);

  /// No description provided for @exportReminder.
  ///
  /// In zh, this message translates to:
  /// **'提醒'**
  String get exportReminder;

  /// No description provided for @exportConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get exportConfirm;

  /// No description provided for @exportSchedule.
  ///
  /// In zh, this message translates to:
  /// **'导出课程表'**
  String get exportSchedule;

  /// No description provided for @exportChooseMethod.
  ///
  /// In zh, this message translates to:
  /// **'选择导出方式'**
  String get exportChooseMethod;

  /// No description provided for @exportCurrentSemester.
  ///
  /// In zh, this message translates to:
  /// **'导出当前学期'**
  String get exportCurrentSemester;

  /// No description provided for @exportChooseSemester.
  ///
  /// In zh, this message translates to:
  /// **'选择学期'**
  String get exportChooseSemester;

  /// No description provided for @exportCancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get exportCancel;

  /// No description provided for @exportNotice.
  ///
  /// In zh, this message translates to:
  /// **'提示'**
  String get exportNotice;

  /// No description provided for @exportNoData.
  ///
  /// In zh, this message translates to:
  /// **'没有可导出的课程表数据'**
  String get exportNoData;

  /// No description provided for @exportChooseSemesterMessage.
  ///
  /// In zh, this message translates to:
  /// **'选择要导出的学期'**
  String get exportChooseSemesterMessage;

  /// No description provided for @exportAllSemesters.
  ///
  /// In zh, this message translates to:
  /// **'导出所有学期'**
  String get exportAllSemesters;

  /// No description provided for @exportSuccess.
  ///
  /// In zh, this message translates to:
  /// **'成功'**
  String get exportSuccess;

  /// No description provided for @exportError.
  ///
  /// In zh, this message translates to:
  /// **'错误'**
  String get exportError;

  /// No description provided for @exportNotSignedIn.
  ///
  /// In zh, this message translates to:
  /// **'请先登录后再导出课程表'**
  String get exportNotSignedIn;

  /// No description provided for @exportShared.
  ///
  /// In zh, this message translates to:
  /// **'课程表已导出，请选择保存位置或分享'**
  String get exportShared;

  /// No description provided for @exportShareDescription.
  ///
  /// In zh, this message translates to:
  /// **'从 Celechron 导出的课程表文件，可导入到其他日历应用中使用。'**
  String get exportShareDescription;

  /// No description provided for @exportAllShareDescription.
  ///
  /// In zh, this message translates to:
  /// **'从 Celechron 导出的完整课程表文件，包含所有学期。'**
  String get exportAllShareDescription;

  /// No description provided for @exportSemesterShareDescription.
  ///
  /// In zh, this message translates to:
  /// **'从 Celechron 导出的 {semester} 课程表文件。'**
  String exportSemesterShareDescription(String semester);

  /// No description provided for @exportCalendarName.
  ///
  /// In zh, this message translates to:
  /// **'浙大课程表'**
  String get exportCalendarName;

  /// No description provided for @exportCalendarSemesterName.
  ///
  /// In zh, this message translates to:
  /// **'浙大课程表-{semester}'**
  String exportCalendarSemesterName(String semester);

  /// No description provided for @exportCalendarFullName.
  ///
  /// In zh, this message translates to:
  /// **'浙大课程表-完整版'**
  String get exportCalendarFullName;

  /// No description provided for @exportCalendarAllName.
  ///
  /// In zh, this message translates to:
  /// **'课程表-完整版'**
  String get exportCalendarAllName;

  /// No description provided for @exportSemesterSchedule.
  ///
  /// In zh, this message translates to:
  /// **'{semester} 课程表'**
  String exportSemesterSchedule(String semester);

  /// No description provided for @exportExportedSemester.
  ///
  /// In zh, this message translates to:
  /// **'{semester} 课程表已导出'**
  String exportExportedSemester(String semester);

  /// No description provided for @exportFullExported.
  ///
  /// In zh, this message translates to:
  /// **'完整课程表已导出'**
  String get exportFullExported;

  /// No description provided for @exportFailed.
  ///
  /// In zh, this message translates to:
  /// **'导出失败: {error}'**
  String exportFailed(String error);

  /// No description provided for @exportSyncOptions.
  ///
  /// In zh, this message translates to:
  /// **'同步日历选项'**
  String get exportSyncOptions;

  /// No description provided for @exportChooseSyncAction.
  ///
  /// In zh, this message translates to:
  /// **'选择日历同步操作'**
  String get exportChooseSyncAction;

  /// No description provided for @exportUpdateCurrent.
  ///
  /// In zh, this message translates to:
  /// **'更新当前课表'**
  String get exportUpdateCurrent;

  /// No description provided for @exportChooseSemesterSync.
  ///
  /// In zh, this message translates to:
  /// **'选择学期同步'**
  String get exportChooseSemesterSync;

  /// No description provided for @exportChooseSemesterToSync.
  ///
  /// In zh, this message translates to:
  /// **'选择要同步的学期'**
  String get exportChooseSemesterToSync;

  /// No description provided for @exportSyncAllSemesters.
  ///
  /// In zh, this message translates to:
  /// **'同步所有学期'**
  String get exportSyncAllSemesters;

  /// No description provided for @exportPermissionFailed.
  ///
  /// In zh, this message translates to:
  /// **'权限获取失败'**
  String get exportPermissionFailed;

  /// No description provided for @exportPermissionInstruction.
  ///
  /// In zh, this message translates to:
  /// **'请在系统设置中手动开启日历权限'**
  String get exportPermissionInstruction;

  /// No description provided for @exportResyncSuccess.
  ///
  /// In zh, this message translates to:
  /// **'重新同步成功'**
  String get exportResyncSuccess;

  /// No description provided for @exportResyncFailed.
  ///
  /// In zh, this message translates to:
  /// **'重新同步失败'**
  String get exportResyncFailed;

  /// No description provided for @exportSyncSuccess.
  ///
  /// In zh, this message translates to:
  /// **'同步成功'**
  String get exportSyncSuccess;

  /// No description provided for @exportSyncFailed.
  ///
  /// In zh, this message translates to:
  /// **'同步失败'**
  String get exportSyncFailed;

  /// No description provided for @exportResyncedCount.
  ///
  /// In zh, this message translates to:
  /// **'已重新同步 {courses} 门课程，共计 {events} 个日程'**
  String exportResyncedCount(String courses, String events);

  /// No description provided for @exportSyncedCount.
  ///
  /// In zh, this message translates to:
  /// **'已同步 {courses} 门课程，共计 {events} 个日程'**
  String exportSyncedCount(String courses, String events);

  /// No description provided for @exportSyncedSemesterCount.
  ///
  /// In zh, this message translates to:
  /// **'已同步 {semester} 的 {courses} 门课程，共计 {events} 个日程'**
  String exportSyncedSemesterCount(
      String semester, String courses, String events);

  /// No description provided for @exportSyncedAllCount.
  ///
  /// In zh, this message translates to:
  /// **'已同步所有学期的 {courses} 门课程，共计 {events} 个日程'**
  String exportSyncedAllCount(String courses, String events);

  /// No description provided for @exportNoResync.
  ///
  /// In zh, this message translates to:
  /// **'无法重新同步课程到系统日历'**
  String get exportNoResync;

  /// No description provided for @exportResyncError.
  ///
  /// In zh, this message translates to:
  /// **'重新同步时出错: {error}'**
  String exportResyncError(String error);

  /// No description provided for @exportSemesterMissing.
  ///
  /// In zh, this message translates to:
  /// **'未找到指定的学期'**
  String get exportSemesterMissing;

  /// No description provided for @exportNoSyncSemester.
  ///
  /// In zh, this message translates to:
  /// **'没有可同步的学期数据，请先登录'**
  String get exportNoSyncSemester;

  /// No description provided for @exportNoSyncSemesterCourses.
  ///
  /// In zh, this message translates to:
  /// **'无法同步 {semester} 的课程'**
  String exportNoSyncSemesterCourses(String semester);

  /// No description provided for @exportNoSyncAll.
  ///
  /// In zh, this message translates to:
  /// **'无法同步所有学期的课程'**
  String get exportNoSyncAll;

  /// No description provided for @exportSyncError.
  ///
  /// In zh, this message translates to:
  /// **'同步时出错: {error}'**
  String exportSyncError(String error);

  /// No description provided for @exportUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'暂不支持'**
  String get exportUnsupported;

  /// No description provided for @exportMacUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'macOS 系统暂不支持日历同步功能'**
  String get exportMacUnsupported;

  /// No description provided for @exportSignInToSync.
  ///
  /// In zh, this message translates to:
  /// **'请先登录后再开启日历同步功能'**
  String get exportSignInToSync;

  /// No description provided for @exportIosSyncFailure.
  ///
  /// In zh, this message translates to:
  /// **'无法同步课程到系统日历，从日历中移除Google账户后重试'**
  String get exportIosSyncFailure;

  /// No description provided for @exportSyncFailure.
  ///
  /// In zh, this message translates to:
  /// **'无法同步课程到系统日历，请检查权限和网络连接'**
  String get exportSyncFailure;

  /// No description provided for @exportDisabled.
  ///
  /// In zh, this message translates to:
  /// **'日历同步功能已关闭，已删除课表数据和Celechron日历'**
  String get exportDisabled;

  /// No description provided for @exportDisabledDeleteIssue.
  ///
  /// In zh, this message translates to:
  /// **'日历同步功能已关闭，但删除日历时遇到问题'**
  String get exportDisabledDeleteIssue;

  /// No description provided for @exportDisabledDeleteError.
  ///
  /// In zh, this message translates to:
  /// **'日历同步功能已关闭，但删除日历时出错: {error}'**
  String exportDisabledDeleteError(String error);

  /// No description provided for @exportInstructor.
  ///
  /// In zh, this message translates to:
  /// **'教师: {name}'**
  String exportInstructor(String name);

  /// No description provided for @exportFinalExam.
  ///
  /// In zh, this message translates to:
  /// **'期末考试'**
  String get exportFinalExam;

  /// No description provided for @exportMidtermExam.
  ///
  /// In zh, this message translates to:
  /// **'期中考试'**
  String get exportMidtermExam;

  /// No description provided for @exportExamDescription.
  ///
  /// In zh, this message translates to:
  /// **'{name} - {type}\n座位号：{seat}'**
  String exportExamDescription(String name, String type, String seat);

  /// No description provided for @notificationGradeChannel.
  ///
  /// In zh, this message translates to:
  /// **'成绩变动提醒'**
  String get notificationGradeChannel;

  /// No description provided for @notificationDeadlineChannel.
  ///
  /// In zh, this message translates to:
  /// **'作业截止提醒'**
  String get notificationDeadlineChannel;

  /// No description provided for @notificationFirstGradeTitle.
  ///
  /// In zh, this message translates to:
  /// **'首次成绩推送'**
  String get notificationFirstGradeTitle;

  /// No description provided for @notificationFirstGradeBody.
  ///
  /// In zh, this message translates to:
  /// **'若有新出分的课程，Celechron 将会通知您。若不需要此功能，可在 Celechron 的设置页面中关闭。'**
  String get notificationFirstGradeBody;

  /// No description provided for @notificationGradeTitle.
  ///
  /// In zh, this message translates to:
  /// **'成绩变动提醒'**
  String get notificationGradeTitle;

  /// No description provided for @notificationGradeBody.
  ///
  /// In zh, this message translates to:
  /// **'有新出分的课程，可在 Celechron 的学业页面中刷新查看。'**
  String get notificationGradeBody;

  /// No description provided for @notificationHoursUntil.
  ///
  /// In zh, this message translates to:
  /// **'{hours} 小时后'**
  String notificationHoursUntil(int hours);

  /// No description provided for @notificationSoon.
  ///
  /// In zh, this message translates to:
  /// **'即将'**
  String get notificationSoon;

  /// No description provided for @notificationDeadlineTitle.
  ///
  /// In zh, this message translates to:
  /// **'作业截止提醒'**
  String get notificationDeadlineTitle;

  /// No description provided for @notificationDeadlineBody.
  ///
  /// In zh, this message translates to:
  /// **'「{course}」的作业「{name}」将于{when}截止'**
  String notificationDeadlineBody(String course, String name, String when);

  /// No description provided for @serviceNotRefreshed.
  ///
  /// In zh, this message translates to:
  /// **'未刷新'**
  String get serviceNotRefreshed;

  /// No description provided for @serviceNotSignedIn.
  ///
  /// In zh, this message translates to:
  /// **'未登录'**
  String get serviceNotSignedIn;

  /// No description provided for @serviceCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消'**
  String get serviceCancelled;

  /// No description provided for @serviceNewVersion.
  ///
  /// In zh, this message translates to:
  /// **'有新版本可用'**
  String get serviceNewVersion;

  /// No description provided for @serviceUnknownModule.
  ///
  /// In zh, this message translates to:
  /// **'未知模块'**
  String get serviceUnknownModule;

  /// No description provided for @serviceMajor.
  ///
  /// In zh, this message translates to:
  /// **'主修'**
  String get serviceMajor;

  /// No description provided for @servicePractice.
  ///
  /// In zh, this message translates to:
  /// **'实践/素质拓展'**
  String get servicePractice;

  /// No description provided for @servicePracticeShort.
  ///
  /// In zh, this message translates to:
  /// **'实践'**
  String get servicePracticeShort;

  /// No description provided for @serviceSecondClass.
  ///
  /// In zh, this message translates to:
  /// **'第二课堂'**
  String get serviceSecondClass;

  /// No description provided for @serviceThirdClass.
  ///
  /// In zh, this message translates to:
  /// **'第三课堂'**
  String get serviceThirdClass;

  /// No description provided for @serviceFourthClass.
  ///
  /// In zh, this message translates to:
  /// **'第四课堂'**
  String get serviceFourthClass;

  /// No description provided for @serviceSharedFailure.
  ///
  /// In zh, this message translates to:
  /// **'共享任务失败'**
  String get serviceSharedFailure;

  /// No description provided for @serviceSharedFailureReason.
  ///
  /// In zh, this message translates to:
  /// **'关联的刷新任务执行失败，本次调用没有重复请求服务器，并收到了相同失败结果。'**
  String get serviceSharedFailureReason;

  /// No description provided for @serviceNotRunReason.
  ///
  /// In zh, this message translates to:
  /// **'本次日志中没有该模块的执行记录。'**
  String get serviceNotRunReason;

  /// No description provided for @serviceMissingEnd.
  ///
  /// In zh, this message translates to:
  /// **'没有记录到刷新结束事件'**
  String get serviceMissingEnd;

  /// No description provided for @serviceBackgroundMissingEnd.
  ///
  /// In zh, this message translates to:
  /// **'该后台任务没有记录到结束事件，可能被系统终止，或日志尚未在 isolate 退出前写入完成。'**
  String get serviceBackgroundMissingEnd;

  /// No description provided for @serviceForegroundMissingEnd.
  ///
  /// In zh, this message translates to:
  /// **'该刷新没有记录到结束事件，可能尚未完成、被终止，或日志写入不完整。'**
  String get serviceForegroundMissingEnd;

  /// No description provided for @serviceBackgroundStart.
  ///
  /// In zh, this message translates to:
  /// **'后台任务开始'**
  String get serviceBackgroundStart;

  /// No description provided for @serviceForegroundStart.
  ///
  /// In zh, this message translates to:
  /// **'前台刷新开始'**
  String get serviceForegroundStart;

  /// No description provided for @serviceRefreshErrorEnd.
  ///
  /// In zh, this message translates to:
  /// **'刷新异常结束'**
  String get serviceRefreshErrorEnd;

  /// No description provided for @serviceRefreshEnd.
  ///
  /// In zh, this message translates to:
  /// **'刷新结束'**
  String get serviceRefreshEnd;

  /// No description provided for @serviceTotalDuration.
  ///
  /// In zh, this message translates to:
  /// **'总耗时 {duration}'**
  String serviceTotalDuration(String duration);

  /// No description provided for @serviceForegroundActive.
  ///
  /// In zh, this message translates to:
  /// **'App 进入前台'**
  String get serviceForegroundActive;

  /// No description provided for @serviceLockWait.
  ///
  /// In zh, this message translates to:
  /// **'跨 isolate 等待账号文件锁'**
  String get serviceLockWait;

  /// No description provided for @serviceShareFuture.
  ///
  /// In zh, this message translates to:
  /// **'共享同账号同操作的刷新 Future'**
  String get serviceShareFuture;

  /// No description provided for @serviceRelatedTask.
  ///
  /// In zh, this message translates to:
  /// **'关联任务 {id}'**
  String serviceRelatedTask(String id);

  /// No description provided for @serviceQueueOperation.
  ///
  /// In zh, this message translates to:
  /// **'同账号不同操作正在排队'**
  String get serviceQueueOperation;

  /// No description provided for @serviceYieldAfterLogin.
  ///
  /// In zh, this message translates to:
  /// **'后台登录后检测到前台并让行'**
  String get serviceYieldAfterLogin;

  /// No description provided for @serviceBackgroundYield.
  ///
  /// In zh, this message translates to:
  /// **'后台因前台使用主动让行'**
  String get serviceBackgroundYield;

  /// No description provided for @serviceStaleLock.
  ///
  /// In zh, this message translates to:
  /// **'发现并清理遗留刷新锁'**
  String get serviceStaleLock;

  /// No description provided for @serviceLockAcquired.
  ///
  /// In zh, this message translates to:
  /// **'已获取同账号刷新锁'**
  String get serviceLockAcquired;

  /// No description provided for @serviceLockReleased.
  ///
  /// In zh, this message translates to:
  /// **'已释放同账号刷新锁'**
  String get serviceLockReleased;

  /// No description provided for @serviceModuleCached.
  ///
  /// In zh, this message translates to:
  /// **'{module}使用缓存'**
  String serviceModuleCached(String module);

  /// No description provided for @serviceRelogin.
  ///
  /// In zh, this message translates to:
  /// **'重新登录后继续请求'**
  String get serviceRelogin;

  /// No description provided for @serviceRetried.
  ///
  /// In zh, this message translates to:
  /// **'失败请求已重试'**
  String get serviceRetried;

  /// No description provided for @serviceExecutionError.
  ///
  /// In zh, this message translates to:
  /// **'刷新执行异常'**
  String get serviceExecutionError;

  /// No description provided for @serviceSharedErrorReason.
  ///
  /// In zh, this message translates to:
  /// **'正在共享的刷新任务异常结束，本次调用也收到了相同异常。'**
  String get serviceSharedErrorReason;

  /// No description provided for @serviceExecutionErrorReason.
  ///
  /// In zh, this message translates to:
  /// **'刷新在完成全部模块前异常结束，请查看技术详情。'**
  String get serviceExecutionErrorReason;

  /// No description provided for @serviceFutureFallback.
  ///
  /// In zh, this message translates to:
  /// **'未来学年校历使用预期回退'**
  String get serviceFutureFallback;

  /// No description provided for @serviceFutureFallbackReason.
  ///
  /// In zh, this message translates to:
  /// **'未来学年配置尚未发布，App 已使用默认配置；这不会被视为严重故障。'**
  String get serviceFutureFallbackReason;

  /// No description provided for @serviceSessionIssue.
  ///
  /// In zh, this message translates to:
  /// **'教务网会话可能失效'**
  String get serviceSessionIssue;

  /// No description provided for @serviceSessionIssueStatus.
  ///
  /// In zh, this message translates to:
  /// **'教务网会话可能失效或请求被服务端拒绝，本次请求返回 {status}。'**
  String serviceSessionIssueStatus(String status);

  /// No description provided for @serviceServerFailed.
  ///
  /// In zh, this message translates to:
  /// **'服务端请求未成功'**
  String get serviceServerFailed;

  /// No description provided for @serviceHttpFailed.
  ///
  /// In zh, this message translates to:
  /// **'服务端返回 HTTP {status}，请稍后重试或查看技术详情。'**
  String serviceHttpFailed(String status);

  /// No description provided for @serviceNullField.
  ///
  /// In zh, this message translates to:
  /// **'App 未正确处理空字段'**
  String get serviceNullField;

  /// No description provided for @serviceNullFieldReason.
  ///
  /// In zh, this message translates to:
  /// **'App 未正确处理接口中的空字段；如果有缓存，旧数据仍会保留。'**
  String get serviceNullFieldReason;

  /// No description provided for @serviceNetworkIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'网络请求未完成'**
  String get serviceNetworkIncomplete;

  /// No description provided for @serviceNetworkIncompleteReason.
  ///
  /// In zh, this message translates to:
  /// **'网络连接中断或请求超时，App 可能已重试或使用缓存。'**
  String get serviceNetworkIncompleteReason;

  /// No description provided for @serviceCoordinationError.
  ///
  /// In zh, this message translates to:
  /// **'刷新协调异常'**
  String get serviceCoordinationError;

  /// No description provided for @serviceCoordinationReason.
  ///
  /// In zh, this message translates to:
  /// **'检测到旧版“已有刷新任务并跳过”结果；正常情况下调用者应共享或等待现有任务。'**
  String get serviceCoordinationReason;

  /// No description provided for @serviceLiveAfterBoth.
  ///
  /// In zh, this message translates to:
  /// **'重新登录并重试后，已实时获取成功。'**
  String get serviceLiveAfterBoth;

  /// No description provided for @serviceLiveAfterLogin.
  ///
  /// In zh, this message translates to:
  /// **'重新登录后，已实时获取成功。'**
  String get serviceLiveAfterLogin;

  /// No description provided for @serviceLiveAfterRetry.
  ///
  /// In zh, this message translates to:
  /// **'重试后，已实时获取成功。'**
  String get serviceLiveAfterRetry;

  /// No description provided for @serviceLiveData.
  ///
  /// In zh, this message translates to:
  /// **'已从服务端实时获取最新数据。'**
  String get serviceLiveData;

  /// No description provided for @serviceExisting.
  ///
  /// In zh, this message translates to:
  /// **'已有'**
  String get serviceExisting;

  /// No description provided for @serviceCachedSession.
  ///
  /// In zh, this message translates to:
  /// **'教务网会话可能已失效或请求被服务端拒绝，实时请求返回 {status}，本次保留了 {time} 的缓存数据。'**
  String serviceCachedSession(String status, String time);

  /// No description provided for @serviceCachedParsing.
  ///
  /// In zh, this message translates to:
  /// **'App 未正确处理接口中的空字段，本次保留了 {time} 的缓存数据。'**
  String serviceCachedParsing(String time);

  /// No description provided for @serviceCachedFailure.
  ///
  /// In zh, this message translates to:
  /// **'实时请求未成功，本次保留了 {time} 的缓存数据。'**
  String serviceCachedFailure(String time);

  /// No description provided for @serviceFailedNoCache.
  ///
  /// In zh, this message translates to:
  /// **'教务网会话可能已失效或请求被服务端拒绝，且没有可用缓存。'**
  String get serviceFailedNoCache;

  /// No description provided for @serviceParseError.
  ///
  /// In zh, this message translates to:
  /// **'App 未正确处理接口中的空字段。'**
  String get serviceParseError;

  /// No description provided for @serviceNoData.
  ///
  /// In zh, this message translates to:
  /// **'该模块没有取得可用的实时数据或缓存。'**
  String get serviceNoData;

  /// No description provided for @serviceRefreshSuccess.
  ///
  /// In zh, this message translates to:
  /// **'刷新成功'**
  String get serviceRefreshSuccess;

  /// No description provided for @serviceDegraded.
  ///
  /// In zh, this message translates to:
  /// **'部分降级'**
  String get serviceDegraded;

  /// No description provided for @serviceRefreshFailed.
  ///
  /// In zh, this message translates to:
  /// **'刷新失败'**
  String get serviceRefreshFailed;

  /// No description provided for @serviceIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'记录不完整'**
  String get serviceIncomplete;

  /// No description provided for @serviceCoordinated.
  ///
  /// In zh, this message translates to:
  /// **'正常协调完成'**
  String get serviceCoordinated;

  /// No description provided for @serviceSharedDegraded.
  ///
  /// In zh, this message translates to:
  /// **'共享任务部分降级'**
  String get serviceSharedDegraded;

  /// No description provided for @serviceSharedIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'共享任务记录不完整'**
  String get serviceSharedIncomplete;

  /// No description provided for @serviceSharedExisting.
  ///
  /// In zh, this message translates to:
  /// **'已共享现有刷新'**
  String get serviceSharedExisting;

  /// No description provided for @serviceBackgroundYielded.
  ///
  /// In zh, this message translates to:
  /// **'后台已主动让行'**
  String get serviceBackgroundYielded;

  /// No description provided for @serviceSharedDescription.
  ///
  /// In zh, this message translates to:
  /// **'本次操作没有重复请求服务器，已等待正在执行的刷新任务。'**
  String get serviceSharedDescription;

  /// No description provided for @serviceRelatedTaskLabel.
  ///
  /// In zh, this message translates to:
  /// **'关联任务：{id}'**
  String serviceRelatedTaskLabel(String id);

  /// No description provided for @serviceYieldDescription.
  ///
  /// In zh, this message translates to:
  /// **'检测到 App 正在前台使用，本次后台任务没有发起模块请求。'**
  String get serviceYieldDescription;

  /// No description provided for @serviceFailed.
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get serviceFailed;

  /// No description provided for @serviceNotExecuted.
  ///
  /// In zh, this message translates to:
  /// **'未执行'**
  String get serviceNotExecuted;

  /// No description provided for @serviceBackground.
  ///
  /// In zh, this message translates to:
  /// **'后台刷新'**
  String get serviceBackground;

  /// No description provided for @serviceForeground.
  ///
  /// In zh, this message translates to:
  /// **'前台刷新'**
  String get serviceForeground;

  /// No description provided for @serviceServerNetwork.
  ///
  /// In zh, this message translates to:
  /// **'服务端或网络问题'**
  String get serviceServerNetwork;

  /// No description provided for @serviceSessionExpired.
  ///
  /// In zh, this message translates to:
  /// **'会话失效'**
  String get serviceSessionExpired;

  /// No description provided for @serviceParsing.
  ///
  /// In zh, this message translates to:
  /// **'App 解析异常'**
  String get serviceParsing;

  /// No description provided for @serviceCoordination.
  ///
  /// In zh, this message translates to:
  /// **'刷新协调问题'**
  String get serviceCoordination;

  /// No description provided for @serviceExpectedFallback.
  ///
  /// In zh, this message translates to:
  /// **'预期回退'**
  String get serviceExpectedFallback;

  /// No description provided for @serviceIncompleteLog.
  ///
  /// In zh, this message translates to:
  /// **'日志不完整'**
  String get serviceIncompleteLog;

  /// No description provided for @serviceSeconds.
  ///
  /// In zh, this message translates to:
  /// **'{value} 秒'**
  String serviceSeconds(String value);

  /// No description provided for @serviceUnknownDuration.
  ///
  /// In zh, this message translates to:
  /// **'耗时未知'**
  String get serviceUnknownDuration;

  /// No description provided for @serviceDuration.
  ///
  /// In zh, this message translates to:
  /// **'耗时{value}'**
  String serviceDuration(String value);

  /// No description provided for @serviceApproximate.
  ///
  /// In zh, this message translates to:
  /// **'约 {value}'**
  String serviceApproximate(String value);

  /// No description provided for @serviceTeacher.
  ///
  /// In zh, this message translates to:
  /// **'教师: {name}'**
  String serviceTeacher(String name);

  /// No description provided for @serviceExamSeat.
  ///
  /// In zh, this message translates to:
  /// **'座位号: {seat}'**
  String serviceExamSeat(String seat);

  /// No description provided for @serviceQuerying.
  ///
  /// In zh, this message translates to:
  /// **'{source}查询进行中'**
  String serviceQuerying(String source);

  /// No description provided for @serviceQueryError.
  ///
  /// In zh, this message translates to:
  /// **'{source}查询出错：{error}'**
  String serviceQueryError(String source, String error);

  /// No description provided for @serviceSourceFailure.
  ///
  /// In zh, this message translates to:
  /// **'{source}失败：{error}'**
  String serviceSourceFailure(String source, String error);

  /// No description provided for @serviceSourceMessage.
  ///
  /// In zh, this message translates to:
  /// **'{source}：{message}'**
  String serviceSourceMessage(String source, String message);

  /// No description provided for @serviceFailure.
  ///
  /// In zh, this message translates to:
  /// **'失败：{error}'**
  String serviceFailure(String error);

  /// No description provided for @serviceLoginFailure.
  ///
  /// In zh, this message translates to:
  /// **'无法登录{service}'**
  String serviceLoginFailure(String service);

  /// No description provided for @serviceSso.
  ///
  /// In zh, this message translates to:
  /// **'统一身份认证'**
  String get serviceSso;

  /// No description provided for @servicePortal.
  ///
  /// In zh, this message translates to:
  /// **'教务网'**
  String get servicePortal;

  /// No description provided for @serviceCoursesSite.
  ///
  /// In zh, this message translates to:
  /// **'学在浙大'**
  String get serviceCoursesSite;

  /// No description provided for @serviceGrsSite.
  ///
  /// In zh, this message translates to:
  /// **'研究生院网'**
  String get serviceGrsSite;

  /// No description provided for @serviceActivitySite.
  ///
  /// In zh, this message translates to:
  /// **'素质拓展平台'**
  String get serviceActivitySite;

  /// No description provided for @serviceInvalidYear.
  ///
  /// In zh, this message translates to:
  /// **'无法解析学号中的入学年份：{id}'**
  String serviceInvalidYear(String id);

  /// No description provided for @serviceGradExams.
  ///
  /// In zh, this message translates to:
  /// **'研究生课考试'**
  String get serviceGradExams;

  /// No description provided for @serviceGradGrades.
  ///
  /// In zh, this message translates to:
  /// **'研究生课成绩'**
  String get serviceGradGrades;

  /// No description provided for @serviceUgExams.
  ///
  /// In zh, this message translates to:
  /// **'本科生课考试'**
  String get serviceUgExams;

  /// No description provided for @serviceUgGrades.
  ///
  /// In zh, this message translates to:
  /// **'本科生课成绩'**
  String get serviceUgGrades;

  /// No description provided for @serviceLiveSuccess.
  ///
  /// In zh, this message translates to:
  /// **'实时成功'**
  String get serviceLiveSuccess;

  /// No description provided for @serviceCached.
  ///
  /// In zh, this message translates to:
  /// **'使用缓存'**
  String get serviceCached;

  /// No description provided for @serviceCalendar.
  ///
  /// In zh, this message translates to:
  /// **'校历'**
  String get serviceCalendar;

  /// No description provided for @serviceTimetable.
  ///
  /// In zh, this message translates to:
  /// **'课表'**
  String get serviceTimetable;

  /// No description provided for @serviceExam.
  ///
  /// In zh, this message translates to:
  /// **'考试'**
  String get serviceExam;

  /// No description provided for @serviceGrade.
  ///
  /// In zh, this message translates to:
  /// **'成绩'**
  String get serviceGrade;

  /// No description provided for @serviceHomework.
  ///
  /// In zh, this message translates to:
  /// **'作业'**
  String get serviceHomework;

  /// No description provided for @serviceUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未知'**
  String get serviceUnknown;

  /// No description provided for @serviceModuleNotRun.
  ///
  /// In zh, this message translates to:
  /// **'未发起独立模块请求。'**
  String get serviceModuleNotRun;

  /// No description provided for @serviceRequestTimeout.
  ///
  /// In zh, this message translates to:
  /// **'请求超时'**
  String get serviceRequestTimeout;

  /// No description provided for @serviceNetworkFailed.
  ///
  /// In zh, this message translates to:
  /// **'网络连接失败'**
  String get serviceNetworkFailed;

  /// No description provided for @serviceRequestStateError.
  ///
  /// In zh, this message translates to:
  /// **'请求状态异常'**
  String get serviceRequestStateError;

  /// No description provided for @serviceInvalidResponse.
  ///
  /// In zh, this message translates to:
  /// **'返回数据格式异常'**
  String get serviceInvalidResponse;

  /// No description provided for @serviceRequestFailed.
  ///
  /// In zh, this message translates to:
  /// **'请求失败'**
  String get serviceRequestFailed;

  /// No description provided for @serviceDefaultConfiguration.
  ///
  /// In zh, this message translates to:
  /// **'使用默认配置'**
  String get serviceDefaultConfiguration;

  /// No description provided for @serviceUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'不可用'**
  String get serviceUnavailable;

  /// No description provided for @serviceCourseSite.
  ///
  /// In zh, this message translates to:
  /// **'学在浙大'**
  String get serviceCourseSite;

  /// No description provided for @serviceEcard.
  ///
  /// In zh, this message translates to:
  /// **'校园卡'**
  String get serviceEcard;

  /// No description provided for @serviceGrs.
  ///
  /// In zh, this message translates to:
  /// **'研究生院'**
  String get serviceGrs;

  /// No description provided for @sharedLanguage.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get sharedLanguage;

  /// No description provided for @sharedConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get sharedConfirm;

  /// No description provided for @sharedCancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get sharedCancel;

  /// No description provided for @sharedSpring.
  ///
  /// In zh, this message translates to:
  /// **'春'**
  String get sharedSpring;

  /// No description provided for @sharedSummer.
  ///
  /// In zh, this message translates to:
  /// **'夏'**
  String get sharedSummer;

  /// No description provided for @sharedAutumn.
  ///
  /// In zh, this message translates to:
  /// **'秋'**
  String get sharedAutumn;

  /// No description provided for @sharedWinter.
  ///
  /// In zh, this message translates to:
  /// **'冬'**
  String get sharedWinter;

  /// No description provided for @sharedSpringSummer.
  ///
  /// In zh, this message translates to:
  /// **'春夏'**
  String get sharedSpringSummer;

  /// No description provided for @sharedAutumnWinter.
  ///
  /// In zh, this message translates to:
  /// **'秋冬'**
  String get sharedAutumnWinter;

  /// No description provided for @sharedUnknownCourse.
  ///
  /// In zh, this message translates to:
  /// **'未知课程'**
  String get sharedUnknownCourse;

  /// No description provided for @sharedUnknownTeacher.
  ///
  /// In zh, this message translates to:
  /// **'未知教师'**
  String get sharedUnknownTeacher;

  /// No description provided for @sharedUnknownLocation.
  ///
  /// In zh, this message translates to:
  /// **'无地点'**
  String get sharedUnknownLocation;

  /// No description provided for @sharedUnknown.
  ///
  /// In zh, this message translates to:
  /// **'未知'**
  String get sharedUnknown;

  /// No description provided for @sharedGradeExcellent.
  ///
  /// In zh, this message translates to:
  /// **'优秀'**
  String get sharedGradeExcellent;

  /// No description provided for @sharedGradeGood.
  ///
  /// In zh, this message translates to:
  /// **'良好'**
  String get sharedGradeGood;

  /// No description provided for @sharedGradeAverage.
  ///
  /// In zh, this message translates to:
  /// **'中等'**
  String get sharedGradeAverage;

  /// No description provided for @sharedGradePass.
  ///
  /// In zh, this message translates to:
  /// **'及格'**
  String get sharedGradePass;

  /// No description provided for @sharedGradeFail.
  ///
  /// In zh, this message translates to:
  /// **'不及格'**
  String get sharedGradeFail;

  /// No description provided for @sharedQualified.
  ///
  /// In zh, this message translates to:
  /// **'合格'**
  String get sharedQualified;

  /// No description provided for @sharedUnqualified.
  ///
  /// In zh, this message translates to:
  /// **'不合格'**
  String get sharedUnqualified;

  /// No description provided for @sharedWithdrawn.
  ///
  /// In zh, this message translates to:
  /// **'弃修'**
  String get sharedWithdrawn;

  /// No description provided for @sharedAbsent.
  ///
  /// In zh, this message translates to:
  /// **'缺考'**
  String get sharedAbsent;

  /// No description provided for @sharedDeferred.
  ///
  /// In zh, this message translates to:
  /// **'缓考'**
  String get sharedDeferred;

  /// No description provided for @sharedPendingGrade.
  ///
  /// In zh, this message translates to:
  /// **'待录'**
  String get sharedPendingGrade;

  /// No description provided for @sharedInvalid.
  ///
  /// In zh, this message translates to:
  /// **'无效'**
  String get sharedInvalid;

  /// No description provided for @sharedTaskDeadline.
  ///
  /// In zh, this message translates to:
  /// **'DDL'**
  String get sharedTaskDeadline;

  /// No description provided for @sharedTaskEvent.
  ///
  /// In zh, this message translates to:
  /// **'日程'**
  String get sharedTaskEvent;

  /// No description provided for @sharedPastEvent.
  ///
  /// In zh, this message translates to:
  /// **'过去日程'**
  String get sharedPastEvent;

  /// No description provided for @sharedRunning.
  ///
  /// In zh, this message translates to:
  /// **'进行中'**
  String get sharedRunning;

  /// No description provided for @sharedPaused.
  ///
  /// In zh, this message translates to:
  /// **'已暂停'**
  String get sharedPaused;

  /// No description provided for @sharedComplete.
  ///
  /// In zh, this message translates to:
  /// **'完成'**
  String get sharedComplete;

  /// No description provided for @sharedExpired.
  ///
  /// In zh, this message translates to:
  /// **'已过期'**
  String get sharedExpired;

  /// No description provided for @sharedDeleted.
  ///
  /// In zh, this message translates to:
  /// **'已删除'**
  String get sharedDeleted;

  /// No description provided for @sharedNoRepeat.
  ///
  /// In zh, this message translates to:
  /// **'不重复'**
  String get sharedNoRepeat;

  /// No description provided for @sharedRepeatDays.
  ///
  /// In zh, this message translates to:
  /// **'每隔几天'**
  String get sharedRepeatDays;

  /// No description provided for @sharedRepeatMonth.
  ///
  /// In zh, this message translates to:
  /// **'每月的这一天'**
  String get sharedRepeatMonth;

  /// No description provided for @sharedRepeatYear.
  ///
  /// In zh, this message translates to:
  /// **'每年的这一天'**
  String get sharedRepeatYear;

  /// No description provided for @sharedTomorrow.
  ///
  /// In zh, this message translates to:
  /// **'明天 '**
  String get sharedTomorrow;

  /// No description provided for @sharedYesterday.
  ///
  /// In zh, this message translates to:
  /// **'昨天 '**
  String get sharedYesterday;

  /// No description provided for @sharedDayAfterTomorrow.
  ///
  /// In zh, this message translates to:
  /// **'后天 '**
  String get sharedDayAfterTomorrow;

  /// No description provided for @sharedDayBeforeYesterday.
  ///
  /// In zh, this message translates to:
  /// **'前天 '**
  String get sharedDayBeforeYesterday;

  /// No description provided for @sharedNextDay.
  ///
  /// In zh, this message translates to:
  /// **'次日 '**
  String get sharedNextDay;

  /// No description provided for @sharedLive.
  ///
  /// In zh, this message translates to:
  /// **'实时成功'**
  String get sharedLive;

  /// No description provided for @sharedCache.
  ///
  /// In zh, this message translates to:
  /// **'使用缓存'**
  String get sharedCache;

  /// No description provided for @sharedFallback.
  ///
  /// In zh, this message translates to:
  /// **'使用默认配置'**
  String get sharedFallback;

  /// No description provided for @sharedUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'不可用'**
  String get sharedUnavailable;

  /// No description provided for @sharedApproved.
  ///
  /// In zh, this message translates to:
  /// **'审核通过'**
  String get sharedApproved;

  /// No description provided for @sharedPendingReview.
  ///
  /// In zh, this message translates to:
  /// **'待审核'**
  String get sharedPendingReview;

  /// No description provided for @sharedNotApproved.
  ///
  /// In zh, this message translates to:
  /// **'审核未通过'**
  String get sharedNotApproved;

  /// No description provided for @sharedMidterm.
  ///
  /// In zh, this message translates to:
  /// **'期中考试'**
  String get sharedMidterm;

  /// No description provided for @sharedFinalExam.
  ///
  /// In zh, this message translates to:
  /// **'期末考试'**
  String get sharedFinalExam;

  /// No description provided for @sharedAll.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get sharedAll;

  /// No description provided for @sharedNetworkFailed.
  ///
  /// In zh, this message translates to:
  /// **'网络连接失败'**
  String get sharedNetworkFailed;

  /// No description provided for @sharedRequestTimeout.
  ///
  /// In zh, this message translates to:
  /// **'请求超时'**
  String get sharedRequestTimeout;

  /// No description provided for @sharedRequestFailed.
  ///
  /// In zh, this message translates to:
  /// **'请求失败'**
  String get sharedRequestFailed;

  /// No description provided for @sharedStateError.
  ///
  /// In zh, this message translates to:
  /// **'请求状态异常'**
  String get sharedStateError;

  /// No description provided for @sharedFormatError.
  ///
  /// In zh, this message translates to:
  /// **'返回数据格式异常'**
  String get sharedFormatError;

  /// No description provided for @sharedUnknownError.
  ///
  /// In zh, this message translates to:
  /// **'未知错误'**
  String get sharedUnknownError;

  /// No description provided for @sharedCalendarUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'当前学期校历配置暂未发布'**
  String get sharedCalendarUnavailable;

  /// No description provided for @sharedGrades.
  ///
  /// In zh, this message translates to:
  /// **'成绩'**
  String get sharedGrades;

  /// No description provided for @sharedAssignments.
  ///
  /// In zh, this message translates to:
  /// **'作业'**
  String get sharedAssignments;

  /// No description provided for @sharedSchedule.
  ///
  /// In zh, this message translates to:
  /// **'课表'**
  String get sharedSchedule;

  /// No description provided for @sharedExams.
  ///
  /// In zh, this message translates to:
  /// **'考试'**
  String get sharedExams;

  /// No description provided for @sharedRefresh.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get sharedRefresh;

  /// No description provided for @sharedLogin.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get sharedLogin;

  /// No description provided for @sharedCalendar.
  ///
  /// In zh, this message translates to:
  /// **'校历'**
  String get sharedCalendar;

  /// No description provided for @sharedPractice.
  ///
  /// In zh, this message translates to:
  /// **'素质拓展'**
  String get sharedPractice;

  /// No description provided for @sharedGraduate.
  ///
  /// In zh, this message translates to:
  /// **'研究生'**
  String get sharedGraduate;

  /// No description provided for @sharedUndergraduate.
  ///
  /// In zh, this message translates to:
  /// **'本科生'**
  String get sharedUndergraduate;

  /// No description provided for @sharedExamDay.
  ///
  /// In zh, this message translates to:
  /// **'考试周第 {day} 天'**
  String sharedExamDay(int day);

  /// No description provided for @sharedDaysAgo.
  ///
  /// In zh, this message translates to:
  /// **'{count} 天前 '**
  String sharedDaysAgo(int count);

  /// No description provided for @sharedDaysLater.
  ///
  /// In zh, this message translates to:
  /// **'{count} 天后 '**
  String sharedDaysLater(int count);

  /// No description provided for @sharedHours.
  ///
  /// In zh, this message translates to:
  /// **'{count} 小时'**
  String sharedHours(int count);

  /// No description provided for @sharedMinutes.
  ///
  /// In zh, this message translates to:
  /// **'{count} 分钟'**
  String sharedMinutes(int count);

  /// No description provided for @sharedSessionTime.
  ///
  /// In zh, this message translates to:
  /// **'{week}周{day}第{periods}节'**
  String sharedSessionTime(String week, String day, String periods);

  /// No description provided for @sharedOddWeek.
  ///
  /// In zh, this message translates to:
  /// **'单 - '**
  String get sharedOddWeek;

  /// No description provided for @sharedEvenWeek.
  ///
  /// In zh, this message translates to:
  /// **'双 - '**
  String get sharedEvenWeek;

  /// No description provided for @sharedUnknownLocation2.
  ///
  /// In zh, this message translates to:
  /// **'未知地点'**
  String get sharedUnknownLocation2;

  /// No description provided for @sharedMidtermShort.
  ///
  /// In zh, this message translates to:
  /// **'期中'**
  String get sharedMidtermShort;

  /// No description provided for @sharedFinalShort.
  ///
  /// In zh, this message translates to:
  /// **'期末'**
  String get sharedFinalShort;

  /// No description provided for @sharedMon.
  ///
  /// In zh, this message translates to:
  /// **'一'**
  String get sharedMon;

  /// No description provided for @sharedTue.
  ///
  /// In zh, this message translates to:
  /// **'二'**
  String get sharedTue;

  /// No description provided for @sharedWed.
  ///
  /// In zh, this message translates to:
  /// **'三'**
  String get sharedWed;

  /// No description provided for @sharedThu.
  ///
  /// In zh, this message translates to:
  /// **'四'**
  String get sharedThu;

  /// No description provided for @sharedFri.
  ///
  /// In zh, this message translates to:
  /// **'五'**
  String get sharedFri;

  /// No description provided for @sharedSat.
  ///
  /// In zh, this message translates to:
  /// **'六'**
  String get sharedSat;

  /// No description provided for @sharedSun.
  ///
  /// In zh, this message translates to:
  /// **'日'**
  String get sharedSun;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
