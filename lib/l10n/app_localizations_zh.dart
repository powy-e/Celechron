// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get academicAcademics => '学业';

  @override
  String get academicActivityEnd => '活动结束时间';

  @override
  String get academicActivityStart => '活动开始时间';

  @override
  String academicArtPassed(String status) {
    return '美育：$status';
  }

  @override
  String get academicArts => '美育';

  @override
  String get academicAssignment => '作业';

  @override
  String get academicBack => '返回';

  @override
  String get academicBasicInfo => '基本信息';

  @override
  String get academicBySemester => '按学期';

  @override
  String get academicCachedDetails => '项目明细为缓存或上一次结果。';

  @override
  String get academicCachedPoints => '当前记点使用缓存或项目合计，请在网络恢复后刷新。';

  @override
  String get academicCheckPortal => '请务必前往教务网核对';

  @override
  String get academicChooseCourse => '要查看哪一个？';

  @override
  String get academicClassSessions => '课时';

  @override
  String get academicClassroomCategory => '课堂类别';

  @override
  String get academicClassroomPointsLong => '四课记点';

  @override
  String get academicClassroomPointsMid => '三课记点';

  @override
  String get academicClassroomPointsShort => '二课记点';

  @override
  String get academicConflictCourse => '冲突课程';

  @override
  String get academicCountedTowardTotal => '已计入总分';

  @override
  String academicCourseCode(String code) {
    return '课号：$code';
  }

  @override
  String get academicCourseCredit => '课程';

  @override
  String academicCourseCreditValue(String credits) {
    return '$credits 学分';
  }

  @override
  String get academicCourseDetails => '课程详情';

  @override
  String academicCourseIdValue(String code) {
    return '课号：$code';
  }

  @override
  String get academicCourses => '课程';

  @override
  String get academicCredits => '学分';

  @override
  String get academicDegraded => '降级';

  @override
  String get academicDescription => '情况说明';

  @override
  String academicDetailsSource(String source) {
    return '项目明细来源：$source';
  }

  @override
  String get academicDueThisWeek => '本周截止';

  @override
  String get academicDueToday => '一天内';

  @override
  String get academicEarnedCredits => '获得学分';

  @override
  String academicExamTime(String time) {
    return '时间：$time';
  }

  @override
  String get academicExams => '考试';

  @override
  String get academicFailure => '失败';

  @override
  String get academicFetchProblem =>
      '获取数据时遇到问题。请检查网络连接情况，并尝试重新获取数据。\n注意：你需要完成所有的教学评价才能获取成绩信息。';

  @override
  String get academicFetchProblemShort => '获取数据时遇到问题';

  @override
  String get academicFivePoint => '五分制';

  @override
  String get academicFourPoint => '四分制';

  @override
  String get academicFourthClassroom => '第四课堂';

  @override
  String get academicFriday => '五';

  @override
  String academicGrade(String grade, String scale) {
    return '成绩：$grade / $scale';
  }

  @override
  String academicGradeCredit(String id, String credits) {
    return '$id / $credits 学分';
  }

  @override
  String academicGradeValue(String grade, String scale) {
    return '成绩：$grade / $scale';
  }

  @override
  String get academicGrades => '成绩';

  @override
  String get academicHideCourseInfo => '隐藏课程信息';

  @override
  String academicIncludedExcludedCounts(int includedCount, int excludedCount) {
    return '已计入 $includedCount 项 · 未计入 $excludedCount 项';
  }

  @override
  String get academicLabor => '劳育';

  @override
  String academicLaborPassed(String status) {
    return '劳育：$status';
  }

  @override
  String get academicLastUpdated => '最近更新时间';

  @override
  String get academicLegacyPracticeOnly => '当前仅获取到旧实践汇总，暂无 getSqjl 项目明细。';

  @override
  String academicLocation(String location) {
    return '地点：$location';
  }

  @override
  String academicLocationLabel(String location) {
    return '地点：$location';
  }

  @override
  String get academicLongPressClear => '长按清空';

  @override
  String get academicMajorCredits => '学年主修学分';

  @override
  String get academicMajorCreditsShort => '主修学分';

  @override
  String get academicMajorFourPoint => '学年主修四分制';

  @override
  String get academicMajorGpa => '主修均绩';

  @override
  String get academicMidterm => '（期中）';

  @override
  String get academicMonday => '一';

  @override
  String get academicNoCountedProjects => '暂无已计入总分的项目';

  @override
  String get academicNoEndTime => '无';

  @override
  String get academicNoPendingProjects => '暂无审核中或未计入的项目';

  @override
  String get academicNotCounted => '未计入总分';

  @override
  String get academicNotCountedNotice => '该项目当前未计入总分。';

  @override
  String get academicNotFilled => '未填写';

  @override
  String get academicNotLoggedIn => '未登录';

  @override
  String get academicNotPassed => '未通过';

  @override
  String get academicOK => '确定';

  @override
  String get academicOfficialPointsTotal => '正式汇总记点';

  @override
  String get academicOfflineCacheNote => '离线数据将在同步失败时自动使用';

  @override
  String get academicOnlineCourse => '线上课程';

  @override
  String get academicPassed => '已通过';

  @override
  String get academicPendingOrExcluded => '审核中或未计入';

  @override
  String get academicPendingUpdate => '待更新';

  @override
  String get academicPercentage => '百分制';

  @override
  String get academicPointsEarned => '获得记点';

  @override
  String get academicPointsMayDiffer => '正式汇总与项目记录可能不完全一致，项目明细仍按 getSqjl 原样展示。';

  @override
  String academicPointsSource(String source) {
    return '记点来源：$source';
  }

  @override
  String get academicPractice => '实践';

  @override
  String get academicPracticeClassroom => '实践课堂';

  @override
  String get academicPracticeDetails => '实践项目详情';

  @override
  String get academicPracticeDetailsUnavailable => '当前 getSqjl 项目明细不可用，请稍后刷新。';

  @override
  String get academicPracticeFetchProblem => '获取实践记点时遇到问题';

  @override
  String academicPracticeProjects(String category) {
    return '$category项目';
  }

  @override
  String get academicProjectCategory => '项目类别';

  @override
  String get academicProjectName => '项目名称';

  @override
  String get academicPullToRefresh => '下拉刷新以获取数据';

  @override
  String get academicQualityCategory => '素质类别';

  @override
  String get academicRefreshDetails => '刷新详情';

  @override
  String academicRefreshProblem(int degradedCount, int failureCount) {
    return '刷新遇到问题：$degradedCount 项降级，$failureCount 项失败';
  }

  @override
  String get academicReset => '重置';

  @override
  String get academicRetry => '重新获取数据';

  @override
  String get academicReviewStatus => '审核状态';

  @override
  String get academicRoleOrReason => '参与身份或得分原因';

  @override
  String get academicSaturday => '六';

  @override
  String get academicSchedule => '课表';

  @override
  String get academicSchoolYearCredits => '学年学分';

  @override
  String get academicSchoolYearFourPoint => '学年四分制';

  @override
  String get academicSchoolYearGpa => '学年均绩';

  @override
  String get academicSearchCoursesTasks => '搜索课程、事项...';

  @override
  String get academicSearchShort => '搜索';

  @override
  String academicSeat(String seat) {
    return '座位：$seat';
  }

  @override
  String academicSeatLabel(String seat) {
    return '座位：$seat';
  }

  @override
  String get academicSecondClassroom => '第二课堂';

  @override
  String academicSectionCount(String title, int count) {
    return '$title（$count）';
  }

  @override
  String get academicSelectAll => '全选';

  @override
  String get academicSelectedCredits => '已选学分';

  @override
  String get academicSelectedFivePoint => '已选五分制';

  @override
  String get academicSelectedFourPoint => '已选四分制';

  @override
  String get academicSelectedPercentage => '已选百分制';

  @override
  String academicSemesterHours(String semester) {
    return '$semester学期课时';
  }

  @override
  String academicSemesterSuffix(String semester) {
    return '$semester学期课时';
  }

  @override
  String academicSessionCount(int count) {
    return '$count节/两周';
  }

  @override
  String academicSessionsPerTwoWeeks(double count) {
    return '$count节/两周';
  }

  @override
  String get academicSunday => '日';

  @override
  String academicTeacher(String teacher) {
    return '教师：$teacher';
  }

  @override
  String academicTeacherValue(String teacher) {
    return '教师：$teacher';
  }

  @override
  String get academicThirdClassroom => '第三课堂';

  @override
  String get academicThursday => '四';

  @override
  String academicTimeLabel(String time) {
    return '时间：$time';
  }

  @override
  String get academicTotal => '总计';

  @override
  String get academicTuesday => '二';

  @override
  String get academicUnknown => '未知';

  @override
  String get academicUnselectedFivePoint => '未选五分制';

  @override
  String get academicUnselectedFourPoint => '未选四分制';

  @override
  String academicUpdatedAt(String time) {
    return '更新时间：$time';
  }

  @override
  String academicUpdatedAtShort(String time) {
    return '更新于 $time';
  }

  @override
  String academicUpdatedMinutesAgo(int minutes) {
    return '更新于 $minutes 分钟前';
  }

  @override
  String get academicViewDetails => '查看详情';

  @override
  String get academicWednesday => '三';

  @override
  String get academicWeight => '加权比例';

  @override
  String get academicWeightedCredits => '加权学分';

  @override
  String get academicWeightedFivePoint => '加权五分制';

  @override
  String get academicWeightedGrades => '加权成绩';

  @override
  String get academicRefreshingCalendar => '正在同步校历...';

  @override
  String get academicFetchingSchedule => '正在获取课表...';

  @override
  String get academicParsingExams => '正在解析考试安排...';

  @override
  String get academicWaitingGrades => '正在等待成绩数据...';

  @override
  String get academicCheckingMajorGrades => '正在核对主修成绩...';

  @override
  String get academicSyncingAssignments => '正在同步作业列表...';

  @override
  String get academicCountingPracticeCredits => '正在统计实践学分...';

  @override
  String get academicParsingUndergraduateExams => '正在解析本科生考试...';

  @override
  String get academicWaitingUndergraduateGrades => '正在等待本科生成绩...';

  @override
  String get academicParsingGraduateExams => '正在解析研究生考试...';

  @override
  String get academicWaitingGraduateGrades => '正在等待研究生成绩...';

  @override
  String get academicCalendarUpdated => '校历已更新';

  @override
  String get academicScheduleFetched => '成功获取课表';

  @override
  String get academicExamsFetched => '成功获取考试安排';

  @override
  String get academicGradesFetched => '成功获取考试成绩';

  @override
  String get academicMajorGradesUpdated => '主修成绩已更新';

  @override
  String get academicAssignmentsFetched => '成功获取作业列表';

  @override
  String get academicActivityCreditsUpdated => '实践学分已更新';

  @override
  String get academicConfigUpdated => '校历已更新';

  @override
  String get academicUndergraduateExamsFetched => '成功获取本科生考试';

  @override
  String get academicUndergraduateGradesFetched => '成功获取本科生成绩';

  @override
  String get academicGraduateExamsFetched => '成功获取研究生考试';

  @override
  String get academicGraduateGradesFetched => '成功获取研究生成绩';

  @override
  String get academicCalendarFetchFailed => '校历获取失败';

  @override
  String get academicScheduleFetchFailed => '课表获取失败';

  @override
  String get academicExamsFetchFailed => '考试安排获取失败';

  @override
  String get academicGradesFetchFailed => '成绩获取失败';

  @override
  String get academicMajorGradesFetchFailed => '主修成绩获取失败';

  @override
  String get academicAssignmentsFetchFailed => '作业获取失败';

  @override
  String get academicActivityCreditsFetchFailed => '实践学分获取失败';

  @override
  String get academicConfigFetchFailed => '校历配置获取失败';

  @override
  String get academicUndergraduateExamsFetchFailed => '本科生考试获取失败';

  @override
  String get academicUndergraduateGradesFetchFailed => '本科生成绩获取失败';

  @override
  String get academicGraduateExamsFetchFailed => '研究生考试获取失败';

  @override
  String get academicGraduateGradesFetchFailed => '研究生成绩获取失败';

  @override
  String get academicSyncingData => '正在同步教务数据...';

  @override
  String get academicWaitingServer => '正在等待服务器响应...';

  @override
  String get academicStillFetching => '仍在努力获取中...';

  @override
  String get academicFinishingRefresh => '正在完成刷新...';

  @override
  String get coreUpNext => '接下来';

  @override
  String get coreCalendar => '日程';

  @override
  String get coreTasks => '任务';

  @override
  String get coreAcademics => '学业';

  @override
  String get coreSettings => '设置';

  @override
  String get coreUpdateAvailable => '更新可用';

  @override
  String get coreIgnore => '忽略';

  @override
  String get coreVisitWebsite => '访问网站';

  @override
  String get coreTimeUntilEnd => '离结束还有';

  @override
  String get coreTimeUntilStart => '开始还有';

  @override
  String get coreStartPlanning => '开始规划';

  @override
  String get coreTapToChangeStartTime => '点击修改开始时间';

  @override
  String get coreBack => '返回';

  @override
  String get coreConfirm => '确定';

  @override
  String get coreBreakTimeShortened => '休息时间已压缩';

  @override
  String get coreStartTimeMustBeFuture => '开始时间必须晚于现在';

  @override
  String get coreAdjustStartTime => '请调整开始时间。';

  @override
  String get coreCreate => '创建';

  @override
  String get corePlanExpired => '规划方案已过期';

  @override
  String get coreReplan => '重新规划';

  @override
  String get coreNothingToDoToday => '今日无事可做';

  @override
  String get coreInProgress => '正在进行';

  @override
  String get coreStartingSoon => '即将开始';

  @override
  String get coreLaterPlans => '之后的安排';

  @override
  String get coreExamWeekOrBreak => '考试周/假期';

  @override
  String get coreNoSemesterInfo => '无学期信息';

  @override
  String get coreOutsideSemester => '当前不在学期内';

  @override
  String get coreToday => '今天';

  @override
  String get coreSwitchView => '切换视图';

  @override
  String get coreShowFullMonth => '显示整月';

  @override
  String get coreShowWeek => '显示一周';

  @override
  String get coreRepeatedEventUpcoming => '重复日程，接下来的时段：';

  @override
  String get coreEdit => '编辑';

  @override
  String get coreDelete => '删除';

  @override
  String get coreTimePlanning => '时间规划';

  @override
  String get coreExpectedDuration => '预期用时';

  @override
  String get coreHours => '小时';

  @override
  String get coreMinutes => '分钟';

  @override
  String get coreTimeSpent => '已经用时';

  @override
  String get coreAllowBreaks => '允许插入休息时间';

  @override
  String get coreEventSettings => '日程设置';

  @override
  String get coreRepeat => '重复';

  @override
  String get coreRepeatInterval => '重复周期';

  @override
  String get coreRepeatUntil => '重复截止日期';

  @override
  String get coreExcludeFromPlanning => '不在这个日程中安排任务';

  @override
  String get coreAdditionalInfo => '附加信息';

  @override
  String get coreLocation => '地点';

  @override
  String get coreDescription => '说明';

  @override
  String get coreDeleteTask => '删除任务';

  @override
  String get coreNotStarted => '未开始';

  @override
  String get coreEnded => '已结束';

  @override
  String get coreOngoing => '进行中';

  @override
  String get coreDeleteCompletedTasks => '删除已完成任务';

  @override
  String get coreDeleteExpiredTasks => '删除已过期任务';

  @override
  String get corePauseAllTasks => '暂停所有任务';

  @override
  String get coreResumeAllTasks => '继续所有任务';

  @override
  String get coreCancel => '取消';

  @override
  String get coreNoTasks => '没有任务';

  @override
  String get coreToDo => '待办';

  @override
  String get coreCompleted => '已完成';

  @override
  String get coreEventList => '日程列表';

  @override
  String get coreSearchPlaceholder => '搜索课程、事项...';

  @override
  String get coreSecurityVerification => '安全验证';

  @override
  String get coreTapImageToRefresh => '点击图片刷新';

  @override
  String get coreEnterCaptcha => '请输入验证码';

  @override
  String get coreCampusLogin => '统一身份认证登录';

  @override
  String get coreStudentId => '学号';

  @override
  String get corePassword => '密码';

  @override
  String get coreLoginFailed => '登录失败';

  @override
  String get coreLogin => '登录';

  @override
  String get corePaymentCode => '付款码';

  @override
  String get coreLoading => '加载中...';

  @override
  String get coreRefreshQrCode => '刷新二维码';

  @override
  String get coreOriginalCourseCode => '原课号';

  @override
  String get coreNewCourseCode => '新课号';

  @override
  String get coreDisplayName => '备注名';

  @override
  String get coreError => '错误';

  @override
  String get coreFillAllFields => '请填写所有字段';

  @override
  String get coreSave => '保存';

  @override
  String get coreCustomCourseCodeMapping => '自定义课程代码映射';

  @override
  String get coreAddMapping => '添加新的映射关系';

  @override
  String get coreAcademicPortal => '教务';

  @override
  String get coreBackgroundRefreshExplanation =>
      'Celechron 将不定期自动运行以刷新数据。请开启通知权限，且不要将 Celechron 从后台中移除。';

  @override
  String get coreLogOut => '退出';

  @override
  String get coreLogOutTitle => '退出登录';

  @override
  String get coreConfirmLogOut => '确定要退出当前账号吗？';

  @override
  String get coreRetakeGpaCalculation => '重修绩点计算';

  @override
  String get coreUseFirstAttempt => '取首次';

  @override
  String get coreUseHighestAttempt => '取最高';

  @override
  String get coreHideGpa => '隐藏绩点';

  @override
  String get coreAsyncRefresh => '异步刷新';

  @override
  String get coreGradeChangeNotifications => '推送成绩变动';

  @override
  String get coreDeadlineNotifications => '推送作业截止提醒';

  @override
  String get coreTapToLogIn => '点击登录';

  @override
  String get coreWorkDuration => '工作段时间长度';

  @override
  String get coreBreakDuration => '休息段时间长度';

  @override
  String get coreAvailableWorkPeriods => '可用的工作时段';

  @override
  String get coreSyncSystemCalendar => '同步到系统日历';

  @override
  String get coreScheduleSyncOptions => '课表同步选项';

  @override
  String get coreSelectSemester => '选择学期';

  @override
  String get coreExportIcal => '导出为iCal文件';

  @override
  String get coreTools => '工具';

  @override
  String get coreDarkMode => '暗色模式';

  @override
  String get coreFollowSystem => '跟随系统设置';

  @override
  String get coreLightMode => '亮色模式';

  @override
  String get coreAbout => '关于';

  @override
  String get coreDiagnostics => '诊断与测试';

  @override
  String get coreTestLogs => '测试日志';

  @override
  String get coreDiagnosticLogsDescription => '查看、复制或导出脱敏 TXT';

  @override
  String get coreAboutCelechron => '关于 Celechron';

  @override
  String get coreTermsOfService => '服务条款';

  @override
  String get coreProjectWebsite => '前往项目网站';

  @override
  String get coreNewVersionAvailable => '有新版本可用';

  @override
  String get coreEditTask => '编辑任务';

  @override
  String get coreTaskName => '任务名';

  @override
  String get coreStartTime => '开始时间';

  @override
  String get coreEndTime => '结束时间';

  @override
  String get coreDueAt => '截止于';

  @override
  String coreEndsAt(String time) {
    return '结束于 $time';
  }

  @override
  String coreStartsAt(String time) {
    return '开始于 $time';
  }

  @override
  String get coreStartAfterEnd => '开始时间必须晚于结束时间';

  @override
  String get coreStartBeforeRepeatEnd => '开始时间不能晚于重复截止日期';

  @override
  String get coreRepeatedEventTooLong => '这个重复日程的持续时间太长';

  @override
  String get coreChangePeriod => '更改时段';

  @override
  String get coreChange => '更改';

  @override
  String get corePeriodsCannotOverlap => '时间段之间不能有重合或直接相邻';

  @override
  String get coreEditAvailablePeriods => '编辑可用工作时段';

  @override
  String get coreAvailablePeriodsList => '可用工作时段列表';

  @override
  String get coreAddPeriod => '添加一个时段';

  @override
  String get coreCredits => '制作人员';

  @override
  String get coreDesign => '🎨设计';

  @override
  String get coreDevelopment => '🧑‍💻开发';

  @override
  String get coreGplNotice => '本程序采用 GPLv3 协议开源';

  @override
  String get coreDisclaimer => '免责声明';

  @override
  String get coreWarrantyDisclaimer =>
      '在适用的法律范围内，该程序不提供任何质量保证。除非另有书面说明，版权持有者和程序提供者应按照原样提供程序，并且不提供任何明示或者暗示的保证，包括但不限于适销性和特定用途适用性的暗示保证。使用该程序所产生的全部风险，比如程序的质量和性能问题，全部由你承担。如果程序出现缺陷，你将承担所有必要的修复和更正服务带来的损失。';

  @override
  String get coreLiabilityLimitation => '责任限制';

  @override
  String get coreLiabilityText =>
      '除非有适用法律或书面协议要求，任何版权持有者，或该程序按照本协议可能存在的第三方修改和再发布者，都不对你的损失负有责任，包括由于使用或者不能使用该程序造成的任何一般的、特殊的、偶发的或重大的损失（包括但不限于数据丢失、数据失真、你或第三方的后续损失、该程序无法和其他程序协同工作等），即使他们声称会对此负责。';

  @override
  String get coreViewFullGpl => '查看 GPLv3 协议全文';

  @override
  String get coreDiagnosticDisplayMode => '诊断日志显示模式';

  @override
  String get coreReadableReport => '易读报告';

  @override
  String get coreRawLogs => '原始日志';

  @override
  String get coreNoReadableRefreshRecords => '暂无可读的刷新记录';

  @override
  String get coreRefreshRecordsHint => '执行一次刷新后，这里会显示刷新结果、模块状态和关键时间线。';

  @override
  String get coreTotalDuration => '总耗时';

  @override
  String get coreSuccess => '成功';

  @override
  String get coreDegraded => '降级';

  @override
  String get coreFailed => '失败';

  @override
  String get coreRelogged => '重新登录';

  @override
  String get coreRetried => '已重试';

  @override
  String get coreCacheFallback => '缓存回退';

  @override
  String get coreHideDetails => '收起详情';

  @override
  String get coreViewDetails => '查看详情';

  @override
  String get coreModuleStatus => '模块状态';

  @override
  String get coreKeyTimeline => '关键时间线';

  @override
  String get coreNoKeyEvents => '没有可展示的关键事件。';

  @override
  String get coreIssuesFound => '发现的问题';

  @override
  String get coreNoIssues => '未发现需要说明的问题。';

  @override
  String get coreReauthenticated => '已重新登录';

  @override
  String get coreCacheUpdatedAt => '缓存更新于 ';

  @override
  String get coreHideTechnicalDetails => '收起技术详情';

  @override
  String get coreViewTechnicalDetails => '查看技术详情';

  @override
  String get coreUtcTime => 'UTC 时间';

  @override
  String get coreHttpStatus => 'HTTP 状态码';

  @override
  String get coreRequestInterface => '请求接口';

  @override
  String get coreRedactedUrl => '已脱敏 URL';

  @override
  String get coreExceptionType => '异常类型';

  @override
  String get coreExceptionSummary => '异常摘要';

  @override
  String get coreHideStack => '隐藏堆栈';

  @override
  String get coreShowStack => '显示堆栈';

  @override
  String get coreAppBackgroundCoordination => 'App 与后台协调';

  @override
  String get coreReadingLogs => '正在读取日志…';

  @override
  String get coreNoDiagnosticLogs => '暂无诊断日志。执行一次刷新后再试。';

  @override
  String get coreFullRawLogs => '完整原始日志';

  @override
  String get coreCopyRawLogs => '复制完整原始日志';

  @override
  String get coreExportShareTxt => '导出并分享 TXT';

  @override
  String get coreExportContents => '包含易读报告和完整原始日志';

  @override
  String get coreClearTestLogs => '清空测试日志';

  @override
  String get coreYes => '是';

  @override
  String get coreNo => '否';

  @override
  String get coreCopied => '已复制';

  @override
  String get coreRawLogsCopied => '完整原始日志已复制到剪贴板。';

  @override
  String get coreExportSucceeded => '导出成功';

  @override
  String get coreExportFailed => '导出失败';

  @override
  String get coreUnableExportLogs => '无法导出日志：';

  @override
  String get coreCleared => '已清空';

  @override
  String get coreLogsCleared => '测试日志已清空。';

  @override
  String get coreConfirmClearLogs => '确定清空测试日志？';

  @override
  String get coreClearLogsWarning => '清空后，当前保存的诊断记录将无法在 App 内恢复。';

  @override
  String coreYearMonth(int year, int month) {
    return '$year 年 $month 月';
  }

  @override
  String get coreWeekdayMon => '一';

  @override
  String get coreWeekdayTue => '二';

  @override
  String get coreWeekdayWed => '三';

  @override
  String get coreWeekdayThu => '四';

  @override
  String get coreWeekdayFri => '五';

  @override
  String get coreWeekdaySat => '六';

  @override
  String get coreWeekdaySun => '日';

  @override
  String coreEndsIn(String duration) {
    return '结束还有$duration';
  }

  @override
  String coreStartsIn(String duration) {
    return '开始还有$duration';
  }

  @override
  String coreWorkBreakSummary(String work, String breakDuration) {
    return '工作 $work - 休息 $breakDuration';
  }

  @override
  String get coreNotEnoughTime => '时间不够了！';

  @override
  String get coreTasksDoNotFit =>
      '即使是完全不休息也有任务无法完成。请压缩任务的预期时间，或者检查是否有任务在规划开始时间之前就结束。';

  @override
  String coreBreaksMustShrink(String duration) {
    return '因为任务过多，你需要把休息时间压缩到 $duration才能完成任务。';
  }

  @override
  String coreLocationValue(String value) {
    return '地点：$value';
  }

  @override
  String coreDescriptionValue(String value) {
    return '说明：$value';
  }

  @override
  String coreTimeValue(String value) {
    return '时间：$value';
  }

  @override
  String get coreLanguage => '语言';

  @override
  String coreDueWithExpired(String time, String expired) {
    String _temp0 = intl.Intl.selectLogic(
      expired,
      {
        'true': ' - 已过期',
        'other': '',
      },
    );
    return '截止于 $time$_temp0';
  }

  @override
  String coreDays(int count) {
    return '$count 天';
  }

  @override
  String coreTaskProgress(int percent, String expected, String remaining) {
    return '$percent% 已完成：预期 $expected，还要 $remaining';
  }

  @override
  String get coreMarkIncomplete => '标记为未完成';

  @override
  String get coreMarkComplete => '标记为完成';

  @override
  String get corePause => '暂停';

  @override
  String get coreResume => '继续';

  @override
  String coreLoggedIn(String username) {
    return '已登录: $username';
  }

  @override
  String corePeriodCount(int count) {
    return '$count 个时段';
  }

  @override
  String coreFileCreated(String fileName) {
    return '已生成 $fileName';
  }

  @override
  String coreDamagedLogLines(int count) {
    return '有 $count 行日志无法解析，已安全跳过。';
  }

  @override
  String get coreExporting => '正在导出…';

  @override
  String get coreRawLogRetention =>
      '原始日志继续使用 UTC 时间并保留完整脱敏技术字段；最多保留 2000 行和最近 10 个导出文件。';

  @override
  String corePaymentCodeStatus(String status) {
    return '付款码：$status';
  }

  @override
  String get coreLoadFailed => '加载失败';

  @override
  String coreVersion(String version) {
    return '$version 版本';
  }

  @override
  String get coreContributorKate => '空之探险队的 Kate';

  @override
  String coreStartValue(String time) {
    return '开始：$time';
  }

  @override
  String coreEndValue(String time) {
    return '结束：$time';
  }

  @override
  String get coreStartMustBeBeforeEnd => '开始时间必须早于结束时间';

  @override
  String get coreClear => '清空';

  @override
  String coreSeasonWeek(String season, int week) {
    return '$season$week周';
  }

  @override
  String coreSemesterDisplay(String year, String season) {
    return '$year $season学期';
  }

  @override
  String get diagnosticExportTitle => 'Celechron 诊断日志';

  @override
  String diagnosticExportLocalTime(String time) {
    return '本地导出时间：$time';
  }

  @override
  String diagnosticExportUtcTime(String time) {
    return 'UTC 导出时间：$time';
  }

  @override
  String diagnosticExportVersion(String version) {
    return 'App 版本：$version';
  }

  @override
  String diagnosticExportPlatform(String platform) {
    return '平台：$platform';
  }

  @override
  String diagnosticExportRefreshId(String id) {
    return 'refreshId：$id';
  }

  @override
  String diagnosticExportOrigin(String origin) {
    return '来源：$origin';
  }

  @override
  String get diagnosticExportReadable => '=== 1. 易读诊断报告 ===';

  @override
  String get diagnosticExportNoReports => '暂无可解析的刷新记录。';

  @override
  String diagnosticExportTotalTime(String duration) {
    return '总耗时：$duration';
  }

  @override
  String diagnosticExportModuleCounts(
      String success, String degraded, String failed) {
    return '模块：成功 $success / 降级 $degraded / 失败 $failed';
  }

  @override
  String diagnosticExportFlags(String relogged, String retried, String cached) {
    return '重新登录：$relogged；重试：$retried；缓存回退：$cached';
  }

  @override
  String get diagnosticExportYes => '是';

  @override
  String get diagnosticExportNo => '否';

  @override
  String get diagnosticExportModules => '=== 2. 模块结果 ===';

  @override
  String diagnosticExportNoModuleRequests(String title) {
    return '$title：未发起独立模块请求。';
  }

  @override
  String diagnosticExportModuleRow(
      String name, String state, String duration, String reason) {
    return '$name：$state；$duration；$reason';
  }

  @override
  String get diagnosticExportTimeline => '=== 3. 关键时间线 ===';

  @override
  String get diagnosticExportNoTimeline => '无关键时间线事件。';

  @override
  String get diagnosticExportIssues => '=== 4. 发现的问题 ===';

  @override
  String get diagnosticExportNoIssues => '未发现需要说明的问题。';

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
    return '  refreshId=$id；UTC=$utc；HTTP=$http；接口=$interfaceName；URL=$url；异常=$exceptionType；摘要=$summary；堆栈=$stack';
  }

  @override
  String get diagnosticExportRaw => '=== 5. 完整原始日志（UTC） ===';

  @override
  String get diagnosticExportRawNote =>
      '以下时间保持 ISO 8601 UTC；与上方本地时间存在时区偏移是正常的。';

  @override
  String diagnosticExportShare(String fileName) {
    return 'Celechron 测试日志：$fileName';
  }

  @override
  String get exportReminder => '提醒';

  @override
  String get exportConfirm => '确定';

  @override
  String get exportSchedule => '导出课程表';

  @override
  String get exportChooseMethod => '选择导出方式';

  @override
  String get exportCurrentSemester => '导出当前学期';

  @override
  String get exportChooseSemester => '选择学期';

  @override
  String get exportCancel => '取消';

  @override
  String get exportNotice => '提示';

  @override
  String get exportNoData => '没有可导出的课程表数据';

  @override
  String get exportChooseSemesterMessage => '选择要导出的学期';

  @override
  String get exportAllSemesters => '导出所有学期';

  @override
  String get exportSuccess => '成功';

  @override
  String get exportError => '错误';

  @override
  String get exportNotSignedIn => '请先登录后再导出课程表';

  @override
  String get exportShared => '课程表已导出，请选择保存位置或分享';

  @override
  String get exportShareDescription => '从 Celechron 导出的课程表文件，可导入到其他日历应用中使用。';

  @override
  String get exportAllShareDescription => '从 Celechron 导出的完整课程表文件，包含所有学期。';

  @override
  String exportSemesterShareDescription(String semester) {
    return '从 Celechron 导出的 $semester 课程表文件。';
  }

  @override
  String get exportCalendarName => '浙大课程表';

  @override
  String exportCalendarSemesterName(String semester) {
    return '浙大课程表-$semester';
  }

  @override
  String get exportCalendarFullName => '浙大课程表-完整版';

  @override
  String get exportCalendarAllName => '课程表-完整版';

  @override
  String exportSemesterSchedule(String semester) {
    return '$semester 课程表';
  }

  @override
  String exportExportedSemester(String semester) {
    return '$semester 课程表已导出';
  }

  @override
  String get exportFullExported => '完整课程表已导出';

  @override
  String exportFailed(String error) {
    return '导出失败: $error';
  }

  @override
  String get exportSyncOptions => '同步日历选项';

  @override
  String get exportChooseSyncAction => '选择日历同步操作';

  @override
  String get exportUpdateCurrent => '更新当前课表';

  @override
  String get exportChooseSemesterSync => '选择学期同步';

  @override
  String get exportChooseSemesterToSync => '选择要同步的学期';

  @override
  String get exportSyncAllSemesters => '同步所有学期';

  @override
  String get exportPermissionFailed => '权限获取失败';

  @override
  String get exportPermissionInstruction => '请在系统设置中手动开启日历权限';

  @override
  String get exportResyncSuccess => '重新同步成功';

  @override
  String get exportResyncFailed => '重新同步失败';

  @override
  String get exportSyncSuccess => '同步成功';

  @override
  String get exportSyncFailed => '同步失败';

  @override
  String exportResyncedCount(String courses, String events) {
    return '已重新同步 $courses 门课程，共计 $events 个日程';
  }

  @override
  String exportSyncedCount(String courses, String events) {
    return '已同步 $courses 门课程，共计 $events 个日程';
  }

  @override
  String exportSyncedSemesterCount(
      String semester, String courses, String events) {
    return '已同步 $semester 的 $courses 门课程，共计 $events 个日程';
  }

  @override
  String exportSyncedAllCount(String courses, String events) {
    return '已同步所有学期的 $courses 门课程，共计 $events 个日程';
  }

  @override
  String get exportNoResync => '无法重新同步课程到系统日历';

  @override
  String exportResyncError(String error) {
    return '重新同步时出错: $error';
  }

  @override
  String get exportSemesterMissing => '未找到指定的学期';

  @override
  String get exportNoSyncSemester => '没有可同步的学期数据，请先登录';

  @override
  String exportNoSyncSemesterCourses(String semester) {
    return '无法同步 $semester 的课程';
  }

  @override
  String get exportNoSyncAll => '无法同步所有学期的课程';

  @override
  String exportSyncError(String error) {
    return '同步时出错: $error';
  }

  @override
  String get exportUnsupported => '暂不支持';

  @override
  String get exportMacUnsupported => 'macOS 系统暂不支持日历同步功能';

  @override
  String get exportSignInToSync => '请先登录后再开启日历同步功能';

  @override
  String get exportIosSyncFailure => '无法同步课程到系统日历，从日历中移除Google账户后重试';

  @override
  String get exportSyncFailure => '无法同步课程到系统日历，请检查权限和网络连接';

  @override
  String get exportDisabled => '日历同步功能已关闭，已删除课表数据和Celechron日历';

  @override
  String get exportDisabledDeleteIssue => '日历同步功能已关闭，但删除日历时遇到问题';

  @override
  String exportDisabledDeleteError(String error) {
    return '日历同步功能已关闭，但删除日历时出错: $error';
  }

  @override
  String exportInstructor(String name) {
    return '教师: $name';
  }

  @override
  String get exportFinalExam => '期末考试';

  @override
  String get exportMidtermExam => '期中考试';

  @override
  String exportExamDescription(String name, String type, String seat) {
    return '$name - $type\n座位号：$seat';
  }

  @override
  String get notificationGradeChannel => '成绩变动提醒';

  @override
  String get notificationDeadlineChannel => '作业截止提醒';

  @override
  String get notificationFirstGradeTitle => '首次成绩推送';

  @override
  String get notificationFirstGradeBody =>
      '若有新出分的课程，Celechron 将会通知您。若不需要此功能，可在 Celechron 的设置页面中关闭。';

  @override
  String get notificationGradeTitle => '成绩变动提醒';

  @override
  String get notificationGradeBody => '有新出分的课程，可在 Celechron 的学业页面中刷新查看。';

  @override
  String notificationHoursUntil(int hours) {
    return '$hours 小时后';
  }

  @override
  String get notificationSoon => '即将';

  @override
  String get notificationDeadlineTitle => '作业截止提醒';

  @override
  String notificationDeadlineBody(String course, String name, String when) {
    return '「$course」的作业「$name」将于$when截止';
  }

  @override
  String get serviceNotRefreshed => '未刷新';

  @override
  String get serviceNotSignedIn => '未登录';

  @override
  String get serviceCancelled => '已取消';

  @override
  String get serviceNewVersion => '有新版本可用';

  @override
  String get serviceUnknownModule => '未知模块';

  @override
  String get serviceMajor => '主修';

  @override
  String get servicePractice => '实践/素质拓展';

  @override
  String get servicePracticeShort => '实践';

  @override
  String get serviceSecondClass => '第二课堂';

  @override
  String get serviceThirdClass => '第三课堂';

  @override
  String get serviceFourthClass => '第四课堂';

  @override
  String get serviceSharedFailure => '共享任务失败';

  @override
  String get serviceSharedFailureReason =>
      '关联的刷新任务执行失败，本次调用没有重复请求服务器，并收到了相同失败结果。';

  @override
  String get serviceNotRunReason => '本次日志中没有该模块的执行记录。';

  @override
  String get serviceMissingEnd => '没有记录到刷新结束事件';

  @override
  String get serviceBackgroundMissingEnd =>
      '该后台任务没有记录到结束事件，可能被系统终止，或日志尚未在 isolate 退出前写入完成。';

  @override
  String get serviceForegroundMissingEnd => '该刷新没有记录到结束事件，可能尚未完成、被终止，或日志写入不完整。';

  @override
  String get serviceBackgroundStart => '后台任务开始';

  @override
  String get serviceForegroundStart => '前台刷新开始';

  @override
  String get serviceRefreshErrorEnd => '刷新异常结束';

  @override
  String get serviceRefreshEnd => '刷新结束';

  @override
  String serviceTotalDuration(String duration) {
    return '总耗时 $duration';
  }

  @override
  String get serviceForegroundActive => 'App 进入前台';

  @override
  String get serviceLockWait => '跨 isolate 等待账号文件锁';

  @override
  String get serviceShareFuture => '共享同账号同操作的刷新 Future';

  @override
  String serviceRelatedTask(String id) {
    return '关联任务 $id';
  }

  @override
  String get serviceQueueOperation => '同账号不同操作正在排队';

  @override
  String get serviceYieldAfterLogin => '后台登录后检测到前台并让行';

  @override
  String get serviceBackgroundYield => '后台因前台使用主动让行';

  @override
  String get serviceStaleLock => '发现并清理遗留刷新锁';

  @override
  String get serviceLockAcquired => '已获取同账号刷新锁';

  @override
  String get serviceLockReleased => '已释放同账号刷新锁';

  @override
  String serviceModuleCached(String module) {
    return '$module使用缓存';
  }

  @override
  String get serviceRelogin => '重新登录后继续请求';

  @override
  String get serviceRetried => '失败请求已重试';

  @override
  String get serviceExecutionError => '刷新执行异常';

  @override
  String get serviceSharedErrorReason => '正在共享的刷新任务异常结束，本次调用也收到了相同异常。';

  @override
  String get serviceExecutionErrorReason => '刷新在完成全部模块前异常结束，请查看技术详情。';

  @override
  String get serviceFutureFallback => '未来学年校历使用预期回退';

  @override
  String get serviceFutureFallbackReason =>
      '未来学年配置尚未发布，App 已使用默认配置；这不会被视为严重故障。';

  @override
  String get serviceSessionIssue => '教务网会话可能失效';

  @override
  String serviceSessionIssueStatus(String status) {
    return '教务网会话可能失效或请求被服务端拒绝，本次请求返回 $status。';
  }

  @override
  String get serviceServerFailed => '服务端请求未成功';

  @override
  String serviceHttpFailed(String status) {
    return '服务端返回 HTTP $status，请稍后重试或查看技术详情。';
  }

  @override
  String get serviceNullField => 'App 未正确处理空字段';

  @override
  String get serviceNullFieldReason => 'App 未正确处理接口中的空字段；如果有缓存，旧数据仍会保留。';

  @override
  String get serviceNetworkIncomplete => '网络请求未完成';

  @override
  String get serviceNetworkIncompleteReason => '网络连接中断或请求超时，App 可能已重试或使用缓存。';

  @override
  String get serviceCoordinationError => '刷新协调异常';

  @override
  String get serviceCoordinationReason =>
      '检测到旧版“已有刷新任务并跳过”结果；正常情况下调用者应共享或等待现有任务。';

  @override
  String get serviceLiveAfterBoth => '重新登录并重试后，已实时获取成功。';

  @override
  String get serviceLiveAfterLogin => '重新登录后，已实时获取成功。';

  @override
  String get serviceLiveAfterRetry => '重试后，已实时获取成功。';

  @override
  String get serviceLiveData => '已从服务端实时获取最新数据。';

  @override
  String get serviceExisting => '已有';

  @override
  String serviceCachedSession(String status, String time) {
    return '教务网会话可能已失效或请求被服务端拒绝，实时请求返回 $status，本次保留了 $time 的缓存数据。';
  }

  @override
  String serviceCachedParsing(String time) {
    return 'App 未正确处理接口中的空字段，本次保留了 $time 的缓存数据。';
  }

  @override
  String serviceCachedFailure(String time) {
    return '实时请求未成功，本次保留了 $time 的缓存数据。';
  }

  @override
  String get serviceFailedNoCache => '教务网会话可能已失效或请求被服务端拒绝，且没有可用缓存。';

  @override
  String get serviceParseError => 'App 未正确处理接口中的空字段。';

  @override
  String get serviceNoData => '该模块没有取得可用的实时数据或缓存。';

  @override
  String get serviceRefreshSuccess => '刷新成功';

  @override
  String get serviceDegraded => '部分降级';

  @override
  String get serviceRefreshFailed => '刷新失败';

  @override
  String get serviceIncomplete => '记录不完整';

  @override
  String get serviceCoordinated => '正常协调完成';

  @override
  String get serviceSharedDegraded => '共享任务部分降级';

  @override
  String get serviceSharedIncomplete => '共享任务记录不完整';

  @override
  String get serviceSharedExisting => '已共享现有刷新';

  @override
  String get serviceBackgroundYielded => '后台已主动让行';

  @override
  String get serviceSharedDescription => '本次操作没有重复请求服务器，已等待正在执行的刷新任务。';

  @override
  String serviceRelatedTaskLabel(String id) {
    return '关联任务：$id';
  }

  @override
  String get serviceYieldDescription => '检测到 App 正在前台使用，本次后台任务没有发起模块请求。';

  @override
  String get serviceFailed => '失败';

  @override
  String get serviceNotExecuted => '未执行';

  @override
  String get serviceBackground => '后台刷新';

  @override
  String get serviceForeground => '前台刷新';

  @override
  String get serviceServerNetwork => '服务端或网络问题';

  @override
  String get serviceSessionExpired => '会话失效';

  @override
  String get serviceParsing => 'App 解析异常';

  @override
  String get serviceCoordination => '刷新协调问题';

  @override
  String get serviceExpectedFallback => '预期回退';

  @override
  String get serviceIncompleteLog => '日志不完整';

  @override
  String serviceSeconds(String value) {
    return '$value 秒';
  }

  @override
  String get serviceUnknownDuration => '耗时未知';

  @override
  String serviceDuration(String value) {
    return '耗时$value';
  }

  @override
  String serviceApproximate(String value) {
    return '约 $value';
  }

  @override
  String serviceTeacher(String name) {
    return '教师: $name';
  }

  @override
  String serviceExamSeat(String seat) {
    return '座位号: $seat';
  }

  @override
  String serviceQuerying(String source) {
    return '$source查询进行中';
  }

  @override
  String serviceQueryError(String source, String error) {
    return '$source查询出错：$error';
  }

  @override
  String serviceSourceFailure(String source, String error) {
    return '$source失败：$error';
  }

  @override
  String serviceSourceMessage(String source, String message) {
    return '$source：$message';
  }

  @override
  String serviceFailure(String error) {
    return '失败：$error';
  }

  @override
  String serviceLoginFailure(String service) {
    return '无法登录$service';
  }

  @override
  String get serviceSso => '统一身份认证';

  @override
  String get servicePortal => '教务网';

  @override
  String get serviceCoursesSite => '学在浙大';

  @override
  String get serviceGrsSite => '研究生院网';

  @override
  String get serviceActivitySite => '素质拓展平台';

  @override
  String serviceInvalidYear(String id) {
    return '无法解析学号中的入学年份：$id';
  }

  @override
  String get serviceGradExams => '研究生课考试';

  @override
  String get serviceGradGrades => '研究生课成绩';

  @override
  String get serviceUgExams => '本科生课考试';

  @override
  String get serviceUgGrades => '本科生课成绩';

  @override
  String get serviceLiveSuccess => '实时成功';

  @override
  String get serviceCached => '使用缓存';

  @override
  String get serviceCalendar => '校历';

  @override
  String get serviceTimetable => '课表';

  @override
  String get serviceExam => '考试';

  @override
  String get serviceGrade => '成绩';

  @override
  String get serviceHomework => '作业';

  @override
  String get serviceUnknown => '未知';

  @override
  String get serviceModuleNotRun => '未发起独立模块请求。';

  @override
  String get serviceRequestTimeout => '请求超时';

  @override
  String get serviceNetworkFailed => '网络连接失败';

  @override
  String get serviceRequestStateError => '请求状态异常';

  @override
  String get serviceInvalidResponse => '返回数据格式异常';

  @override
  String get serviceRequestFailed => '请求失败';

  @override
  String get serviceDefaultConfiguration => '使用默认配置';

  @override
  String get serviceUnavailable => '不可用';

  @override
  String get serviceCourseSite => '学在浙大';

  @override
  String get serviceEcard => '校园卡';

  @override
  String get serviceGrs => '研究生院';

  @override
  String get sharedLanguage => '语言';

  @override
  String get sharedConfirm => '确定';

  @override
  String get sharedCancel => '取消';

  @override
  String get sharedSpring => '春';

  @override
  String get sharedSummer => '夏';

  @override
  String get sharedAutumn => '秋';

  @override
  String get sharedWinter => '冬';

  @override
  String get sharedSpringSummer => '春夏';

  @override
  String get sharedAutumnWinter => '秋冬';

  @override
  String get sharedUnknownCourse => '未知课程';

  @override
  String get sharedUnknownTeacher => '未知教师';

  @override
  String get sharedUnknownLocation => '无地点';

  @override
  String get sharedUnknown => '未知';

  @override
  String get sharedGradeExcellent => '优秀';

  @override
  String get sharedGradeGood => '良好';

  @override
  String get sharedGradeAverage => '中等';

  @override
  String get sharedGradePass => '及格';

  @override
  String get sharedGradeFail => '不及格';

  @override
  String get sharedQualified => '合格';

  @override
  String get sharedUnqualified => '不合格';

  @override
  String get sharedWithdrawn => '弃修';

  @override
  String get sharedAbsent => '缺考';

  @override
  String get sharedDeferred => '缓考';

  @override
  String get sharedPendingGrade => '待录';

  @override
  String get sharedInvalid => '无效';

  @override
  String get sharedTaskDeadline => 'DDL';

  @override
  String get sharedTaskEvent => '日程';

  @override
  String get sharedPastEvent => '过去日程';

  @override
  String get sharedRunning => '进行中';

  @override
  String get sharedPaused => '已暂停';

  @override
  String get sharedComplete => '完成';

  @override
  String get sharedExpired => '已过期';

  @override
  String get sharedDeleted => '已删除';

  @override
  String get sharedNoRepeat => '不重复';

  @override
  String get sharedRepeatDays => '每隔几天';

  @override
  String get sharedRepeatMonth => '每月的这一天';

  @override
  String get sharedRepeatYear => '每年的这一天';

  @override
  String get sharedTomorrow => '明天 ';

  @override
  String get sharedYesterday => '昨天 ';

  @override
  String get sharedDayAfterTomorrow => '后天 ';

  @override
  String get sharedDayBeforeYesterday => '前天 ';

  @override
  String get sharedNextDay => '次日 ';

  @override
  String get sharedLive => '实时成功';

  @override
  String get sharedCache => '使用缓存';

  @override
  String get sharedFallback => '使用默认配置';

  @override
  String get sharedUnavailable => '不可用';

  @override
  String get sharedApproved => '审核通过';

  @override
  String get sharedPendingReview => '待审核';

  @override
  String get sharedNotApproved => '审核未通过';

  @override
  String get sharedMidterm => '期中考试';

  @override
  String get sharedFinalExam => '期末考试';

  @override
  String get sharedAll => '全部';

  @override
  String get sharedNetworkFailed => '网络连接失败';

  @override
  String get sharedRequestTimeout => '请求超时';

  @override
  String get sharedRequestFailed => '请求失败';

  @override
  String get sharedStateError => '请求状态异常';

  @override
  String get sharedFormatError => '返回数据格式异常';

  @override
  String get sharedUnknownError => '未知错误';

  @override
  String get sharedCalendarUnavailable => '当前学期校历配置暂未发布';

  @override
  String get sharedGrades => '成绩';

  @override
  String get sharedAssignments => '作业';

  @override
  String get sharedSchedule => '课表';

  @override
  String get sharedExams => '考试';

  @override
  String get sharedRefresh => '刷新';

  @override
  String get sharedLogin => '登录';

  @override
  String get sharedCalendar => '校历';

  @override
  String get sharedPractice => '素质拓展';

  @override
  String get sharedGraduate => '研究生';

  @override
  String get sharedUndergraduate => '本科生';

  @override
  String sharedExamDay(int day) {
    return '考试周第 $day 天';
  }

  @override
  String sharedDaysAgo(int count) {
    return '$count 天前 ';
  }

  @override
  String sharedDaysLater(int count) {
    return '$count 天后 ';
  }

  @override
  String sharedHours(int count) {
    return '$count 小时';
  }

  @override
  String sharedMinutes(int count) {
    return '$count 分钟';
  }

  @override
  String sharedSessionTime(String week, String day, String periods) {
    return '$week周$day第$periods节';
  }

  @override
  String get sharedOddWeek => '单 - ';

  @override
  String get sharedEvenWeek => '双 - ';

  @override
  String get sharedUnknownLocation2 => '未知地点';

  @override
  String get sharedMidtermShort => '期中';

  @override
  String get sharedFinalShort => '期末';

  @override
  String get sharedMon => '一';

  @override
  String get sharedTue => '二';

  @override
  String get sharedWed => '三';

  @override
  String get sharedThu => '四';

  @override
  String get sharedFri => '五';

  @override
  String get sharedSat => '六';

  @override
  String get sharedSun => '日';
}
