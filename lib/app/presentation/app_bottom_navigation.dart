import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';

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

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
      ),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          _destination(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_rounded,
            label: localizations.homeNavigation,
          ),
          _destination(
            icon: Icons.history_rounded,
            selectedIcon: Icons.history_rounded,
            label: localizations.downloadHistoryNavigation,
          ),
          _destination(
            icon: Icons.description_outlined,
            selectedIcon: Icons.description_rounded,
            label: localizations.screenplayDocumentsNavigation,
          ),
          _destination(
            icon: Icons.monitor_heart_outlined,
            selectedIcon: Icons.monitor_heart_rounded,
            label: localizations.providerStatusNavigation,
          ),
          _destination(
            icon: Icons.person_outline_rounded,
            selectedIcon: Icons.person_rounded,
            label: localizations.accountNavigation,
          ),
        ],
      ),
    );
  }

  NavigationDestination _destination({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
  }) {
    return NavigationDestination(
      icon: Icon(icon, size: 22),
      selectedIcon: Icon(selectedIcon, size: 22),
      label: label,
    );
  }
}
