import 'package:celechron/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';

import 'package:celechron/model/course.dart';
import 'package:celechron/design/round_rectangle_card.dart';
import 'package:celechron/page/scholar/course_detail/course_detail_view.dart';

class CourseBriefCard extends StatelessWidget {
  final Course course;
  final bool allowDirect;

  const CourseBriefCard(
      {required this.course, this.allowDirect = false, super.key});

  @override
  Widget build(BuildContext context) {
    return RoundRectangleCard(
        onTap: allowDirect
            ? () async => Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => CourseDetailPage(courseId: course.id)))
            : null,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 12.0,
                            height: 12.0,
                            decoration: const BoxDecoration(
                              color: CupertinoColors.systemTeal,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                course.name,
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .textStyle
                                    .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                              ),
                            ),
                          ),
                          Text(
                              course.credit > 0
                                  ? context.l10n.academicCourseCreditValue(
                                      course.credit.toStringAsFixed(1))
                                  : '  ${context.l10n.academicPendingUpdate}',
                              style: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle
                                  .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                        ],
                      ),
                      const SizedBox(height: 4.0),
                      Row(children: [
                        Icon(
                          CupertinoIcons.number,
                          size: 14,
                          color: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .color!
                              .withValues(alpha: 0.5),
                        ),
                        Expanded(
                            child: Text(
                                context.l10n
                                    .academicCourseIdValue(course.realId),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: CupertinoTheme.of(context)
                                      .textTheme
                                      .textStyle
                                      .color!
                                      .withValues(alpha: 0.75),
                                  overflow: TextOverflow.ellipsis,
                                ))),
                      ]),
                      Row(children: [
                        Icon(
                          CupertinoIcons.person_2_alt,
                          size: 14,
                          color: CupertinoTheme.of(context)
                              .textTheme
                              .textStyle
                              .color!
                              .withValues(alpha: 0.5),
                        ),
                        Expanded(
                            child: Text(
                                context.l10n.academicTeacherValue(
                                    displayText(course.teacher ?? '未知')),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: CupertinoTheme.of(context)
                                      .textTheme
                                      .textStyle
                                      .color!
                                      .withValues(alpha: 0.75),
                                  overflow: TextOverflow.ellipsis,
                                ))),
                        if (course.grade != null) ...{
                          Icon(
                            CupertinoIcons.checkmark_seal_fill,
                            size: 14,
                            color: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .color!
                                .withValues(alpha: 0.5),
                          ),
                          Text(
                              // grs is 90 / 100, ugrs is 4.0 / 5.0
                              context.l10n.academicGradeValue(
                                  course.grade!.original == ""
                                      ? course.grade!.hundredPoint.toString()
                                      : course.grade!.original,
                                  course.grade!.original == ""
                                      ? '100'
                                      : course.grade!.fivePoint
                                          .toStringAsFixed(1)),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: CupertinoTheme.of(context)
                                    .textTheme
                                    .textStyle
                                    .color!
                                    .withValues(alpha: 0.75),
                                overflow: TextOverflow.ellipsis,
                              )),
                        }
                      ]),
                      // 添加online和type字段的显示
                      // 当课程为线上课程(online == true)或具有特定课程类型(type != null)时显示
                      if (course.online == true || course.type != null) ...{
                        // const SizedBox(height: 4.0),
                        Row(children: [
                          if (course.online == true) ...{
                            Icon(
                              CupertinoIcons.globe,
                              size: 14,
                              color: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle
                                  .color!
                                  .withValues(alpha: 0.5),
                            ),
                            Text(context.l10n.academicOnlineCourse,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: CupertinoTheme.of(context)
                                      .textTheme
                                      .textStyle
                                      .color!
                                      .withValues(alpha: 0.75),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            const SizedBox(width: 8.0),
                          },
                          if (course.type != null) ...{
                            Icon(
                              CupertinoIcons.tag,
                              size: 14,
                              color: CupertinoTheme.of(context)
                                  .textTheme
                                  .textStyle
                                  .color!
                                  .withValues(alpha: 0.5),
                            ),
                            Text(' ${displayText(course.type!)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: CupertinoTheme.of(context)
                                      .textTheme
                                      .textStyle
                                      .color!
                                      .withValues(alpha: 0.75),
                                  overflow: TextOverflow.ellipsis,
                                )),
                          }
                        ]),
                      }
                    ],
                  )),
            ],
          ),
        ));
  }
}
