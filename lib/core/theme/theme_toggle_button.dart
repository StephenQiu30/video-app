import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/theme_mode_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final dark = mode == ThemeMode.dark;
    final localizations = AppLocalizations.of(context);

    return ShadTooltip(
      builder: (context) => Text(
        dark
            ? localizations.switchToLightTheme
            : localizations.switchToDarkTheme,
      ),
      child: Semantics(
        label: dark
            ? localizations.switchToLightTheme
            : localizations.switchToDarkTheme,
        child: ShadIconButton.ghost(
          key: const Key('navbar-theme-toggle'),
          onPressed: () => unawaited(
            ref.read(themeModeProvider.notifier).setDark(dark: !dark),
          ),
          icon: Icon(
            dark ? PhosphorIconsRegular.sun : PhosphorIconsRegular.moon,
          ),
        ),
      ),
    );
  }
}
