import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/core/theme/theme_mode_controller.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class FramegrabApp extends ConsumerStatefulWidget {
  const FramegrabApp({this.locale, super.key});

  final Locale? locale;

  @override
  ConsumerState<FramegrabApp> createState() => _FramegrabAppState();
}

final class _FramegrabAppState extends ConsumerState<FramegrabApp> {
  @override
  void initState() {
    super.initState();
    unawaited(
      Future<void>.microtask(
        () => ref.read(authSessionProvider.notifier).restore(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: '帧取',
      debugShowCheckedModeBanner: false,
      locale: widget.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
