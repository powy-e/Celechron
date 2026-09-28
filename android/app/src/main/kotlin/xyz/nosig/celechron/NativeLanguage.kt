package xyz.nosig.celechron

import android.content.Context
import android.content.res.Configuration
import java.util.Locale

/** The user's app language survives sign-out and applies to widget processes. */
internal object NativeLanguage {
    private const val preferences = "celechron_native_language"
    private const val key = "languageCode"

    fun code(context: Context): String =
        context.getSharedPreferences(preferences, Context.MODE_PRIVATE).getString(key, "zh")
            .let { if (it == "en") "en" else "zh" }

    fun set(context: Context, code: String) {
        require(code == "en" || code == "zh")
        context.getSharedPreferences(preferences, Context.MODE_PRIVATE).edit()
            .putString(key, code).apply()
    }

    fun text(context: Context, resourceId: Int): String {
        val config = Configuration(context.resources.configuration)
        config.setLocale(Locale.forLanguageTag(code(context)))
        return context.createConfigurationContext(config).getString(resourceId)
    }
}
