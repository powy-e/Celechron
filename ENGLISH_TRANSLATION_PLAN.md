# English localization implementation

Research began on 2026-09-27. Implementation was completed on 2026-09-28 on `feat/english-localization`.

The app now defaults to Chinese on every device. English is selectable in Settings, saved in secure storage, and applied to the mounted interface without discarding navigation state. Flutter app copy uses generated ARB catalogs, while Android and Apple surfaces use their native localization resources. Canonical university data, parser inputs, and stored identifiers remain unchanged.

## Current coverage and verification

- The generated catalogs contain 711 paired Chinese and English messages. They cover navigation, forms, task/calendar screens, academic results, refresh status, accessibility labels, diagnostics, exports, and background messages. `tool/localization/generate.py` checks key parity and generates the display adapter; `flutter gen-l10n` produces typed accessors.
- Native code propagates the saved language to Android widgets and Apple widget/watch storage. Android and iOS have localized string resources and permission text. Native previews were reviewed in both languages; an Apple build still requires macOS with Xcode.
- A real-font Flutter widget harness checked Settings at 390 px and 320 px with larger text, both directions of the language switch, the language picker, login sheet, task editor, navigation, and Academics. The narrow Academics search control presents an accessible icon because its text cannot fit at 320 px.
- `flutter test --no-pub -r expanded` passed 128 tests. `flutter analyze --no-pub --no-fatal-infos` found no errors or warnings; it reported 68 informational style hints. `git diff --check` passed.
- Remaining Chinese text in app source is primarily canonical semester/grade values, university response labels, parser patterns, legal identifiers, raw diagnostics, or original user/university content. The interface translates known categories at display boundaries. Arbitrary course names, instructors, locations, and user text are not machine-translated.

## What the audit found

- `lib/main.dart` declares English and Chinese but forces `Locale('zh')`. Existing Flutter delegates cover framework controls, not application copy.
- `flutter_localizations` and `intl` are already dependencies. There is no ARB catalog or `l10n.yaml`.
- `lib/page/calendar/calendar_view.dart` separately forces `zh_CN`; `lib/utils/time_helper.dart` constructs Chinese dates and relative times.
- A heuristic scan found approximately 552 Chinese string-literal occurrences across 33 UI/design files, plus approximately 114 across 16 native files. These are candidates, not unique translation keys. Models/services contain many more strings, including parser inputs and diagnostics that require classification.
- Scope includes navigation, forms, dialogs, accessibility, empty states, refresh/errors, academic information, diagnostics, calendar exports, background notifications, Android widgets, iOS widgets, Apple Watch screens/widgets, and permission descriptions.
- The Android widget preview image has embedded Chinese text: `android/app/src/main/res/drawable/ecard_widget_preview.png`.
- Local Flutter is available at `/home/coder/.cache/celechron-build/flutter/bin/flutter`: Flutter 3.38.1 / Dart 3.10.0, matching the pinned Android build workflow. It is not on the current shell PATH.

## Approach comparison

| Approach | Assessment |
| --- | --- |
| Replace Chinese literals directly | Fastest for an explicitly English-only fork, but still needs a semantic audit and native coverage. Makes later translation maintenance harder. |
| GetX translation maps | Fits an existing dependency, but string-key lookups offer fewer compiler checks than generated accessors. |
| Flutter `gen-l10n` and ARB | Recommended: generated accessors, translator context, typed placeholders, ICU plurals, and a catalog whose completeness can be checked. |
| Runtime machine translation | Unsuitable for app-owned UI. Adds latency, variable terminology, and a new dependency; translating university/user content is a separate feature. |

Flutter documents ARB catalogs, generated delegates, placeholders, and plurals in its [internationalization guide](https://docs.flutter.dev/ui/internationalization). Use source-directory imports for generated Dart files, following the [generation migration guidance](https://docs.flutter.dev/release/breaking-changes/flutter-generate-i10n-source).

## Implementation sequence used

1. **Classify and protect behavior.** Inventory text as presentation copy, parser/protocol data, stable identifiers, imported/user content, or comments. Resolve the text-dependent behavior below before changing the relevant messages.
2. **Add the localization foundation.** Add `lib/l10n/app_en.arb`, `app_zh.arb`, `l10n.yaml`, and `flutter: generate: true`. Use Chinese as the source/template catalog with English as its translation. Wire generated delegates into `GetCupertinoApp`; keep Chinese as the default for existing and new installations regardless of device language. Add a settings selector with `简体中文` and `English`, persist the choice in `Option`, and rebuild localized views when it changes. Pass locale/localization explicitly to background services and exports instead of depending on a widget context.
3. **Translate by feature with Luna.** Extract semantic keys with source text, usage context, placeholders, and length constraints. Have Luna translate bounded batches; one integration owner updates Dart call sites and merges catalog entries. Review terminology and ambiguous university concepts before integration.
4. **Cover formatting and generated output.** Localize calendar headings, weekdays, relative times, durations, counts/plurals, notifications/channel names, reports, share text, and export labels. Keep Asia/Shanghai scheduling, RMB amounts, GPA scales, and academic rules unchanged by language selection. Re-render cached app-generated descriptions when appropriate.
5. **Cover native surfaces and assets.** Add English/Chinese Android string resources for Kotlin widgets. Use Apple localization resources for Swift watch/widgets and permission descriptions, and configure English in Xcode's regions while retaining Chinese as the development language. Propagate the saved language to widget/shared storage, background work, and watch connectivity, then refresh affected surfaces; use Chinese when no preference exists. Provide a localized Android widget preview. System-owned permission prompts may follow the OS app-language setting rather than the Flutter selector; verify platform behavior and align native language configuration where supported.
6. **Validate completeness and behavior.** Run the checks below and review every user-facing surface, including failure and offline states.

Apple documents [string catalogs](https://developer.apple.com/documentation/xcode/localizing-and-varying-text-with-a-string-catalog) and Android documents [resource localization](https://developer.android.com/guide/topics/resources/localization). Flutter catalogs alone do not translate these native surfaces.

## Behavior that must survive translation

| Area | Evidence | Required handling |
| --- | --- | --- |
| Refresh/notifications | `lib/worker/background_app_refresh.dart` checks Chinese substrings such as `刷新`, `成绩`, and `作业` in error text. | Use stable source/status codes for decisions before localizing those messages. |
| Diagnostics | `lib/services/diagnostic_report.dart` interprets existing event/module text and produces report prose. | Separate stable event identity from presentation labels; continue interpreting existing stored logs. |
| Grade calculations | `lib/model/grade.dart` uses Chinese grade values as lookup keys and inclusion rules. | Preserve raw values and calculations; translate displayed grade labels through a mapping. |
| Terms and schedules | `lib/model/semester.dart` slices Chinese semester names at fixed offsets; course/schedule code inspects Chinese term characters. | Preserve canonical names; introduce display formatters rather than editing stored names. |
| University parsing | HTTP code, exam-date parsers, and location mappings match Chinese source content. | Keep API fields, request values, regexes, response probes, and campus aliases compatible with the source. |
| Calendar identity | `lib/model/calendar_to_ical.dart` hashes description, summary, and location into event UIDs. | Establish locale-independent identity and a compatibility strategy before changing exported text; avoid duplicate events on re-import. |
| Existing system calendars | `lib/model/calendar_to_system.dart` finds a calendar by `Celechron课表`. | Retain calendar IDs and recognize the legacy name when changing its display name. |
| Persistence and integrations | Hive fields, secure-storage keys, notification channel IDs, deep links, bridge payloads. | Keep identifiers stable; translate only their user-facing labels. |

## Translation work allocation

Research used two agents for architecture/scope and one Luna agent for terminology. No agents changed application code.

Implementation used one integration owner and bounded translation/review agents for:

- Navigation, tasks, calendar, and scheduling copy.
- Academics, login, settings, errors, and diagnostic prose.
- Notifications, exports, native widgets/watch, and accessibility.

Give each agent disjoint translation batches rather than concurrent ownership of one catalog. Require preservation of placeholders, ICU syntax, URLs, product names, and identifiers. Deduplicate repeated messages before translation; review the merged output for consistency and fit. Translate complete sentences rather than assembling translated fragments.

## Proposed terminology

These are product-language suggestions, not verified official university translations.

| Chinese | Proposed English |
| --- | --- |
| 接下来 | Up Next |
| 日程 | Calendar (navigation); Event (individual item) |
| 任务 | Tasks |
| 学业 | Academics |
| 设置 | Settings |
| 课表 | Class Schedule |
| 校历 | Academic Calendar |
| 成绩 | Grades |
| 学分 | Credits |
| 作业 / DDL | Assignments / Deadlines, according to context |
| 教务网 | Academic Portal |
| 统一身份认证 | Single Sign-On |
| 校园卡 | Campus Card |
| 付款码 | Payment QR Code |
| 工作段 / 休息段 | Work Interval / Break Interval |

Review `主修`, `素质拓展`, `实践`, `记点`, and the Second/Third/Fourth Classroom categories against their actual university meaning. Distinguish activity points from academic credits. Keep 4.3-point, legacy 4-point, and 5-point GPA labels explicit.

## What “entire app in English” can cover

All app-owned interface text and known categorical labels can be English. University-provided course names, instructor names, assignment descriptions, room names, holiday names, server details, and user-entered task text may still arrive in Chinese.

Prefer official English fields where available; their availability has not been established by this audit. Otherwise preserve original records and use reviewed display mappings for finite categories. Arbitrary content translation would need its own design and coverage criteria. Do not claim a completely English data experience from UI translation alone.

## Verification record and platform follow-up

- Generate catalogs; check key parity, placeholder types, and plural branches; format and analyze using the pinned SDK.
- Run the existing Flutter test suite. Update assertions for translated UI copy while retaining raw Chinese parsing fixtures.
- Add focused regression coverage for refresh classification, GPA/term parsing, calendar identity and legacy calendar lookup where behavior is refactored.
- Verify Chinese remains the default on both Chinese and English devices, including upgrades without a saved language preference. Exercise both languages across navigation, login failures, offline/cached results, task editing, academic screens, diagnostics, exports, and background notifications. Verify switching, persistence, and propagation after restart.
- Check phone/narrow-window layouts and larger text sizes, plus watch/widget truncation and accessibility labels.
- Build Android; build/test Apple targets on macOS with Xcode. Confirm permissions and native widgets use the expected language.
- Review remaining Chinese literals with an explicit allowlist for source data, parsing, identifiers, comments, and raw diagnostics. A blanket ban on Chinese characters would be incorrect.
- Confirm existing stored data, calendar events, and notifications remain compatible after updating.

The Flutter test, analysis, catalog, and real-font visual checks listed above are complete. Android and Apple target build/device checks require their respective platform toolchains; Apple targets cannot be built in the Linux workspace. The older checklist above remains a reference for future release testing, especially restored-account background refresh, installed widgets, watch surfaces, and OS permission prompts.
