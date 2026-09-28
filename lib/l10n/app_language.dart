import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:celechron/database/database_helper.dart';
import 'package:celechron/model/option.dart';
import 'package:celechron/utils/utils.dart';

/// Language is explicit: Chinese remains the default on every device.
class AppLanguage {
  static final locale = ValueNotifier<Locale>(const Locale('zh'));
  static const _channel = MethodChannel('top.celechron.celechron/ecardWidget');
  static String get code => locale.value.languageCode;
  static bool get isEnglish => code == 'en';

  static void use(String? code) {
    final selected = Locale(code == 'en' ? 'en' : 'zh');
    // GetCupertinoApp gives Get.locale precedence over its locale argument.
    // Keep both in sync while preserving the existing Navigator and tab state.
    Get.locale = selected;
    locale.value = selected;
  }

  static Future<void> initialize(DatabaseHelper db) async {
    use(db.getLanguageCode());
    await db.setLanguageCode(code);
    await syncNative();
  }

  static Future<void> initializeBackground() async {
    const storage = FlutterSecureStorage();
    use(await storage.read(
        key: DatabaseHelper.kLanguageCode, iOptions: secureStorageIOSOptions));
  }

  static Future<void> select(String code) async {
    final db = Get.find<DatabaseHelper>(tag: 'db');
    await db.setLanguageCode(code);
    use(code);
    Get.find<Option>(tag: 'option').languageCode.value = AppLanguage.code;
    await syncNative();
  }

  static Future<void> syncNative() async {
    if (kIsWeb ||
        (defaultTargetPlatform != TargetPlatform.iOS &&
            defaultTargetPlatform != TargetPlatform.android)) {
      return;
    }
    try {
      await _channel.invokeMethod<void>('setLanguage', {'languageCode': code});
    } on MissingPluginException {
      // Tests and platforms without widget support have no native receiver.
    } on PlatformException catch (error) {
      debugPrint('Unable to synchronize widget language: ${error.code}');
    }
  }
}
