import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/utils/platform_features.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'package:celechron/utils/utils.dart';
import 'package:celechron/model/option.dart';
import 'package:celechron/design/cupertino_async_switch.dart';

import 'allow_time_edit_page.dart';
import 'course_id_mapping_edit_page.dart';
import 'credits_page.dart';
import 'diagnostic_log_page.dart';
import 'package:get/get.dart';
import 'custom_license_page.dart';
import 'login_page.dart';
import 'option_controller.dart';

const Color _kHeaderFooterColor = CupertinoDynamicColor(
  color: Color.fromRGBO(108, 108, 108, 1.0),
  darkColor: Color.fromRGBO(142, 142, 146, 1.0),
  highContrastColor: Color.fromRGBO(74, 74, 77, 1.0),
  darkHighContrastColor: Color.fromRGBO(176, 176, 183, 1.0),
  elevatedColor: Color.fromRGBO(108, 108, 108, 1.0),
  darkElevatedColor: Color.fromRGBO(142, 142, 146, 1.0),
  highContrastElevatedColor: Color.fromRGBO(108, 108, 108, 1.0),
  darkHighContrastElevatedColor: Color.fromRGBO(142, 142, 146, 1.0),
);

class OptionPage extends StatelessWidget {
  final _optionController =
      Get.put(OptionController(), tag: 'optionController');

  OptionPage({super.key});

  Widget _settingTitle(String label) =>
      Text(label, maxLines: 2, overflow: TextOverflow.ellipsis);

  @override
  Widget build(BuildContext context) {
    var trailingTextStyle = TextStyle(
        color: CupertinoDynamicColor.resolve(
            CupertinoColors.secondaryLabel, context),
        fontSize: 16);

    var headerFooterTextStyle = CupertinoTheme.of(context)
        .textTheme
        .textStyle
        .merge(TextStyle(
            fontSize: 13.0,
            color:
                CupertinoDynamicColor.resolve(_kHeaderFooterColor, context)));

    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        child: SafeArea(
            child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text(context.l10n.coreSettings),
              backgroundColor: CupertinoColors.systemGroupedBackground,
              border: null,
            ),
            // 教务
            Obx(() => SliverToBoxAdapter(
                  child: CupertinoListSection.insetGrouped(
                    margin: _defaultMargin,
                    additionalDividerMargin: 2,
                    header: Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(context.l10n.coreAcademicPortal,
                            style: headerFooterTextStyle)),
                    footer: (_optionController.pushOnGradeChange ||
                                _optionController.pushOnDdlReminder) &&
                            _optionController.scholar.value.isLogan
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                                context.l10n.coreBackgroundRefreshExplanation,
                                style: headerFooterTextStyle))
                        : null,
                    children: <CupertinoListTile>[
                      if (_optionController.scholar.value.isLogan) ...{
                        CupertinoListTile(
                            title: _settingTitle(context.l10n.coreLoggedIn('')),
                            subtitle: Text(
                                _optionController.scholar.value.username ?? ''),
                            trailing: BackChervonRow(
                                child: Text(context.l10n.coreLogOut,
                                    style: TextStyle(
                                        color: CupertinoDynamicColor.resolve(
                                            CupertinoColors.secondaryLabel,
                                            context),
                                        fontSize: 16))),
                            onTap: () async {
                              await showCupertinoDialog(
                                  context: context,
                                  builder: (BuildContext dialogContext) {
                                    return CupertinoAlertDialog(
                                      title: Text(context.l10n.coreLogOutTitle),
                                      content:
                                          Text(context.l10n.coreConfirmLogOut),
                                      actions: [
                                        CupertinoDialogAction(
                                          child: Text(context.l10n.coreCancel),
                                          onPressed: () {
                                            Navigator.of(dialogContext).pop();
                                          },
                                        ),
                                        CupertinoDialogAction(
                                          isDestructiveAction: true,
                                          child: Text(context.l10n.coreLogOut),
                                          onPressed: () async {
                                            Navigator.of(dialogContext).pop();
                                            await _optionController.logout();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            }),
                        CupertinoListTile(
                          title: _settingTitle(
                              context.l10n.coreRetakeGpaCalculation),
                          subtitle: Text(
                            _optionController.gpaStrategy == GpaStrategy.first
                                ? context.l10n.coreUseFirstAttempt
                                : context.l10n.coreUseHighestAttempt,
                          ),
                          trailing: const BackChervonRow(),
                          onTap: () => _showGpaStrategyPicker(context),
                        ),
                        CupertinoListTile(
                            title: Text(context.l10n.coreHideGpa),
                            trailing: Obx(() => CupertinoSwitch(
                                  value: _optionController.hideHomeGpa,
                                  onChanged: (value) async {
                                    _optionController.hideHomeGpa = value;
                                  },
                                ))),
                        CupertinoListTile(
                          title: _settingTitle(
                              context.l10n.coreCustomCourseCodeMapping),
                          trailing: const BackChervonRow(),
                          onTap: () async {
                            Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        CourseIdMappingEditPage()));
                          },
                        ),
                        CupertinoListTile(
                            title: _settingTitle(context.l10n.coreAsyncRefresh),
                            trailing: Obx(() => CupertinoSwitch(
                                  value: _optionController.asyncRefresh,
                                  onChanged: (value) async {
                                    _optionController.asyncRefresh = value;
                                  },
                                ))),
                        CupertinoListTile(
                            title: _settingTitle(
                                context.l10n.coreGradeChangeNotifications),
                            trailing: CupertinoSwitch(
                              value: _optionController.pushOnGradeChange,
                              onChanged: PlatformFeatures.hasBackgroundRefresh
                                  ? (value) async {
                                      _optionController.pushOnGradeChange =
                                          value;
                                    }
                                  : null,
                            )),
                        CupertinoListTile(
                            title: _settingTitle(
                                context.l10n.coreDeadlineNotifications),
                            trailing: CupertinoSwitch(
                              value: _optionController.pushOnDdlReminder,
                              onChanged: PlatformFeatures.hasBackgroundRefresh
                                  ? (value) async {
                                      _optionController.pushOnDdlReminder =
                                          value;
                                    }
                                  : null,
                            )),
                      } else ...{
                        CupertinoListTile(
                          title: Text(context.l10n.coreTapToLogIn,
                              style:
                                  TextStyle(color: CupertinoColors.activeBlue)),
                          trailing: const BackChervonRow(
                            child: Text(''),
                          ),
                          onTap: () async {
                            // Pop up a login widget from the bottom of the screen
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return LoginForm();
                                });
                          },
                        ),
                      },
                    ],
                  ),
                )),
            // 时间规划
            SliverToBoxAdapter(
                child: CupertinoListSection.insetGrouped(
                    additionalDividerMargin: 2,
                    margin: _defaultMargin,
                    header: Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(context.l10n.coreTimePlanning,
                            style: headerFooterTextStyle)),
                    children: <CupertinoListTile>[
                  CupertinoListTile(
                    title: _settingTitle(context.l10n.coreWorkDuration),
                    trailing: BackChervonRow(
                        child: Obx(() => Text(
                            durationToString(_optionController.workTime),
                            style: TextStyle(
                                color: CupertinoDynamicColor.resolve(
                                    CupertinoColors.secondaryLabel, context),
                                fontSize: 16)))),
                    onTap: () async {
                      Duration newWorkTime = _optionController.workTime;
                      await showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text(
                                context.l10n.coreWorkDuration,
                              ),
                              content: SizedBox(
                                width: double.maxFinite,
                                height: 200,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: CupertinoTimerPicker(
                                        mode: CupertinoTimerPickerMode.hm,
                                        minuteInterval: 5,
                                        initialTimerDuration: newWorkTime,
                                        onTimerDurationChanged: (value) {
                                          if (value >=
                                              const Duration(minutes: 5)) {
                                            newWorkTime = value;
                                          } else {
                                            newWorkTime =
                                                const Duration(minutes: 5);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text(context.l10n.coreConfirm),
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                      _optionController.workTime = newWorkTime;
                    },
                  ),
                  CupertinoListTile(
                    title: _settingTitle(context.l10n.coreBreakDuration),
                    trailing: BackChervonRow(
                        child: Obx(() => Text(
                            durationToString(_optionController.restTime),
                            style: trailingTextStyle))),
                    onTap: () async {
                      Duration newRestTime = _optionController.restTime;
                      await showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text(
                                context.l10n.coreBreakDuration,
                              ),
                              content: SizedBox(
                                width: double.maxFinite,
                                height: 200,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: CupertinoTimerPicker(
                                        mode: CupertinoTimerPickerMode.hm,
                                        initialTimerDuration: newRestTime,
                                        onTimerDurationChanged: (value) {
                                          newRestTime = value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text(context.l10n.coreConfirm),
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                      _optionController.restTime = newRestTime;
                    },
                  ),
                  CupertinoListTile(
                    title: _settingTitle(context.l10n.coreAvailableWorkPeriods),
                    trailing: BackChervonRow(
                        child: Obx(() => Text(
                            context.l10n.corePeriodCount(
                                _optionController.allowTimeLength.value),
                            style: trailingTextStyle))),
                    onTap: () async {
                      await Navigator.of(context, rootNavigator: true)
                          .push(CupertinoPageRoute(
                        builder: (context) => const AllowTimeEditPage(),
                      ));
                    },
                  ),
                ])),
            // 日程
            Obx(() => SliverToBoxAdapter(
                    child: CupertinoListSection.insetGrouped(
                        additionalDividerMargin: 2,
                        margin: _defaultMargin,
                        header: Container(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(context.l10n.coreCalendar,
                                style: headerFooterTextStyle)),
                        children: [
                      CupertinoListTile(
                        title:
                            _settingTitle(context.l10n.coreSyncSystemCalendar),
                        trailing: CupertinoAsyncSwitch(
                          value: _optionController.calendarSyncEnabled &&
                              _optionController.hasCalendarPermission,
                          onChanged: (value) async {
                            await _optionController.toggleCalendarSync(
                                context, value);
                          },
                        ),
                      ),
                      CupertinoListTile(
                        title: Text(
                          context.l10n.coreScheduleSyncOptions,
                          style: TextStyle(
                            color: _optionController.calendarSyncEnabled
                                ? null // 使用默认颜色
                                : CupertinoDynamicColor.resolve(
                                    CupertinoColors.quaternaryLabel, context),
                          ),
                        ),
                        subtitle: Text(context.l10n.coreSelectSemester),
                        trailing: const BackChervonRow(),
                        onTap: _optionController.calendarSyncEnabled
                            ? () {
                                _optionController
                                    .showCalendarSyncDialog(context);
                              }
                            : null, // 禁用点击
                      ),
                      CupertinoListTile(
                        title: Text(context.l10n.coreExportIcal),
                        trailing: const BackChervonRow(),
                        onTap: () =>
                            _optionController.showExportDialog(context),
                      ),
                    ]))),
            // 工具
            SliverToBoxAdapter(
                child: CupertinoListSection.insetGrouped(
                    additionalDividerMargin: 2,
                    margin: _defaultMargin,
                    header: Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(context.l10n.coreTools,
                            style: headerFooterTextStyle)),
                    children: <Widget>[
                  CupertinoListTile(
                    title: Text(context.l10n.coreDarkMode),
                    trailing: BackChervonRow(
                        child: Obx(() => Text(
                              _optionController.brightnessMode ==
                                      BrightnessMode.system
                                  ? context.l10n.coreFollowSystem
                                  : _optionController.brightnessMode ==
                                          BrightnessMode.light
                                      ? context.l10n.coreLightMode
                                      : context.l10n.coreDarkMode,
                              style: trailingTextStyle,
                            ))),
                    onTap: () => _showBrightnessPicker(context),
                  ),
                  CupertinoListTile(
                    title: Text(context.l10n.coreLanguage),
                    trailing: BackChervonRow(
                      child: Obx(() => Text(
                            _optionController.languageCode == 'en'
                                ? 'English'
                                : '简体中文',
                            style: trailingTextStyle,
                          )),
                    ),
                    onTap: () => _showLanguagePicker(context),
                  ),
                  CupertinoListTile(
                    title: Text(context.l10n.corePaymentCode),
                    trailing: const BackChervonRow(),
                    onTap: () async {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed('/ecardpaypage');
                    },
                  ),
                ])),
            // 关于
            SliverToBoxAdapter(
              child: CupertinoListSection.insetGrouped(
                additionalDividerMargin: 2,
                margin: _defaultMargin,
                header: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(context.l10n.coreDiagnostics,
                      style: headerFooterTextStyle),
                ),
                children: [
                  CupertinoListTile(
                    title: Text(context.l10n.coreTestLogs),
                    subtitle: Text(context.l10n.coreDiagnosticLogsDescription),
                    trailing: const BackChervonRow(),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        CupertinoPageRoute(
                          builder: (context) => DiagnosticLogPage(
                            version: _optionController.celechronVersion,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // 关于
            SliverToBoxAdapter(
              child: CupertinoListSection.insetGrouped(
                  additionalDividerMargin: 2,
                  margin: _defaultMargin,
                  header: Container(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(context.l10n.coreAbout,
                          style: headerFooterTextStyle)),
                  children: <CupertinoListTile>[
                    CupertinoListTile(
                      title: Text(context.l10n.coreAboutCelechron),
                      trailing: BackChervonRow(
                        child: Text(_optionController.celechronVersion,
                            style: trailingTextStyle),
                      ),
                      onTap: () async {
                        Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute(
                                builder: (context) => CreditsPage(
                                    version:
                                        _optionController.celechronVersion)));
                      },
                    ),
                    CupertinoListTile(
                      title: Text(context.l10n.coreTermsOfService),
                      trailing: const BackChervonRow(),
                      onTap: () async {
                        Navigator.of(context, rootNavigator: true).push(
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const CustomLicensePage()));
                      },
                    ),
                    CupertinoListTile(
                      title: Text(context.l10n.coreProjectWebsite),
                      trailing: BackChervonRow(
                        child: Obx(() {
                          if (_optionController.hasNewVersion) {
                            return Row(children: [
                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.systemRed,
                                    borderRadius: BorderRadius.circular(4)),
                              ),
                              Text(context.l10n.coreNewVersionAvailable,
                                  style: trailingTextStyle)
                            ]);
                          } else {
                            return const Text('');
                          }
                        }),
                      ),
                      onTap: () async {
                        await launchUrlString(
                          'https://celechron.top',
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ]),
            )
          ],
        )));
  }

  void _showBrightnessPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: () {
                _optionController.brightnessMode = BrightnessMode.system;
                Navigator.pop(context);
              },
              child: Text(context.l10n.coreFollowSystem),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _optionController.brightnessMode = BrightnessMode.light;
                Navigator.pop(context);
              },
              child: Text(context.l10n.coreLightMode),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _optionController.brightnessMode = BrightnessMode.dark;
                Navigator.pop(context);
              },
              child: Text(context.l10n.coreDarkMode),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.coreCancel),
          ),
        );
      },
    );
  }

  void _showLanguagePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(context.l10n.coreLanguage),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(sheetContext);
              await AppLanguage.select('zh');
            },
            child: const Text('简体中文'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(sheetContext);
              await AppLanguage.select('en');
            },
            child: const Text('English'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: Text(context.l10n.coreCancel),
        ),
      ),
    );
  }

  void _showGpaStrategyPicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(context.l10n.coreRetakeGpaCalculation),
        actions: [
          for (final strategy in GpaStrategy.values)
            CupertinoActionSheetAction(
              onPressed: () {
                _optionController.gpaStrategy = strategy;
                Navigator.pop(sheetContext);
              },
              child: Text(strategy == GpaStrategy.first
                  ? context.l10n.coreUseFirstAttempt
                  : context.l10n.coreUseHighestAttempt),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: Text(context.l10n.coreCancel),
        ),
      ),
    );
  }

  static const _defaultMargin =
      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 10.0);
}

class BackChervonRow extends StatelessWidget {
  final Widget? child;

  const BackChervonRow({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if (child != null) child!,
      const SizedBox(width: 4),
      Icon(Icons.arrow_forward_ios,
          color: CupertinoDynamicColor.resolve(
              CupertinoColors.tertiaryLabel, context),
          size: 16)
    ]);
  }
}
