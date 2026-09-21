import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/theme_toggle_button.dart';
import 'package:framegrab/shared/presentation/app_brand.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AppNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AppNavigationBar({
    this.backFallbackLocation,
    this.actions = const [],
    super.key,
  });

  final String? backFallbackLocation;
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final fallbackLocation = backFallbackLocation;
    return ColoredBox(
      color: ShadTheme.of(context).colorScheme.background,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                if (fallbackLocation != null)
                  Semantics(
                    label: MaterialLocalizations.of(context).backButtonTooltip,
                    child: ShadIconButton.ghost(
                      key: const Key('navbar-back-button'),
                      icon: const Icon(PhosphorIconsRegular.arrowLeft),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go(fallbackLocation);
                        }
                      },
                    ),
                  ),
                const Expanded(child: AppBrand()),
                const ThemeToggleButton(),
                ...actions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
