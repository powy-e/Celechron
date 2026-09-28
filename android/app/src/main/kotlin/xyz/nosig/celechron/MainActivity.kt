package xyz.nosig.celechron

import android.os.Bundle
import androidx.glance.appwidget.updateAll
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        window.statusBarColor = 0
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "top.celechron.celechron/ecardWidget").setMethodCallHandler {
                call, result ->
            if (call.method == "setLanguage") {
                val code = call.argument<String>("languageCode")
                if (code != "en" && code != "zh") {
                    result.error("invalid_language", "Expected languageCode en or zh", null)
                    return@setMethodCallHandler
                }
                NativeLanguage.set(this, code)
            } else if (call.method != "update" && call.method != "logout") {
                result.notImplemented()
                return@setMethodCallHandler
            }
            CoroutineScope(Dispatchers.Main).launch {
                ECardWidget().updateAll(this@MainActivity)
            }
            result.success(null)
        }
    }
}
