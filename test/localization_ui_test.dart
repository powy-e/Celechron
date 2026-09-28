import 'dart:io';
import 'dart:ui' as ui;

import 'package:celechron/database/database_helper.dart';
import 'package:celechron/l10n/l10n.dart';
import 'package:celechron/model/option.dart';
import 'package:celechron/model/period.dart';
import 'package:celechron/model/scholar.dart';
import 'package:celechron/model/task.dart';
import 'package:celechron/page/flow/flow_controller.dart';
import 'package:celechron/page/home_page.dart';
import 'package:celechron/page/option/option_view.dart';
import 'package:celechron/page/scholar/scholar_controller.dart';
import 'package:celechron/page/scholar/scholar_view.dart';
import 'package:celechron/page/task/task_controller.dart';
import 'package:celechron/page/task/task_edit_page.dart';
import 'package:celechron/worker/fuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

class _LanguageDb extends DatabaseHelper {
  String? storedLanguage;

  @override
  String getLanguageCode() => storedLanguage == 'en' ? 'en' : 'zh';

  @override
  Future<void> setLanguageCode(String code) async {
    storedLanguage = code == 'en' ? 'en' : 'zh';
  }

  @override
  Future<void> setFlowList(List<Period> flowList) async {}

  @override
  Future<void> setFlowListUpdateTime(DateTime time) async {}

  @override
  DateTime getFlowListUpdateTime() => DateTime.now();

  @override
  Duration getWorkTime() => const Duration(minutes: 45);

  @override
  Duration getRestTime() => const Duration(minutes: 15);

  @override
  Map<DateTime, DateTime> getAllowTime() => {};

  @override
  Future<void> setTaskList(List<Task> tasks) async {}

  @override
  Future<void> setTaskListUpdateTime(DateTime time) async {}
}

class _StaticFuse extends Fuse {
  @override
  Future<String?> checkUpdate() async => null;
}

class _BrokenBoxChild extends StatelessWidget {
  const _BrokenBoxChild();

  @override
  Widget build(BuildContext context) => throw StateError('original build error');
}

Option _option() => Option(
      workTime: const Duration(minutes: 45).obs,
      restTime: const Duration(minutes: 15).obs,
      allowTime: <DateTime, DateTime>{}.obs,
      gpaStrategy: GpaStrategy.best.obs,
      pushOnGradeChange: false.obs,
      pushOnDdlReminder: false.obs,
      brightnessMode: BrightnessMode.system.obs,
      courseIdMappingList: <CourseIdMap>[].obs,
      hideHomeGpa: false.obs,
      asyncRefresh: false.obs,
    );

Widget _app(Widget home, {double textScale = 1}) =>
    ValueListenableBuilder<Locale>(
      valueListenable: AppLanguage.locale,
      builder: (_, locale, __) => RepaintBoundary(
        key: const ValueKey('screen'),
        child: GetCupertinoApp(
          debugShowCheckedModeBanner: false,
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
            child: home,
          ),
        ),
      ),
    );

Future<void> _capture(WidgetTester tester, String name) async {
  if (Platform.environment['CELECHRON_RENDER'] != '1') return;
  final boundary = tester.renderObject<RenderRepaintBoundary>(
      find.byKey(const ValueKey('screen')));
  await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: 1);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final directory = Directory('/tmp/celechron-localization-review');
    directory.createSync(recursive: true);
    File('${directory.path}/$name.png')
        .writeAsBytesSync(bytes!.buffer.asUint8List());
  });
}

void main() {
  late _LanguageDb db;
  late Scholar scholar;

  setUpAll(() async {
    Future<void> load(String family, String path) async {
      final bytes = await File(path).readAsBytes();
      await (FontLoader(family)
            ..addFont(
                Future.value(ByteData.sublistView(Uint8List.fromList(bytes)))))
          .load();
    }

    const noto = '/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc';
    await load('CupertinoSystemText', noto);
    await load('CupertinoSystemDisplay', noto);
    await load('Roboto', noto);
    await load('packages/cupertino_icons/CupertinoIcons',
        '/home/coder/.pub-cache/hosted/pub.dev/cupertino_icons-1.0.9/assets/CupertinoIcons.ttf');
    await load('MaterialIcons',
        '/home/coder/.cache/celechron-build/flutter/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf');
  });

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('top.celechron.celechron/ecardWidget'),
      (call) async => null,
    );
    Get.reset();
    db = _LanguageDb();
    scholar = Scholar();
    Get.put<DatabaseHelper>(db, tag: 'db');
    Get.put<Option>(_option(), tag: 'option');
    Get.put<Rx<Scholar>>(scholar.obs, tag: 'scholar');
    Get.put<RxList<Task>>(<Task>[].obs, tag: 'taskList');
    Get.put<Rx<DateTime>>(DateTime.now().obs, tag: 'taskListLastUpdate');
    Get.put<RxList<Period>>(<Period>[].obs, tag: 'flowList');
    Get.put<Rx<DateTime>>(DateTime.now().obs, tag: 'flowListLastUpdate');
    Get.put<Rx<Fuse>>(_StaticFuse().obs, tag: 'fuse');
    AppLanguage.use('zh');
  });

  tearDown(() {
    Get.reset();
    AppLanguage.use('zh');
  });

  testWidgets('Chinese default and in-place English switch persist',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await AppLanguage.initialize(db);
    await tester.pumpWidget(_app(OptionPage()));
    await tester.pump();
    expect(find.text('设置'), findsWidgets);
    expect(find.text('简体中文'), findsOneWidget);
    await tester.tap(find.text('简体中文'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('English').last);
    await tester.pumpAndSettle();
    await _capture(tester, 'settings_after_switch_390');
    expect(find.text('Settings'), findsWidgets);
    expect(find.text('English'), findsOneWidget);
    expect(db.storedLanguage, 'en');
    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();
    await _capture(tester, 'language_picker_english_390');
    await tester.tap(find.text('简体中文').last);
    await tester.pumpAndSettle();
    expect(find.text('设置'), findsWidgets);
    expect(db.storedLanguage, 'zh');
    await _capture(tester, 'settings_switched_back_390');
    await tester.tap(find.text('简体中文'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('English').last);
    await tester.pumpAndSettle();
    AppLanguage.use('zh');
    await AppLanguage.initialize(db);
    await tester.pump();
    expect(AppLanguage.code, 'en');
    await _capture(tester, 'settings_logged_out_390');
  });

  testWidgets('English settings render at 320 px with large text',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(320, 700));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    scholar.isLogan = true;
    scholar.username = '3200000000';
    AppLanguage.use('en');
    await tester.pumpWidget(_app(OptionPage(), textScale: 1.35));
    await tester.pump();
    expect(find.text('Settings'), findsWidgets);
    expect(tester.takeException(), isNull);
    await _capture(tester, 'settings_logged_in_320_large');
  });

  testWidgets('English login sheet and task editor fit phone width',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    AppLanguage.use('en');
    await tester.pumpWidget(_app(OptionPage()));
    await tester.pump();
    await tester.tap(find.text('Tap to log in'));
    await tester.pumpAndSettle();
    expect(find.text('Campus account login'), findsOneWidget);
    await _capture(tester, 'login_english_390');
    expect(tester.takeException(), isNull);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    final now = DateTime(2026, 10, 1, 9);
    final task = Task(
      summary: 'Lab report',
      description: 'Review results',
      location: 'Library',
      startTime: now,
      endTime: now.add(const Duration(hours: 2)),
      repeatEndsTime: now,
    );
    await tester.pumpWidget(_app(TaskEditPage(task)));
    await tester.pumpAndSettle();
    expect(find.text('Edit task'), findsOneWidget);
    await _capture(tester, 'task_editor_english_390');
    expect(tester.takeException(), isNull);
  });

  testWidgets('English navigation labels fit narrow phone', (tester) async {
    await tester.binding.setSurfaceSize(const Size(320, 700));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    AppLanguage.use('en');
    await tester.pumpWidget(_app(const HomePage(title: 'Celechron')));
    await tester.pump(const Duration(seconds: 1));
    await _capture(tester, 'navigation_english_320');
    expect(tester.takeException(), isNull);
    await tester.tap(find.text('Academics'));
    await tester.pump(const Duration(milliseconds: 100));
    await _capture(tester, 'academics_english_320');
    expect(tester.takeException(), isNull);
    Get.find<TaskController>().onClose();
    Get.find<FlowController>().onClose();
    Get.find<ScholarController>().onClose();
  });

  testWidgets('fresh Chinese startup mounts the home and academics pages',
      (tester) async {
    await AppLanguage.initialize(db);
    expect(AppLanguage.code, 'zh');
    expect(scholar.isLogan, isFalse);

    await tester.pumpWidget(_app(const HomePage(title: 'Celechron')));
    await tester.pump(const Duration(seconds: 1));
    expect(tester.takeException(), isNull);
    await tester.tap(find.text('学业'));
    await tester.pump(const Duration(milliseconds: 100));
    expect(tester.takeException(), isNull);

    Get.find<TaskController>().onClose();
    Get.find<FlowController>().onClose();
    Get.find<ScholarController>().onClose();
  });

  testWidgets('scholar page leaves errors in other box layouts intact',
      (tester) async {
    final originalBuilder = ErrorWidget.builder;
    ScholarPage();
    expect(ErrorWidget.builder, same(originalBuilder));

    await tester.pumpWidget(_app(const Column(children: [
      Expanded(child: _BrokenBoxChild()),
    ])));
    final error = tester.takeException();
    expect(error, isA<StateError>());
    expect(error.toString(), contains('original build error'));
    await tester.pump();
    expect(tester.takeException(), isNull);
    Get.find<ScholarController>().onClose();
  });
}
