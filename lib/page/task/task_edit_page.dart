import 'package:celechron/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:celechron/model/task.dart';
import 'package:celechron/utils/utils.dart';
import 'package:celechron/utils/time_helper.dart';

class TaskEditPage extends StatefulWidget {
  final Task deadline;
  const TaskEditPage(this.deadline, {super.key});

  @override
  State<TaskEditPage> createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  late Task now;
  int __got = 0;

  void saveAndExit() {
    if (now.type == TaskType.fixed && !now.startTime.isBefore(now.endTime)) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              context.l10n.coreStartAfterEnd,
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
        },
      );
      return;
    }

    if (now.type == TaskType.fixed &&
        now.repeatType != TaskRepeatType.norepeat &&
        dateOnly(now.startTime).isAfter(dateOnly(now.repeatEndsTime))) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(
              context.l10n.coreStartBeforeRepeatEnd,
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
        },
      );
      return;
    }

    if (now.type == TaskType.fixed &&
        now.repeatType != TaskRepeatType.norepeat) {
      int length = now.endTime.difference(now.startTime).inMinutes;
      if ((now.repeatType == TaskRepeatType.days &&
              length > now.repeatPeriod * 24 * 60) ||
          (now.repeatType == TaskRepeatType.month && length > 28 * 24 * 60) ||
          (now.repeatType == TaskRepeatType.year && length > 365 * 24 * 60)) {
        showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                context.l10n.coreRepeatedEventTooLong,
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
          },
        );
        return;
      }
    }

    FormState().save();
    now.forceRefreshStatus();
    Navigator.of(context).pop(now);
  }

  void removeAndExit() {
    FormState().save();
    now.forceRefreshStatus();
    now.status = TaskStatus.deleted;
    Navigator.of(context).pop(now);
  }

  void exitWithoutSave() {
    now = widget.deadline.copyWith();
    Navigator.of(context).pop(now);
  }

  @override
  Widget build(BuildContext context) {
    if (__got == 0) {
      now = widget.deadline.copyWith();
      if (now.startTime.isAfter(now.endTime)) {
        now.startTime = now.endTime.add(const Duration(minutes: -1));
      }
      if (now.repeatEndsTime.isAfter(DateTime(2099, 1, 1)) ||
          dateOnly(now.repeatEndsTime).isBefore(dateOnly(now.startTime))) {
        now.repeatEndsTime = dateOnly(now.startTime);
      }
      __got = 1;
    }

    List<String> deadlineRepeatTypeNameList = [];
    for (var i in TaskRepeatType.values) {
      deadlineRepeatTypeNameList.add(deadlineRepeatTypeName[i]!);
    }

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoDynamicColor.resolve(
            CupertinoColors.systemGroupedBackground, context),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: exitWithoutSave,
          child: const Icon(CupertinoIcons.xmark),
        ),
        middle: Text(context.l10n.coreEditTask),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: saveAndExit,
          child: const Icon(CupertinoIcons.check_mark),
        ),
        border: null,
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 20.0,
                    bottom: 8.0,
                  ),
                  child: CupertinoSlidingSegmentedControl<TaskType>(
                    groupValue: now.type,
                    children: <TaskType, Widget>{
                      TaskType.deadline: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(displayText(deadlineTypeName[TaskType.deadline] ?? '')),
                      ),
                      TaskType.fixed: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(displayText(deadlineTypeName[TaskType.fixed] ?? '')),
                      ),
                    },
                    onValueChanged: (TaskType? value) {
                      if (value != null) {
                        setState(() {
                          now.type = value;
                          if (now.type == TaskType.fixed) {
                            now.status = TaskStatus.running;
                          }
                        });
                      }
                    },
                  ),
                ),
                CupertinoListSection.insetGrouped(
                  children: [
                    CupertinoTextFormFieldRow(
                      placeholder: context.l10n.coreTaskName,
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: now.summary),
                      onChanged: (String value) {
                        now.summary = value;
                      },
                    ),
                    if (now.type == TaskType.fixed)
                      CupertinoTextFormFieldRow(
                        placeholder: context.l10n.coreStartTime,
                        textAlign: TextAlign.left,
                        controller: TextEditingController(
                            text: context.l10n.coreStartsAt(displayText(
                                TimeHelper.chineseDateTime(now.startTime)))),
                        readOnly: true,
                        onTap: () async {
                          await showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoPageScaffold(
                                  child: SizedBox(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        3,
                                    child: CupertinoDatePicker(
                                      initialDateTime: now.startTime,
                                      use24hFormat: true,
                                      minuteInterval: 1,
                                      mode: CupertinoDatePickerMode.dateAndTime,
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() {
                                          now.startTime = newTime;
                                        });
                                      },
                                    ),
                                  ),
                                );
                              });
                          if (now.endTime.isBefore(now.startTime)) {
                            setState(() {
                              now.endTime = now.startTime;
                            });
                          }
                        },
                      ),
                    CupertinoTextFormFieldRow(
                      placeholder: context.l10n.coreEndTime,
                      textAlign: TextAlign.left,
                      controller: TextEditingController(
                          text:
                              '${now.type == TaskType.deadline ? context.l10n.coreDueAt : context.l10n.coreEndsAt} ${displayText(TimeHelper.chineseDateTime(now.endTime))}'),
                      readOnly: true,
                      onTap: () async {
                        await showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoPageScaffold(
                                child: SizedBox(
                                  height: MediaQuery.of(context)
                                          .copyWith()
                                          .size
                                          .height /
                                      3,
                                  child: CupertinoDatePicker(
                                    initialDateTime: now.endTime,
                                    use24hFormat: true,
                                    minuteInterval: 1,
                                    mode: CupertinoDatePickerMode.dateAndTime,
                                    onDateTimeChanged: (DateTime newTime) {
                                      setState(() {
                                        now.endTime = newTime;
                                      });
                                    },
                                  ),
                                ),
                              );
                            });
                        if (now.type == TaskType.fixed &&
                            now.startTime.isAfter(now.endTime)) {
                          setState(() {
                            now.startTime = now.endTime;
                          });
                        }
                      },
                    ),
                  ],
                ),
                if (now.type == TaskType.deadline)
                  CupertinoListSection.insetGrouped(
                    header: Text(context.l10n.coreTimePlanning),
                    children: [
                      CupertinoListTile(
                        title: Text(context.l10n.coreExpectedDuration),
                        trailing: Text(durationToString(now.timeNeeded)),
                        onTap: () async {
                          await showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoPageScaffold(
                                  child: SizedBox(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: CupertinoPicker(
                                            itemExtent: 32,
                                            scrollController:
                                                FixedExtentScrollController(
                                              initialItem:
                                                  now.timeNeeded.inHours,
                                            ),
                                            onSelectedItemChanged: (value) {
                                              now.timeNeeded = Duration(
                                                  hours: value,
                                                  minutes:
                                                      now.timeNeeded.inMinutes %
                                                          60);
                                              if (now.timeNeeded <=
                                                  Duration.zero) {
                                                now.timeNeeded =
                                                    const Duration(minutes: 1);
                                              }

                                              setState(() {});
                                            },
                                            children: List.generate(
                                              1000,
                                              (index) =>
                                                  Center(child: Text("$index")),
                                            ),
                                          ),
                                        ),
                                        Text(context.l10n.coreHours),
                                        SizedBox(
                                          width: 150,
                                          child: CupertinoPicker(
                                            itemExtent: 32,
                                            looping: true,
                                            scrollController:
                                                FixedExtentScrollController(
                                              initialItem:
                                                  now.timeNeeded.inMinutes % 60,
                                            ),
                                            onSelectedItemChanged: (value) {
                                              now.timeNeeded = Duration(
                                                hours:
                                                    now.timeNeeded.inMinutes ~/
                                                        60,
                                                minutes: value,
                                              );
                                              if (now.timeNeeded <=
                                                  Duration.zero) {
                                                now.timeNeeded =
                                                    const Duration(minutes: 1);
                                              }

                                              setState(() {});
                                            },
                                            children: List.generate(
                                              60,
                                              (index) =>
                                                  Center(child: Text("$index")),
                                            ),
                                          ),
                                        ),
                                        Text(context.l10n.coreMinutes),
                                      ],
                                    ),
                                    // CupertinoTimerPicker(
                                    //   mode: CupertinoTimerPickerMode.hm,
                                    //   initialTimerDuration: now.timeNeeded,
                                    //   onTimerDurationChanged: (value) {
                                    //     if (value > Duration.zero) {
                                    //       setState(() {
                                    //         now.timeNeeded = value;
                                    //       });
                                    //     } else {
                                    //       setState(() {
                                    //         now.timeNeeded =
                                    //             const Duration(minutes: 1);
                                    //       });
                                    //     }
                                    //   },
                                    // ),
                                  ),
                                );
                              });
                        },
                      ),
                      CupertinoListTile(
                        title: Text(context.l10n.coreTimeSpent),
                        trailing: Text(durationToString(now.timeSpent)),
                        onTap: () async {
                          await showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoPageScaffold(
                                  child: SizedBox(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        3,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          child: CupertinoPicker(
                                            itemExtent: 32,
                                            scrollController:
                                                FixedExtentScrollController(
                                              initialItem:
                                                  now.timeSpent.inHours,
                                            ),
                                            onSelectedItemChanged: (value) {
                                              now.timeSpent = Duration(
                                                  hours: value,
                                                  minutes:
                                                      now.timeSpent.inMinutes %
                                                          60);

                                              setState(() {});
                                            },
                                            children: List.generate(
                                              1000,
                                              (index) =>
                                                  Center(child: Text("$index")),
                                            ),
                                          ),
                                        ),
                                        Text(context.l10n.coreHours),
                                        SizedBox(
                                          width: 150,
                                          child: CupertinoPicker(
                                            itemExtent: 32,
                                            looping: true,
                                            scrollController:
                                                FixedExtentScrollController(
                                              initialItem:
                                                  now.timeSpent.inMinutes % 60,
                                            ),
                                            onSelectedItemChanged: (value) {
                                              now.timeSpent = Duration(
                                                hours:
                                                    now.timeSpent.inMinutes ~/
                                                        60,
                                                minutes: value,
                                              );

                                              setState(() {});
                                            },
                                            children: List.generate(
                                              60,
                                              (index) =>
                                                  Center(child: Text("$index")),
                                            ),
                                          ),
                                        ),
                                        Text(context.l10n.coreMinutes),
                                      ],
                                    ),
                                    // child: CupertinoTimerPicker(
                                    //   mode: CupertinoTimerPickerMode.hm,
                                    //   initialTimerDuration: now.timeSpent,
                                    //   onTimerDurationChanged: (value) {
                                    //     setState(() {
                                    //       now.timeSpent = value;
                                    //     });
                                    //   },
                                    // ),
                                  ),
                                );
                              });
                        },
                      ),
                      CupertinoListTile(
                        title: Text(context.l10n.coreAllowBreaks),
                        trailing: CupertinoSwitch(
                          value: now.isBreakable,
                          onChanged: (value) {
                            setState(() {
                              now.isBreakable = !now.isBreakable;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                if (now.type == TaskType.fixed) ...[
                  CupertinoListSection.insetGrouped(
                    header: Text(context.l10n.coreEventSettings),
                    children: [
                      CupertinoListTile(
                        title: Text(context.l10n.coreRepeat),
                        trailing: Text(deadlineRepeatTypeName[now.repeatType]!),
                        onTap: () async {
                          await showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoPageScaffold(
                                  child: SizedBox(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height /
                                        3,
                                    child: CupertinoPicker(
                                      itemExtent: 32,
                                      scrollController:
                                          FixedExtentScrollController(
                                        initialItem: now.repeatType.index,
                                      ),
                                      onSelectedItemChanged: (int value) {
                                        setState(() {
                                          now.repeatType =
                                              TaskRepeatType.values[value];

                                          if (now.repeatType !=
                                                  TaskRepeatType.norepeat &&
                                              dateOnly(now.repeatEndsTime)
                                                  .isBefore(dateOnly(
                                                      now.startTime))) {
                                            now.repeatEndsTime =
                                                dateOnly(now.startTime);
                                          }
                                        });
                                      },
                                      children: List<Widget>.generate(
                                        deadlineRepeatTypeNameList.length,
                                        (int index) {
                                          return Center(
                                            child: Text(
                                              deadlineRepeatTypeNameList[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                      if (now.repeatType == TaskRepeatType.days)
                        CupertinoListTile(
                          title: Text(context.l10n.coreRepeatInterval),
                          trailing:
                              Text(context.l10n.coreDays(now.repeatPeriod)),
                          onTap: () async {
                            await showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoPageScaffold(
                                    child: SizedBox(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height /
                                          3,
                                      child: CupertinoPicker(
                                        itemExtent: 32,
                                        scrollController:
                                            FixedExtentScrollController(
                                          initialItem: now.repeatPeriod - 1,
                                        ),
                                        onSelectedItemChanged: (int value) {
                                          setState(() {
                                            now.repeatPeriod = value + 1;
                                          });
                                        },
                                        children: List<Widget>.generate(
                                          999,
                                          (int index) {
                                            return Center(
                                              child:
                                                  Text((index + 1).toString()),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      if (now.repeatType != TaskRepeatType.norepeat)
                        CupertinoListTile(
                          title: Text(context.l10n.coreRepeatUntil),
                          trailing:
                              Text(TimeHelper.chineseDate(now.repeatEndsTime)),
                          onTap: () async {
                            await showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoPageScaffold(
                                    child: SizedBox(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height /
                                          3,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: now.repeatEndsTime,
                                        onDateTimeChanged: (value) {
                                          setState(() {
                                            now.repeatEndsTime = value;
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      CupertinoListTile(
                        title: Text(context.l10n.coreExcludeFromPlanning),
                        trailing: CupertinoSwitch(
                          value: now.blockArrangements,
                          onChanged: (value) {
                            setState(() {
                              now.blockArrangements = !now.blockArrangements;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 40, right: 40),
                  //   child: Text(
                  //     '可以在其中安排任务的日程不会出现在“接下来”栏中。',
                  //     style: TextStyle(
                  //         color: CupertinoDynamicColor.resolve(
                  //             CupertinoColors.secondaryLabel, context),
                  //         fontSize: 14),
                  //   ),
                  // ),
                ],
                CupertinoListSection.insetGrouped(
                  header: Text(context.l10n.coreAdditionalInfo),
                  children: [
                    CupertinoTextFormFieldRow(
                      placeholder: context.l10n.coreLocation,
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: now.location),
                      onChanged: (String value) {
                        now.location = value;
                      },
                    ),
                    CupertinoTextFormFieldRow(
                      placeholder: context.l10n.coreDescription,
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: now.description),
                      onChanged: (String value) {
                        now.description = value;
                      },
                    ),
                  ],
                ),
                CupertinoButton(
                  onPressed: removeAndExit,
                  child: Text(
                    context.l10n.coreDeleteTask,
                    style: TextStyle(
                      color: CupertinoColors.systemPink,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
