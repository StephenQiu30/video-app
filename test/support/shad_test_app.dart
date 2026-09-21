import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> pumpShadWidget(WidgetTester tester, Widget child) async {
  // Shad's non-English translations are deferred libraries, which must load
  // outside the fake clock before the localized first frame is asserted.
  _loadedChinese = await tester.runAsync(
    () => GlobalShadLocalizations.delegate.load(const Locale('zh')),
  );
  await tester.pumpWidget(child);
  await tester.pump();
}

ShadLocalizationsData? _loadedChinese;

class _LoadedShadDelegate extends GlobalShadLocalizations {
  const _LoadedShadDelegate();
  @override
  Future<ShadLocalizationsData> load(Locale locale) =>
      locale.languageCode == 'zh' && _loadedChinese != null
      ? SynchronousFuture(_loadedChinese!)
      : super.load(locale);
}

/// Production-equivalent Shad ancestors for isolated widget tests.
class ShadTestApp extends StatelessWidget {
  const ShadTestApp({
    required this.home,
    this.theme,
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const [Locale('en')],
    this.builder,
    super.key,
  });
  final Widget home;
  final ThemeData? theme;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final TransitionBuilder? builder;
  @override
  Widget build(BuildContext context) => ShadApp.custom(
    theme: theme?.brightness == Brightness.dark
        ? AppTheme.shadDark
        : AppTheme.shadLight,
    appBuilder: (context) => MaterialApp(
      theme: theme ?? AppTheme.light,
      locale: locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: [
        const _LoadedShadDelegate(),
        ...?localizationsDelegates,
      ],
      builder: (context, child) =>
          ShadAppBuilder(child: builder?.call(context, child) ?? child),
      home: home,
    ),
  );
}
