import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/theme_mode_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_brand.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class DownloadAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const DownloadAppBar({this.backFallbackLocation, super.key});

  final String? backFallbackLocation;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final dark = mode.resolvesToDark(MediaQuery.platformBrightnessOf(context));
    final localizations = AppLocalizations.of(context);
    final fallbackLocation = backFallbackLocation;
    return AppBar(
      automaticallyImplyLeading: false,
      leading: fallbackLocation == null
          ? null
          : BackButton(
              key: const Key('navbar-back-button'),
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(fallbackLocation);
                }
              },
            ),
      titleSpacing: fallbackLocation == null ? 16 : 0,
      toolbarHeight: 72,
      title: const AppBrand(),
      actions: [
        IconButton(
          key: const Key('navbar-theme-toggle'),
          tooltip: dark
              ? localizations.switchToLightTheme
              : localizations.switchToDarkTheme,
          onPressed: () =>
              ref.read(themeModeProvider.notifier).setDark(dark: !dark),
          icon: Icon(dark ? LucideIcons.sun : LucideIcons.moon),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
