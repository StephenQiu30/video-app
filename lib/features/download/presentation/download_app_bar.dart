import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/theme_mode_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_brand.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class DownloadAppBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const DownloadAppBar({this.showBackButton = false, super.key});

  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final dark = mode.resolvesToDark(MediaQuery.platformBrightnessOf(context));
    final localizations = AppLocalizations.of(context);
    return AppBar(
      automaticallyImplyLeading: showBackButton,
      titleSpacing: showBackButton ? 0 : 16,
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
