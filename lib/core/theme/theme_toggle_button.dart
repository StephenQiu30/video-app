import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/theme_mode_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final dark = mode == ThemeMode.dark;
    final localizations = AppLocalizations.of(context);

    return IconButton(
      key: const Key('navbar-theme-toggle'),
      tooltip: dark
          ? localizations.switchToLightTheme
          : localizations.switchToDarkTheme,
      onPressed: () =>
          unawaited(ref.read(themeModeProvider.notifier).setDark(dark: !dark)),
      icon: Icon(dark ? LucideIcons.sun : LucideIcons.moon),
    );
  }
}
