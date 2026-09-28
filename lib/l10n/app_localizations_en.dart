// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get academicAcademics => 'Academics';

  @override
  String get academicActivityEnd => 'Activity ends';

  @override
  String get academicActivityStart => 'Activity starts';

  @override
  String academicArtPassed(String status) {
    return 'Arts: $status';
  }

  @override
  String get academicArts => 'Arts education';

  @override
  String get academicAssignment => 'Assignments';

  @override
  String get academicBack => 'Back';

  @override
  String get academicBasicInfo => 'Course info';

  @override
  String get academicBySemester => 'By term';

  @override
  String get academicCachedDetails =>
      'Project details are cached or from the previous refresh.';

  @override
  String get academicCachedPoints =>
      'These points use cached data or the sum of project records. Refresh when your connection is restored.';

  @override
  String get academicCheckPortal =>
      'Verify these details in the Academic Portal.';

  @override
  String get academicChooseCourse => 'Choose a course';

  @override
  String get academicClassSessions => 'Class sessions';

  @override
  String get academicClassroomCategory => 'Classroom category';

  @override
  String get academicClassroomPointsLong => 'Class IV points';

  @override
  String get academicClassroomPointsMid => 'Class III points';

  @override
  String get academicClassroomPointsShort => 'Class II points';

  @override
  String get academicConflictCourse => 'Conflicting courses';

  @override
  String get academicCountedTowardTotal => 'Counted toward total';

  @override
  String academicCourseCode(String code) {
    return 'Course code: $code';
  }

  @override
  String get academicCourseCredit => 'Course';

  @override
  String academicCourseCreditValue(String credits) {
    return '$credits credits';
  }

  @override
  String get academicCourseDetails => 'Course details';

  @override
  String academicCourseIdValue(String code) {
    return 'Course: $code';
  }

  @override
  String get academicCourses => 'Courses';

  @override
  String get academicCredits => 'Credits';

  @override
  String get academicDegraded => 'Degraded';

  @override
  String get academicDescription => 'Description';

  @override
  String academicDetailsSource(String source) {
    return 'Details source: $source';
  }

  @override
  String get academicDueThisWeek => 'Due this week';

  @override
  String get academicDueToday => 'Due within 1 day';

  @override
  String get academicEarnedCredits => 'Credits earned';

  @override
  String academicExamTime(String time) {
    return 'Time: $time';
  }

  @override
  String get academicExams => 'Exams';

  @override
  String get academicFailure => 'Failed';

  @override
  String get academicFetchProblem =>
      'Unable to retrieve data. Check your network connection and try again.\nNote: You must complete all course evaluations before grades are available.';

  @override
  String get academicFetchProblemShort => 'Unable to retrieve data';

  @override
  String get academicFivePoint => '5-point GPA';

  @override
  String get academicFourPoint => '4-point GPA';

  @override
  String get academicFourthClassroom => 'Class IV';

  @override
  String get academicFriday => 'Fri';

  @override
  String academicGrade(String grade, String scale) {
    return 'Grade: $grade / $scale';
  }

  @override
  String academicGradeCredit(String id, String credits) {
    return '$id / $credits credits';
  }

  @override
  String academicGradeValue(String grade, String scale) {
    return 'Grade: $grade / $scale';
  }

  @override
  String get academicGrades => 'Grades';

  @override
  String get academicHideCourseInfo => 'Hide course information';

  @override
  String academicIncludedExcludedCounts(int includedCount, int excludedCount) {
    return '$includedCount included · $excludedCount excluded';
  }

  @override
  String get academicLabor => 'Labor education';

  @override
  String academicLaborPassed(String status) {
    return 'Labor: $status';
  }

  @override
  String get academicLastUpdated => 'Last updated';

  @override
  String get academicLegacyPracticeOnly =>
      'Only the legacy practice summary is available; getSqjl project details are unavailable.';

  @override
  String academicLocation(String location) {
    return 'Location: $location';
  }

  @override
  String academicLocationLabel(String location) {
    return 'Location: $location';
  }

  @override
  String get academicLongPressClear => 'Long press to clear';

  @override
  String get academicMajorCredits => 'Major credits this year';

  @override
  String get academicMajorCreditsShort => 'Major credits';

  @override
  String get academicMajorFourPoint => 'Major 4-point GPA this year';

  @override
  String get academicMajorGpa => 'Major GPA';

  @override
  String get academicMidterm => ' (Midterm)';

  @override
  String get academicMonday => 'Mon';

  @override
  String get academicNoCountedProjects =>
      'No projects counted toward the total';

  @override
  String get academicNoEndTime => 'None';

  @override
  String get academicNoPendingProjects => 'No pending or excluded projects';

  @override
  String get academicNotCounted => 'Not counted toward total';

  @override
  String get academicNotCountedNotice =>
      'This project is not currently counted toward the total.';

  @override
  String get academicNotFilled => 'Not provided';

  @override
  String get academicNotLoggedIn => 'Not signed in';

  @override
  String get academicNotPassed => 'Not passed';

  @override
  String get academicOK => 'OK';

  @override
  String get academicOfficialPointsTotal => 'Official points total';

  @override
  String get academicOfflineCacheNote =>
      'Cached data is used automatically when syncing fails.';

  @override
  String get academicOnlineCourse => 'Online';

  @override
  String get academicPassed => 'Passed';

  @override
  String get academicPendingOrExcluded => 'Pending or excluded';

  @override
  String get academicPendingUpdate => 'Pending update';

  @override
  String get academicPercentage => 'Percentage';

  @override
  String get academicPointsEarned => 'Points earned';

  @override
  String get academicPointsMayDiffer =>
      'The official total may differ from project records. Project details are shown as returned by getSqjl.';

  @override
  String academicPointsSource(String source) {
    return 'Points source: $source';
  }

  @override
  String get academicPractice => 'Practice';

  @override
  String get academicPracticeClassroom => 'Practice';

  @override
  String get academicPracticeDetails => 'Practice project details';

  @override
  String get academicPracticeDetailsUnavailable =>
      'getSqjl project details are unavailable. Try refreshing later.';

  @override
  String get academicPracticeFetchProblem =>
      'Unable to retrieve practice points';

  @override
  String academicPracticeProjects(String category) {
    return '$category projects';
  }

  @override
  String get academicProjectCategory => 'Project category';

  @override
  String get academicProjectName => 'Project name';

  @override
  String get academicPullToRefresh => 'Pull to refresh';

  @override
  String get academicQualityCategory => 'Quality category';

  @override
  String get academicRefreshDetails => 'Refresh details';

  @override
  String academicRefreshProblem(int degradedCount, int failureCount) {
    return 'Refresh issues: $degradedCount degraded, $failureCount failed';
  }

  @override
  String get academicReset => 'Reset';

  @override
  String get academicRetry => 'Try again';

  @override
  String get academicReviewStatus => 'Review status';

  @override
  String get academicRoleOrReason => 'Role or reason for points';

  @override
  String get academicSaturday => 'Sat';

  @override
  String get academicSchedule => 'Schedule';

  @override
  String get academicSchoolYearCredits => 'Credits this year';

  @override
  String get academicSchoolYearFourPoint => '4-point GPA this year';

  @override
  String get academicSchoolYearGpa => 'GPA this year';

  @override
  String get academicSearchCoursesTasks => 'Search courses and tasks...';

  @override
  String get academicSearchShort => 'Search';

  @override
  String academicSeat(String seat) {
    return 'Seat: $seat';
  }

  @override
  String academicSeatLabel(String seat) {
    return 'Seat: $seat';
  }

  @override
  String get academicSecondClassroom => 'Class II';

  @override
  String academicSectionCount(String title, int count) {
    return '$title ($count)';
  }

  @override
  String get academicSelectAll => 'Select all';

  @override
  String get academicSelectedCredits => 'Selected credits';

  @override
  String get academicSelectedFivePoint => 'Selected 5-point GPA';

  @override
  String get academicSelectedFourPoint => 'Selected 4-point GPA';

  @override
  String get academicSelectedPercentage => 'Selected percentage';

  @override
  String academicSemesterHours(String semester) {
    return '$semester term sessions';
  }

  @override
  String academicSemesterSuffix(String semester) {
    return '$semester term sessions';
  }

  @override
  String academicSessionCount(int count) {
    return '$count sessions / 2 weeks';
  }

  @override
  String academicSessionsPerTwoWeeks(double count) {
    return '$count sessions / 2 weeks';
  }

  @override
  String get academicSunday => 'Sun';

  @override
  String academicTeacher(String teacher) {
    return 'Instructor: $teacher';
  }

  @override
  String academicTeacherValue(String teacher) {
    return 'Instructor: $teacher';
  }

  @override
  String get academicThirdClassroom => 'Class III';

  @override
  String get academicThursday => 'Thu';

  @override
  String academicTimeLabel(String time) {
    return 'Time: $time';
  }

  @override
  String get academicTotal => 'Total';

  @override
  String get academicTuesday => 'Tue';

  @override
  String get academicUnknown => 'Unknown';

  @override
  String get academicUnselectedFivePoint => 'Unselected 5-point GPA';

  @override
  String get academicUnselectedFourPoint => 'Unselected 4-point GPA';

  @override
  String academicUpdatedAt(String time) {
    return 'Updated: $time';
  }

  @override
  String academicUpdatedAtShort(String time) {
    return 'Updated $time';
  }

  @override
  String academicUpdatedMinutesAgo(int minutes) {
    return 'Updated $minutes min ago';
  }

  @override
  String get academicViewDetails => 'View details';

  @override
  String get academicWednesday => 'Wed';

  @override
  String get academicWeight => 'Weight';

  @override
  String get academicWeightedCredits => 'Weighted credits';

  @override
  String get academicWeightedFivePoint => 'Weighted 5-point GPA';

  @override
  String get academicWeightedGrades => 'Weighted grades';

  @override
  String get academicRefreshingCalendar => 'Syncing academic calendar...';

  @override
  String get academicFetchingSchedule => 'Fetching class schedule...';

  @override
  String get academicParsingExams => 'Reading exam schedule...';

  @override
  String get academicWaitingGrades => 'Waiting for grades...';

  @override
  String get academicCheckingMajorGrades => 'Checking major grades...';

  @override
  String get academicSyncingAssignments => 'Syncing assignments...';

  @override
  String get academicCountingPracticeCredits => 'Counting activity credits...';

  @override
  String get academicParsingUndergraduateExams =>
      'Reading undergraduate exams...';

  @override
  String get academicWaitingUndergraduateGrades =>
      'Waiting for undergraduate grades...';

  @override
  String get academicParsingGraduateExams => 'Reading graduate exams...';

  @override
  String get academicWaitingGraduateGrades => 'Waiting for graduate grades...';

  @override
  String get academicCalendarUpdated => 'Academic calendar updated';

  @override
  String get academicScheduleFetched => 'Class schedule updated';

  @override
  String get academicExamsFetched => 'Exam schedule updated';

  @override
  String get academicGradesFetched => 'Grades updated';

  @override
  String get academicMajorGradesUpdated => 'Major grades updated';

  @override
  String get academicAssignmentsFetched => 'Assignments updated';

  @override
  String get academicActivityCreditsUpdated => 'Activity credits updated';

  @override
  String get academicConfigUpdated => 'Academic calendar updated';

  @override
  String get academicUndergraduateExamsFetched => 'Undergraduate exams updated';

  @override
  String get academicUndergraduateGradesFetched =>
      'Undergraduate grades updated';

  @override
  String get academicGraduateExamsFetched => 'Graduate exams updated';

  @override
  String get academicGraduateGradesFetched => 'Graduate grades updated';

  @override
  String get academicCalendarFetchFailed => 'Could not load academic calendar';

  @override
  String get academicScheduleFetchFailed => 'Could not load class schedule';

  @override
  String get academicExamsFetchFailed => 'Could not load exam schedule';

  @override
  String get academicGradesFetchFailed => 'Could not load grades';

  @override
  String get academicMajorGradesFetchFailed => 'Could not load major grades';

  @override
  String get academicAssignmentsFetchFailed => 'Could not load assignments';

  @override
  String get academicActivityCreditsFetchFailed =>
      'Could not load activity credits';

  @override
  String get academicConfigFetchFailed => 'Could not load calendar settings';

  @override
  String get academicUndergraduateExamsFetchFailed =>
      'Could not load undergraduate exams';

  @override
  String get academicUndergraduateGradesFetchFailed =>
      'Could not load undergraduate grades';

  @override
  String get academicGraduateExamsFetchFailed =>
      'Could not load graduate exams';

  @override
  String get academicGraduateGradesFetchFailed =>
      'Could not load graduate grades';

  @override
  String get academicSyncingData => 'Syncing academic data...';

  @override
  String get academicWaitingServer => 'Waiting for the server...';

  @override
  String get academicStillFetching => 'Still fetching...';

  @override
  String get academicFinishingRefresh => 'Finishing refresh...';

  @override
  String get coreUpNext => 'Up Next';

  @override
  String get coreCalendar => 'Calendar';

  @override
  String get coreTasks => 'Tasks';

  @override
  String get coreAcademics => 'Academics';

  @override
  String get coreSettings => 'Settings';

  @override
  String get coreUpdateAvailable => 'Update available';

  @override
  String get coreIgnore => 'Ignore';

  @override
  String get coreVisitWebsite => 'Visit website';

  @override
  String get coreTimeUntilEnd => 'Ends in';

  @override
  String get coreTimeUntilStart => 'Starts in';

  @override
  String get coreStartPlanning => 'Start planning';

  @override
  String get coreTapToChangeStartTime => 'Tap to change the start time';

  @override
  String get coreBack => 'Back';

  @override
  String get coreConfirm => 'OK';

  @override
  String get coreBreakTimeShortened => 'Breaks shortened';

  @override
  String get coreStartTimeMustBeFuture => 'Start time must be in the future';

  @override
  String get coreAdjustStartTime => 'Please adjust the start time.';

  @override
  String get coreCreate => 'Create';

  @override
  String get corePlanExpired => 'Plan expired';

  @override
  String get coreReplan => 'Replan';

  @override
  String get coreNothingToDoToday => 'Nothing planned for today';

  @override
  String get coreInProgress => 'In progress';

  @override
  String get coreStartingSoon => 'Starting soon';

  @override
  String get coreLaterPlans => 'Later';

  @override
  String get coreExamWeekOrBreak => 'Exam period / break';

  @override
  String get coreNoSemesterInfo => 'No semester information';

  @override
  String get coreOutsideSemester => 'Outside the semester';

  @override
  String get coreToday => 'Today';

  @override
  String get coreSwitchView => 'Switch view';

  @override
  String get coreShowFullMonth => 'Show full month';

  @override
  String get coreShowWeek => 'Show week';

  @override
  String get coreRepeatedEventUpcoming =>
      'Repeated event, upcoming occurrences:';

  @override
  String get coreEdit => 'Edit';

  @override
  String get coreDelete => 'Delete';

  @override
  String get coreTimePlanning => 'Time planning';

  @override
  String get coreExpectedDuration => 'Estimated duration';

  @override
  String get coreHours => 'hours';

  @override
  String get coreMinutes => 'minutes';

  @override
  String get coreTimeSpent => 'Time spent';

  @override
  String get coreAllowBreaks => 'Allow breaks';

  @override
  String get coreEventSettings => 'Event settings';

  @override
  String get coreRepeat => 'Repeat';

  @override
  String get coreRepeatInterval => 'Repeat interval';

  @override
  String get coreRepeatUntil => 'Repeat until';

  @override
  String get coreExcludeFromPlanning => 'Exclude tasks from this event';

  @override
  String get coreAdditionalInfo => 'Additional information';

  @override
  String get coreLocation => 'Location';

  @override
  String get coreDescription => 'Description';

  @override
  String get coreDeleteTask => 'Delete task';

  @override
  String get coreNotStarted => 'Not started';

  @override
  String get coreEnded => 'Ended';

  @override
  String get coreOngoing => 'Ongoing';

  @override
  String get coreDeleteCompletedTasks => 'Delete completed tasks';

  @override
  String get coreDeleteExpiredTasks => 'Delete expired tasks';

  @override
  String get corePauseAllTasks => 'Pause all tasks';

  @override
  String get coreResumeAllTasks => 'Resume all tasks';

  @override
  String get coreCancel => 'Cancel';

  @override
  String get coreNoTasks => 'No tasks';

  @override
  String get coreToDo => 'To do';

  @override
  String get coreCompleted => 'Completed';

  @override
  String get coreEventList => 'Events';

  @override
  String get coreSearchPlaceholder => 'Search courses and tasks...';

  @override
  String get coreSecurityVerification => 'Security check';

  @override
  String get coreTapImageToRefresh => 'Tap the image to refresh';

  @override
  String get coreEnterCaptcha => 'Enter the verification code';

  @override
  String get coreCampusLogin => 'Campus account login';

  @override
  String get coreStudentId => 'Student ID';

  @override
  String get corePassword => 'Password';

  @override
  String get coreLoginFailed => 'Login failed';

  @override
  String get coreLogin => 'Log in';

  @override
  String get corePaymentCode => 'Payment code';

  @override
  String get coreLoading => 'Loading...';

  @override
  String get coreRefreshQrCode => 'Refresh QR code';

  @override
  String get coreOriginalCourseCode => 'Original course code';

  @override
  String get coreNewCourseCode => 'New course code';

  @override
  String get coreDisplayName => 'Display name';

  @override
  String get coreError => 'Error';

  @override
  String get coreFillAllFields => 'Please fill in all fields';

  @override
  String get coreSave => 'Save';

  @override
  String get coreCustomCourseCodeMapping => 'Course code mapping';

  @override
  String get coreAddMapping => 'Add a mapping';

  @override
  String get coreAcademicPortal => 'Academic portal';

  @override
  String get coreBackgroundRefreshExplanation =>
      'Celechron periodically refreshes data in the background. Enable notifications and keep Celechron running in the background.';

  @override
  String get coreLogOut => 'Log out';

  @override
  String get coreLogOutTitle => 'Log out';

  @override
  String get coreConfirmLogOut =>
      'Are you sure you want to log out of this account?';

  @override
  String get coreRetakeGpaCalculation => 'Retake GPA';

  @override
  String get coreUseFirstAttempt => 'Use first attempt';

  @override
  String get coreUseHighestAttempt => 'Use highest attempt';

  @override
  String get coreHideGpa => 'Hide GPA';

  @override
  String get coreAsyncRefresh => 'Refresh in background';

  @override
  String get coreGradeChangeNotifications => 'Grade change notifications';

  @override
  String get coreDeadlineNotifications => 'Deadline notifications';

  @override
  String get coreTapToLogIn => 'Tap to log in';

  @override
  String get coreWorkDuration => 'Work interval';

  @override
  String get coreBreakDuration => 'Break interval';

  @override
  String get coreAvailableWorkPeriods => 'Available work periods';

  @override
  String get coreSyncSystemCalendar => 'Sync with system calendar';

  @override
  String get coreScheduleSyncOptions => 'Schedule sync options';

  @override
  String get coreSelectSemester => 'Select semester';

  @override
  String get coreExportIcal => 'Export as iCal';

  @override
  String get coreTools => 'Tools';

  @override
  String get coreDarkMode => 'Appearance';

  @override
  String get coreFollowSystem => 'System default';

  @override
  String get coreLightMode => 'Light';

  @override
  String get coreAbout => 'About';

  @override
  String get coreDiagnostics => 'Diagnostics and tests';

  @override
  String get coreTestLogs => 'Diagnostic logs';

  @override
  String get coreDiagnosticLogsDescription =>
      'View, copy, or export redacted TXT logs';

  @override
  String get coreAboutCelechron => 'About Celechron';

  @override
  String get coreTermsOfService => 'Terms of service';

  @override
  String get coreProjectWebsite => 'Project website';

  @override
  String get coreNewVersionAvailable => 'A new version is available';

  @override
  String get coreEditTask => 'Edit task';

  @override
  String get coreTaskName => 'Task name';

  @override
  String get coreStartTime => 'Start time';

  @override
  String get coreEndTime => 'End time';

  @override
  String get coreDueAt => 'Due';

  @override
  String coreEndsAt(String time) {
    return 'Ends $time';
  }

  @override
  String coreStartsAt(String time) {
    return 'Starts $time';
  }

  @override
  String get coreStartAfterEnd => 'The start time must be before the end time';

  @override
  String get coreStartBeforeRepeatEnd =>
      'The start time must be before the repeat end date';

  @override
  String get coreRepeatedEventTooLong => 'This repeated event lasts too long';

  @override
  String get coreChangePeriod => 'Change period';

  @override
  String get coreChange => 'Change';

  @override
  String get corePeriodsCannotOverlap => 'Periods cannot overlap or touch';

  @override
  String get coreEditAvailablePeriods => 'Edit available work periods';

  @override
  String get coreAvailablePeriodsList => 'Available work periods';

  @override
  String get coreAddPeriod => 'Add a period';

  @override
  String get coreCredits => 'Credits';

  @override
  String get coreDesign => '🎨 Design';

  @override
  String get coreDevelopment => '🧑‍💻 Development';

  @override
  String get coreGplNotice => 'This app is open source under the GPLv3 license';

  @override
  String get coreDisclaimer => 'Disclaimer';

  @override
  String get coreWarrantyDisclaimer =>
      'To the extent permitted by applicable law, this program is provided without any warranty. Unless stated otherwise in writing, copyright holders and providers supply the program “as is” and disclaim all express or implied warranties, including implied warranties of merchantability and fitness for a particular purpose. You assume all risks arising from use of the program, including risks related to its quality and performance. If the program is defective, you are responsible for the cost of all necessary servicing, repair, or correction.';

  @override
  String get coreLiabilityLimitation => 'Limitation of liability';

  @override
  String get coreLiabilityText =>
      'Unless required by applicable law or agreed to in writing, no copyright holder or other party who modifies or redistributes the program under this license will be liable for damages, including any general, special, incidental, or consequential damages arising from use or inability to use the program. This includes, without limitation, loss or corruption of data, losses sustained by you or third parties, or failure of the program to work with other programs, even if they have been advised of the possibility of such damage.';

  @override
  String get coreViewFullGpl => 'View the full GPLv3 license';

  @override
  String get coreDiagnosticDisplayMode => 'Diagnostic log view';

  @override
  String get coreReadableReport => 'Readable report';

  @override
  String get coreRawLogs => 'Raw logs';

  @override
  String get coreNoReadableRefreshRecords => 'No readable refresh records yet';

  @override
  String get coreRefreshRecordsHint =>
      'After a refresh, this page will show its result, module status, and key events.';

  @override
  String get coreTotalDuration => 'Total time';

  @override
  String get coreSuccess => 'Succeeded';

  @override
  String get coreDegraded => 'Degraded';

  @override
  String get coreFailed => 'Failed';

  @override
  String get coreRelogged => 'Re-authenticated';

  @override
  String get coreRetried => 'Retried';

  @override
  String get coreCacheFallback => 'Used cached data';

  @override
  String get coreHideDetails => 'Hide details';

  @override
  String get coreViewDetails => 'View details';

  @override
  String get coreModuleStatus => 'Module status';

  @override
  String get coreKeyTimeline => 'Key events';

  @override
  String get coreNoKeyEvents => 'No key events to display.';

  @override
  String get coreIssuesFound => 'Issues found';

  @override
  String get coreNoIssues => 'No issues to report.';

  @override
  String get coreReauthenticated => 'Re-authenticated';

  @override
  String get coreCacheUpdatedAt => 'Cache updated ';

  @override
  String get coreHideTechnicalDetails => 'Hide technical details';

  @override
  String get coreViewTechnicalDetails => 'View technical details';

  @override
  String get coreUtcTime => 'UTC time';

  @override
  String get coreHttpStatus => 'HTTP status';

  @override
  String get coreRequestInterface => 'Request endpoint';

  @override
  String get coreRedactedUrl => 'Redacted URL';

  @override
  String get coreExceptionType => 'Exception type';

  @override
  String get coreExceptionSummary => 'Error summary';

  @override
  String get coreHideStack => 'Hide stack trace';

  @override
  String get coreShowStack => 'Show stack trace';

  @override
  String get coreAppBackgroundCoordination => 'App and background coordination';

  @override
  String get coreReadingLogs => 'Reading logs…';

  @override
  String get coreNoDiagnosticLogs =>
      'No diagnostic logs yet. Run a refresh and try again.';

  @override
  String get coreFullRawLogs => 'Full raw logs';

  @override
  String get coreCopyRawLogs => 'Copy full raw logs';

  @override
  String get coreExportShareTxt => 'Export and share TXT';

  @override
  String get coreExportContents =>
      'Includes the readable report and full raw logs';

  @override
  String get coreClearTestLogs => 'Clear diagnostic logs';

  @override
  String get coreYes => 'Yes';

  @override
  String get coreNo => 'No';

  @override
  String get coreCopied => 'Copied';

  @override
  String get coreRawLogsCopied => 'Full raw logs copied to the clipboard.';

  @override
  String get coreExportSucceeded => 'Export complete';

  @override
  String get coreExportFailed => 'Export failed';

  @override
  String get coreUnableExportLogs => 'Could not export logs: ';

  @override
  String get coreCleared => 'Cleared';

  @override
  String get coreLogsCleared => 'Diagnostic logs cleared.';

  @override
  String get coreConfirmClearLogs => 'Clear diagnostic logs?';

  @override
  String get coreClearLogsWarning =>
      'Saved diagnostic records cannot be restored in the app after they are cleared.';

  @override
  String coreYearMonth(int year, int month) {
    return '$year $month';
  }

  @override
  String get coreWeekdayMon => 'Mon';

  @override
  String get coreWeekdayTue => 'Tue';

  @override
  String get coreWeekdayWed => 'Wed';

  @override
  String get coreWeekdayThu => 'Thu';

  @override
  String get coreWeekdayFri => 'Fri';

  @override
  String get coreWeekdaySat => 'Sat';

  @override
  String get coreWeekdaySun => 'Sun';

  @override
  String coreEndsIn(String duration) {
    return 'Ends in $duration';
  }

  @override
  String coreStartsIn(String duration) {
    return 'Starts in $duration';
  }

  @override
  String coreWorkBreakSummary(String work, String breakDuration) {
    return 'Work $work · Break $breakDuration';
  }

  @override
  String get coreNotEnoughTime => 'Not enough time';

  @override
  String get coreTasksDoNotFit =>
      'Some tasks still cannot fit even with no breaks. Shorten their estimated durations, or check for tasks that end before the plan starts.';

  @override
  String coreBreaksMustShrink(String duration) {
    return 'There are too many tasks. Shorten breaks to $duration to fit them all.';
  }

  @override
  String coreLocationValue(String value) {
    return 'Location: $value';
  }

  @override
  String coreDescriptionValue(String value) {
    return 'Description: $value';
  }

  @override
  String coreTimeValue(String value) {
    return 'Time: $value';
  }

  @override
  String get coreLanguage => 'Language';

  @override
  String coreDueWithExpired(String time, String expired) {
    String _temp0 = intl.Intl.selectLogic(
      expired,
      {
        'true': ' · expired',
        'other': '',
      },
    );
    return 'Due $time$_temp0';
  }

  @override
  String coreDays(int count) {
    return '$count days';
  }

  @override
  String coreTaskProgress(int percent, String expected, String remaining) {
    return '$percent% complete · Estimated: $expected · Remaining: $remaining';
  }

  @override
  String get coreMarkIncomplete => 'Mark incomplete';

  @override
  String get coreMarkComplete => 'Mark complete';

  @override
  String get corePause => 'Pause';

  @override
  String get coreResume => 'Resume';

  @override
  String coreLoggedIn(String username) {
    return 'Signed in: $username';
  }

  @override
  String corePeriodCount(int count) {
    return '$count periods';
  }

  @override
  String coreFileCreated(String fileName) {
    return 'Created $fileName';
  }

  @override
  String coreDamagedLogLines(int count) {
    return '$count log lines could not be parsed and were safely skipped.';
  }

  @override
  String get coreExporting => 'Exporting…';

  @override
  String get coreRawLogRetention =>
      'Raw logs use UTC and retain all redacted technical fields. Up to 2,000 lines and the 10 most recent exports are kept.';

  @override
  String corePaymentCodeStatus(String status) {
    return 'Payment code: $status';
  }

  @override
  String get coreLoadFailed => 'Could not load';

  @override
  String coreVersion(String version) {
    return 'Version $version';
  }

  @override
  String get coreContributorKate => 'Kate of Sky Explorer';

  @override
  String coreStartValue(String time) {
    return 'Start: $time';
  }

  @override
  String coreEndValue(String time) {
    return 'End: $time';
  }

  @override
  String get coreStartMustBeBeforeEnd =>
      'The start time must be before the end time';

  @override
  String get coreClear => 'Clear';

  @override
  String coreSeasonWeek(String season, int week) {
    return '$season, week $week';
  }

  @override
  String coreSemesterDisplay(String year, String season) {
    return '$year $season term';
  }

  @override
  String get diagnosticExportTitle => 'Celechron Diagnostic Log';

  @override
  String diagnosticExportLocalTime(String time) {
    return 'Local export time: $time';
  }

  @override
  String diagnosticExportUtcTime(String time) {
    return 'UTC export time: $time';
  }

  @override
  String diagnosticExportVersion(String version) {
    return 'App version: $version';
  }

  @override
  String diagnosticExportPlatform(String platform) {
    return 'Platform: $platform';
  }

  @override
  String diagnosticExportRefreshId(String id) {
    return 'refreshId: $id';
  }

  @override
  String diagnosticExportOrigin(String origin) {
    return 'Source: $origin';
  }

  @override
  String get diagnosticExportReadable =>
      '=== 1. Readable diagnostic report ===';

  @override
  String get diagnosticExportNoReports => 'No refresh records could be parsed.';

  @override
  String diagnosticExportTotalTime(String duration) {
    return 'Total duration: $duration';
  }

  @override
  String diagnosticExportModuleCounts(
      String success, String degraded, String failed) {
    return 'Modules: $success succeeded / $degraded used cache / $failed failed';
  }

  @override
  String diagnosticExportFlags(String relogged, String retried, String cached) {
    return 'Signed in again: $relogged; retried: $retried; cache fallback: $cached';
  }

  @override
  String get diagnosticExportYes => 'Yes';

  @override
  String get diagnosticExportNo => 'No';

  @override
  String get diagnosticExportModules => '=== 2. Module results ===';

  @override
  String diagnosticExportNoModuleRequests(String title) {
    return '$title: No separate module requests.';
  }

  @override
  String diagnosticExportModuleRow(
      String name, String state, String duration, String reason) {
    return '$name: $state; $duration; $reason';
  }

  @override
  String get diagnosticExportTimeline => '=== 3. Key timeline ===';

  @override
  String get diagnosticExportNoTimeline => 'No key timeline events.';

  @override
  String get diagnosticExportIssues => '=== 4. Issues found ===';

  @override
  String get diagnosticExportNoIssues => 'No issues to explain.';

  @override
  String diagnosticExportTechnical(
      String id,
      String utc,
      String http,
      String interfaceName,
      String url,
      String exceptionType,
      String summary,
      String stack) {
    return '  refreshId=$id; UTC=$utc; HTTP=$http; interface=$interfaceName; URL=$url; exception=$exceptionType; summary=$summary; stack=$stack';
  }

  @override
  String get diagnosticExportRaw => '=== 5. Complete raw log (UTC) ===';

  @override
  String get diagnosticExportRawNote =>
      'The timestamps below remain in ISO 8601 UTC. A time zone difference from the local times above is expected.';

  @override
  String diagnosticExportShare(String fileName) {
    return 'Celechron diagnostic log: $fileName';
  }

  @override
  String get exportReminder => 'Reminder';

  @override
  String get exportConfirm => 'OK';

  @override
  String get exportSchedule => 'Export schedule';

  @override
  String get exportChooseMethod => 'Choose an export option';

  @override
  String get exportCurrentSemester => 'Export current semester';

  @override
  String get exportChooseSemester => 'Choose semester';

  @override
  String get exportCancel => 'Cancel';

  @override
  String get exportNotice => 'Notice';

  @override
  String get exportNoData => 'No schedule data to export';

  @override
  String get exportChooseSemesterMessage => 'Choose a semester to export';

  @override
  String get exportAllSemesters => 'Export all semesters';

  @override
  String get exportSuccess => 'Success';

  @override
  String get exportError => 'Error';

  @override
  String get exportNotSignedIn => 'Sign in before exporting your schedule';

  @override
  String get exportShared =>
      'Schedule exported. Choose where to save or share it.';

  @override
  String get exportShareDescription =>
      'Schedule exported from Celechron. You can import it into another calendar app.';

  @override
  String get exportAllShareDescription =>
      'Complete schedule exported from Celechron, including all semesters.';

  @override
  String exportSemesterShareDescription(String semester) {
    return '$semester schedule exported from Celechron.';
  }

  @override
  String get exportCalendarName => 'ZJU Schedule';

  @override
  String exportCalendarSemesterName(String semester) {
    return 'ZJU Schedule — $semester';
  }

  @override
  String get exportCalendarFullName => 'ZJU Schedule — All Semesters';

  @override
  String get exportCalendarAllName => 'Schedule — All Semesters';

  @override
  String exportSemesterSchedule(String semester) {
    return '$semester Schedule';
  }

  @override
  String exportExportedSemester(String semester) {
    return '$semester schedule exported';
  }

  @override
  String get exportFullExported => 'Complete schedule exported';

  @override
  String exportFailed(String error) {
    return 'Export failed: $error';
  }

  @override
  String get exportSyncOptions => 'Calendar sync options';

  @override
  String get exportChooseSyncAction => 'Choose a calendar sync action';

  @override
  String get exportUpdateCurrent => 'Update current schedule';

  @override
  String get exportChooseSemesterSync => 'Sync a semester';

  @override
  String get exportChooseSemesterToSync => 'Choose a semester to sync';

  @override
  String get exportSyncAllSemesters => 'Sync all semesters';

  @override
  String get exportPermissionFailed => 'Permission denied';

  @override
  String get exportPermissionInstruction =>
      'Enable calendar access in system settings';

  @override
  String get exportResyncSuccess => 'Resynced successfully';

  @override
  String get exportResyncFailed => 'Resync failed';

  @override
  String get exportSyncSuccess => 'Synced successfully';

  @override
  String get exportSyncFailed => 'Sync failed';

  @override
  String exportResyncedCount(String courses, String events) {
    return 'Resynced $courses courses and $events events';
  }

  @override
  String exportSyncedCount(String courses, String events) {
    return 'Synced $courses courses and $events events';
  }

  @override
  String exportSyncedSemesterCount(
      String semester, String courses, String events) {
    return 'Synced $courses courses and $events events for $semester';
  }

  @override
  String exportSyncedAllCount(String courses, String events) {
    return 'Synced $courses courses and $events events from all semesters';
  }

  @override
  String get exportNoResync =>
      'Could not resync courses to the system calendar';

  @override
  String exportResyncError(String error) {
    return 'Error while resyncing: $error';
  }

  @override
  String get exportSemesterMissing => 'Semester not found';

  @override
  String get exportNoSyncSemester => 'No semester data to sync. Sign in first.';

  @override
  String exportNoSyncSemesterCourses(String semester) {
    return 'Could not sync courses for $semester';
  }

  @override
  String get exportNoSyncAll => 'Could not sync courses from all semesters';

  @override
  String exportSyncError(String error) {
    return 'Error while syncing: $error';
  }

  @override
  String get exportUnsupported => 'Not supported';

  @override
  String get exportMacUnsupported => 'Calendar sync is not supported on macOS';

  @override
  String get exportSignInToSync => 'Sign in before enabling calendar sync';

  @override
  String get exportIosSyncFailure =>
      'Could not sync courses to the system calendar. Remove the Google account from Calendar and try again.';

  @override
  String get exportSyncFailure =>
      'Could not sync courses to the system calendar. Check calendar access and your connection.';

  @override
  String get exportDisabled =>
      'Calendar sync is off, and the schedule and Celechron calendar were deleted';

  @override
  String get exportDisabledDeleteIssue =>
      'Calendar sync is off, but deleting the calendar encountered a problem';

  @override
  String exportDisabledDeleteError(String error) {
    return 'Calendar sync is off, but deleting the calendar failed: $error';
  }

  @override
  String exportInstructor(String name) {
    return 'Instructor: $name';
  }

  @override
  String get exportFinalExam => 'Final exam';

  @override
  String get exportMidtermExam => 'Midterm exam';

  @override
  String exportExamDescription(String name, String type, String seat) {
    return '$name - $type\nSeat: $seat';
  }

  @override
  String get notificationGradeChannel => 'Grade change alerts';

  @override
  String get notificationDeadlineChannel => 'Assignment deadline alerts';

  @override
  String get notificationFirstGradeTitle => 'Grade notifications are on';

  @override
  String get notificationFirstGradeBody =>
      'Celechron will notify you when new grades are available. You can turn this off in Settings.';

  @override
  String get notificationGradeTitle => 'New grades available';

  @override
  String get notificationGradeBody =>
      'New grades are available. Refresh the Academics page in Celechron to view them.';

  @override
  String notificationHoursUntil(int hours) {
    return 'in $hours hours';
  }

  @override
  String get notificationSoon => 'soon';

  @override
  String get notificationDeadlineTitle => 'Assignment due soon';

  @override
  String notificationDeadlineBody(String course, String name, String when) {
    return '“$name” for “$course” is due $when';
  }

  @override
  String get serviceNotRefreshed => 'Not refreshed';

  @override
  String get serviceNotSignedIn => 'Not signed in';

  @override
  String get serviceCancelled => 'Cancelled';

  @override
  String get serviceNewVersion => 'An update is available';

  @override
  String get serviceUnknownModule => 'Unknown module';

  @override
  String get serviceMajor => 'Major coursework';

  @override
  String get servicePractice => 'Co-curricular activities';

  @override
  String get servicePracticeShort => 'Activities';

  @override
  String get serviceSecondClass => 'Second Classroom';

  @override
  String get serviceThirdClass => 'Third Classroom';

  @override
  String get serviceFourthClass => 'Fourth Classroom';

  @override
  String get serviceSharedFailure => 'Shared refresh failed';

  @override
  String get serviceSharedFailureReason =>
      'The shared refresh failed. This request reused its result without contacting the server again.';

  @override
  String get serviceNotRunReason =>
      'No execution record was found for this module.';

  @override
  String get serviceMissingEnd => 'Refresh completion was not recorded';

  @override
  String get serviceBackgroundMissingEnd =>
      'The background task has no completion record. The system may have stopped it before the log was saved.';

  @override
  String get serviceForegroundMissingEnd =>
      'This refresh has no completion record. It may still be running, have stopped, or have an incomplete log.';

  @override
  String get serviceBackgroundStart => 'Background task started';

  @override
  String get serviceForegroundStart => 'Foreground refresh started';

  @override
  String get serviceRefreshErrorEnd => 'Refresh ended with an error';

  @override
  String get serviceRefreshEnd => 'Refresh finished';

  @override
  String serviceTotalDuration(String duration) {
    return 'Total time: $duration';
  }

  @override
  String get serviceForegroundActive => 'App entered the foreground';

  @override
  String get serviceLockWait => 'Waiting for the account lock';

  @override
  String get serviceShareFuture =>
      'Reusing an existing refresh for this account';

  @override
  String serviceRelatedTask(String id) {
    return 'Related task: $id';
  }

  @override
  String get serviceQueueOperation =>
      'Another operation for this account is queued';

  @override
  String get serviceYieldAfterLogin => 'Background task yielded after sign-in';

  @override
  String get serviceBackgroundYield =>
      'Background task yielded to the foreground';

  @override
  String get serviceStaleLock => 'Removed a stale refresh lock';

  @override
  String get serviceLockAcquired => 'Account refresh lock acquired';

  @override
  String get serviceLockReleased => 'Account refresh lock released';

  @override
  String serviceModuleCached(String module) {
    return '$module: using cached data';
  }

  @override
  String get serviceRelogin => 'Request continued after signing in again';

  @override
  String get serviceRetried => 'Failed request retried';

  @override
  String get serviceExecutionError => 'Refresh error';

  @override
  String get serviceSharedErrorReason =>
      'The shared refresh ended with an error; this request received the same error.';

  @override
  String get serviceExecutionErrorReason =>
      'The refresh stopped before all modules finished. See technical details.';

  @override
  String get serviceFutureFallback =>
      'Future academic year uses default calendar';

  @override
  String get serviceFutureFallbackReason =>
      'The next academic year configuration is not published yet. Default settings are in use; this is expected.';

  @override
  String get serviceSessionIssue => 'Academic portal session may have expired';

  @override
  String serviceSessionIssueStatus(String status) {
    return 'The session may have expired or the server rejected the request (status $status).';
  }

  @override
  String get serviceServerFailed => 'Server request failed';

  @override
  String serviceHttpFailed(String status) {
    return 'The server returned HTTP $status. Try again later or see technical details.';
  }

  @override
  String get serviceNullField => 'App could not process an empty field';

  @override
  String get serviceNullFieldReason =>
      'The app could not process an empty field. Any cached data has been preserved.';

  @override
  String get serviceNetworkIncomplete => 'Network request incomplete';

  @override
  String get serviceNetworkIncompleteReason =>
      'The connection was interrupted or timed out. The app may have retried or used cached data.';

  @override
  String get serviceCoordinationError => 'Refresh coordination error';

  @override
  String get serviceCoordinationReason =>
      'A legacy skipped-refresh result was detected. Requests should wait for or share the existing refresh.';

  @override
  String get serviceLiveAfterBoth =>
      'Latest data retrieved after signing in again and retrying.';

  @override
  String get serviceLiveAfterLogin =>
      'Latest data retrieved after signing in again.';

  @override
  String get serviceLiveAfterRetry => 'Latest data retrieved after retrying.';

  @override
  String get serviceLiveData => 'Latest data retrieved from the server.';

  @override
  String get serviceExisting => 'existing';

  @override
  String serviceCachedSession(String status, String time) {
    return 'The session may have expired or the server rejected the request (status $status). Cached data from $time was preserved.';
  }

  @override
  String serviceCachedParsing(String time) {
    return 'An empty field could not be processed. Cached data from $time was preserved.';
  }

  @override
  String serviceCachedFailure(String time) {
    return 'The live request failed. Cached data from $time was preserved.';
  }

  @override
  String get serviceFailedNoCache =>
      'The session may have expired or the server rejected the request. No cached data is available.';

  @override
  String get serviceParseError => 'The app could not process an empty field.';

  @override
  String get serviceNoData =>
      'No live or cached data is available for this module.';

  @override
  String get serviceRefreshSuccess => 'Refresh complete';

  @override
  String get serviceDegraded => 'Some cached data used';

  @override
  String get serviceRefreshFailed => 'Refresh failed';

  @override
  String get serviceIncomplete => 'Incomplete log';

  @override
  String get serviceCoordinated => 'Coordination complete';

  @override
  String get serviceSharedDegraded => 'Shared refresh used cached data';

  @override
  String get serviceSharedIncomplete => 'Shared refresh log is incomplete';

  @override
  String get serviceSharedExisting => 'Existing refresh reused';

  @override
  String get serviceBackgroundYielded => 'Background task yielded';

  @override
  String get serviceSharedDescription =>
      'This operation waited for the existing refresh without repeating server requests.';

  @override
  String serviceRelatedTaskLabel(String id) {
    return 'Related task: $id';
  }

  @override
  String get serviceYieldDescription =>
      'The app is in use. This background task yielded without making module requests.';

  @override
  String get serviceFailed => 'Failed';

  @override
  String get serviceNotExecuted => 'Not run';

  @override
  String get serviceBackground => 'Background refresh';

  @override
  String get serviceForeground => 'Foreground refresh';

  @override
  String get serviceServerNetwork => 'Server or network issue';

  @override
  String get serviceSessionExpired => 'Session expired';

  @override
  String get serviceParsing => 'App parsing error';

  @override
  String get serviceCoordination => 'Refresh coordination issue';

  @override
  String get serviceExpectedFallback => 'Expected fallback';

  @override
  String get serviceIncompleteLog => 'Incomplete log';

  @override
  String serviceSeconds(String value) {
    return '$value s';
  }

  @override
  String get serviceUnknownDuration => 'Duration unknown';

  @override
  String serviceDuration(String value) {
    return 'Time: $value';
  }

  @override
  String serviceApproximate(String value) {
    return 'about $value';
  }

  @override
  String serviceTeacher(String name) {
    return 'Instructor: $name';
  }

  @override
  String serviceExamSeat(String seat) {
    return 'Seat: $seat';
  }

  @override
  String serviceQuerying(String source) {
    return 'Loading $source';
  }

  @override
  String serviceQueryError(String source, String error) {
    return '$source: $error';
  }

  @override
  String serviceSourceFailure(String source, String error) {
    return '$source failed: $error';
  }

  @override
  String serviceSourceMessage(String source, String message) {
    return '$source: $message';
  }

  @override
  String serviceFailure(String error) {
    return 'Failed: $error';
  }

  @override
  String serviceLoginFailure(String service) {
    return 'Unable to sign in to $service';
  }

  @override
  String get serviceSso => 'Single Sign-On';

  @override
  String get servicePortal => 'Academic Portal';

  @override
  String get serviceCoursesSite => 'Learning at ZJU';

  @override
  String get serviceGrsSite => 'Graduate School Portal';

  @override
  String get serviceActivitySite => 'Co-curricular Activities Portal';

  @override
  String serviceInvalidYear(String id) {
    return 'Unable to determine the enrollment year from student ID: $id';
  }

  @override
  String get serviceGradExams => 'Graduate exams';

  @override
  String get serviceGradGrades => 'Graduate grades';

  @override
  String get serviceUgExams => 'Undergraduate exams';

  @override
  String get serviceUgGrades => 'Undergraduate grades';

  @override
  String get serviceLiveSuccess => 'Live data';

  @override
  String get serviceCached => 'Cached data';

  @override
  String get serviceCalendar => 'Academic calendar';

  @override
  String get serviceTimetable => 'Timetable';

  @override
  String get serviceExam => 'Exams';

  @override
  String get serviceGrade => 'Grades';

  @override
  String get serviceHomework => 'Assignments';

  @override
  String get serviceUnknown => 'Unknown';

  @override
  String get serviceModuleNotRun => 'No separate module requests.';

  @override
  String get serviceRequestTimeout => 'Request timed out';

  @override
  String get serviceNetworkFailed => 'Network connection failed';

  @override
  String get serviceRequestStateError => 'Invalid request state';

  @override
  String get serviceInvalidResponse => 'Invalid response format';

  @override
  String get serviceRequestFailed => 'Request failed';

  @override
  String get serviceDefaultConfiguration => 'Using default configuration';

  @override
  String get serviceUnavailable => 'Unavailable';

  @override
  String get serviceCourseSite => 'Courses at ZJU';

  @override
  String get serviceEcard => 'Campus card';

  @override
  String get serviceGrs => 'Graduate school';

  @override
  String get sharedLanguage => 'Language';

  @override
  String get sharedConfirm => 'OK';

  @override
  String get sharedCancel => 'Cancel';

  @override
  String get sharedSpring => 'Spring';

  @override
  String get sharedSummer => 'Summer';

  @override
  String get sharedAutumn => 'Autumn';

  @override
  String get sharedWinter => 'Winter';

  @override
  String get sharedSpringSummer => 'Spring/Summer';

  @override
  String get sharedAutumnWinter => 'Autumn/Winter';

  @override
  String get sharedUnknownCourse => 'Unknown course';

  @override
  String get sharedUnknownTeacher => 'Unknown instructor';

  @override
  String get sharedUnknownLocation => 'No location';

  @override
  String get sharedUnknown => 'Unknown';

  @override
  String get sharedGradeExcellent => 'Excellent';

  @override
  String get sharedGradeGood => 'Good';

  @override
  String get sharedGradeAverage => 'Average';

  @override
  String get sharedGradePass => 'Pass';

  @override
  String get sharedGradeFail => 'Fail';

  @override
  String get sharedQualified => 'Pass';

  @override
  String get sharedUnqualified => 'Fail';

  @override
  String get sharedWithdrawn => 'Withdrawn';

  @override
  String get sharedAbsent => 'Absent';

  @override
  String get sharedDeferred => 'Deferred';

  @override
  String get sharedPendingGrade => 'Pending';

  @override
  String get sharedInvalid => 'Invalid';

  @override
  String get sharedTaskDeadline => 'Deadline';

  @override
  String get sharedTaskEvent => 'Event';

  @override
  String get sharedPastEvent => 'Past event';

  @override
  String get sharedRunning => 'In progress';

  @override
  String get sharedPaused => 'Paused';

  @override
  String get sharedComplete => 'Completed';

  @override
  String get sharedExpired => 'Expired';

  @override
  String get sharedDeleted => 'Deleted';

  @override
  String get sharedNoRepeat => 'Never';

  @override
  String get sharedRepeatDays => 'Every few days';

  @override
  String get sharedRepeatMonth => 'Monthly';

  @override
  String get sharedRepeatYear => 'Yearly';

  @override
  String get sharedTomorrow => 'Tomorrow ';

  @override
  String get sharedYesterday => 'Yesterday ';

  @override
  String get sharedDayAfterTomorrow => 'In 2 days ';

  @override
  String get sharedDayBeforeYesterday => '2 days ago ';

  @override
  String get sharedNextDay => 'Next day ';

  @override
  String get sharedLive => 'Up to date';

  @override
  String get sharedCache => 'Using cached data';

  @override
  String get sharedFallback => 'Using defaults';

  @override
  String get sharedUnavailable => 'Unavailable';

  @override
  String get sharedApproved => 'Approved';

  @override
  String get sharedPendingReview => 'Pending review';

  @override
  String get sharedNotApproved => 'Not approved';

  @override
  String get sharedMidterm => 'Midterm exam';

  @override
  String get sharedFinalExam => 'Final exam';

  @override
  String get sharedAll => 'All';

  @override
  String get sharedNetworkFailed => 'Unable to connect';

  @override
  String get sharedRequestTimeout => 'Request timed out';

  @override
  String get sharedRequestFailed => 'Request failed';

  @override
  String get sharedStateError => 'Unexpected request state';

  @override
  String get sharedFormatError => 'Unexpected response format';

  @override
  String get sharedUnknownError => 'Unknown error';

  @override
  String get sharedCalendarUnavailable =>
      'The academic calendar for this term has not been published yet';

  @override
  String get sharedGrades => 'Grades';

  @override
  String get sharedAssignments => 'Assignments';

  @override
  String get sharedSchedule => 'Class schedule';

  @override
  String get sharedExams => 'Exams';

  @override
  String get sharedRefresh => 'Refresh';

  @override
  String get sharedLogin => 'Sign in';

  @override
  String get sharedCalendar => 'Academic calendar';

  @override
  String get sharedPractice => 'Co-curricular activities';

  @override
  String get sharedGraduate => 'Graduate';

  @override
  String get sharedUndergraduate => 'Undergraduate';

  @override
  String sharedExamDay(int day) {
    return 'Exam week, day $day';
  }

  @override
  String sharedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago ',
      one: '1 day ago ',
    );
    return '$_temp0';
  }

  @override
  String sharedDaysLater(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return 'In $_temp0 ';
  }

  @override
  String sharedHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
    );
    return '$_temp0';
  }

  @override
  String sharedMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
    );
    return '$_temp0';
  }

  @override
  String sharedSessionTime(String week, String day, String periods) {
    return '$week$day, periods $periods';
  }

  @override
  String get sharedOddWeek => 'Odd weeks · ';

  @override
  String get sharedEvenWeek => 'Even weeks · ';

  @override
  String get sharedUnknownLocation2 => 'Unknown location';

  @override
  String get sharedMidtermShort => 'Midterm';

  @override
  String get sharedFinalShort => 'Final';

  @override
  String get sharedMon => 'Mon';

  @override
  String get sharedTue => 'Tue';

  @override
  String get sharedWed => 'Wed';

  @override
  String get sharedThu => 'Thu';

  @override
  String get sharedFri => 'Fri';

  @override
  String get sharedSat => 'Sat';

  @override
  String get sharedSun => 'Sun';
}
