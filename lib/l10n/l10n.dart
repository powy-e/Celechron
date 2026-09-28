import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'app_language.dart';
import 'app_localizations.dart';
import 'catalog_display.dart';

export 'app_language.dart';
export 'app_localizations.dart';

extension LocalizedContext on BuildContext {
  AppLocalizations get l10n =>
      Localizations.of<AppLocalizations>(this, AppLocalizations) ?? appL10n;
}

/// Background workers load AppLanguage before producing localized output.
AppLocalizations get appL10n =>
    lookupAppLocalizations(AppLanguage.locale.value);

/// Translate known app-owned labels at presentation boundaries only.
/// Never use this function on values before parsing, storing, or comparing them.
String displayText(String source) => _displayText(source, 0);

/// A legacy fixed event receives this suffix when it is created from a repeat.
/// Keep its stored title intact and translate only the app-added marker.
String displayPastEventSummary(String source) {
  const suffix = '（过去日程）';
  if (!AppLanguage.isEnglish || !source.endsWith(suffix)) return source;
  return '${source.substring(0, source.length - suffix.length)} '
      '(${appL10n.sharedPastEvent})';
}

String _displayText(String source, int depth) {
  if (!AppLanguage.isEnglish || source.isEmpty || depth > 5) return source;
  final translated = catalogDisplayText(
      source, appL10n, (value) => _displayText(value, depth + 1));
  if (translated != null) return translated;
  final term = RegExp(r'^(\d{4})-(\d{4})(春夏|秋冬)(学期)?$').firstMatch(source);
  if (term != null) {
    return '${term[1]}–${term[2]} ${term[3] == '春夏' ? 'Spring/Summer' : 'Autumn/Winter'}';
  }
  final examDay =
      RegExp(r'^(春|夏|秋|冬)?(?:季)?考试周第\s*(\d+)\s*天\s*$').firstMatch(source);
  if (examDay != null) {
    final season = examDay[1];
    return '${season == null ? '' : '${_displayText(season, depth + 1)} '}Exam week, day ${examDay[2]}';
  }
  // Composite diagnostic summaries are assembled from known messages.
  if (source.contains('\n')) {
    return source
        .split('\n')
        .map((line) => _displayText(line, depth + 1))
        .join('\n');
  }
  return source;
}

String localizedWeekday(int weekday, {bool short = false}) =>
    (short ? DateFormat.E(AppLanguage.code) : DateFormat.EEEE(AppLanguage.code))
        .format(DateTime(2024, 1, weekday));
