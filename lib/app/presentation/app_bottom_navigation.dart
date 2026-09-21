import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    required this.onDestinationSelected,
    required this.selectedIndex,
    super.key,
  });

  final ValueChanged<int> onDestinationSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final destinations = [
      (icon: PhosphorIconsRegular.house, label: localizations.homeNavigation),
      (
        icon: PhosphorIconsRegular.clockCounterClockwise,
        label: localizations.historyTab,
      ),
      (icon: PhosphorIconsRegular.fileText, label: localizations.documentsTab),
      (icon: PhosphorIconsRegular.waveform, label: localizations.statusTab),
      (icon: PhosphorIconsRegular.user, label: localizations.accountNavigation),
    ];

    return ColoredBox(
      key: const Key('app-bottom-navigation'),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        top: false,
        child: MediaQuery.withClampedTextScaling(
          maxScaleFactor: 1.3,
          child: SizedBox(
            height: 72,
            child: Row(
              children: [
                for (var index = 0; index < destinations.length; index += 1)
                  Expanded(
                    child: _AppTabItem(
                      key: Key('app-tab-$index'),
                      icon: destinations[index].icon,
                      label: destinations[index].label,
                      selected: selectedIndex == index,
                      onTap: () => onDestinationSelected(index),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _AppTabItem extends StatelessWidget {
  const _AppTabItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final foreground = selected ? colors.onSurface : colors.onSurfaceVariant;

    return Semantics(
      role: ui.SemanticsRole.tab,
      selected: selected,
      label: label,
      onTap: onTap,
      excludeSemantics: true,
      child: ShadTooltip(
        child: ShadButton.ghost(
          onPressed: onTap,
          padding: EdgeInsets.zero,
          height: 0,
          expands: true,
          mainAxisAlignment: MainAxisAlignment.start,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 64),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: foreground, size: 23),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: foreground,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        builder: (context) => Text(label),
      ),
    );
  }
}
