import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/theme_toggle_button.dart';
import 'package:framegrab/shared/presentation/app_brand.dart';
import 'package:go_router/go_router.dart';

final class DownloadAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const DownloadAppBar({this.backFallbackLocation, super.key});

  final String? backFallbackLocation;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
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
      actions: [const ThemeToggleButton(), const SizedBox(width: 8)],
    );
  }
}
