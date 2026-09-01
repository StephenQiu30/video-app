import 'package:flutter/material.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = [
      (
        l10n.adminAnalyticsTitle,
        l10n.adminAnalyticsDescription,
        LucideIcons.chartNoAxesCombined,
        '/admin/analytics',
      ),
      (
        l10n.adminFilesTitle,
        l10n.adminFilesDescription,
        LucideIcons.hardDrive,
        '/admin/files',
      ),
      (
        l10n.adminUsersTitle,
        l10n.adminUsersDescription,
        LucideIcons.users,
        '/admin/users',
      ),
      (
        l10n.adminProvidersTitle,
        l10n.adminProvidersDescription,
        LucideIcons.listTree,
        '/admin/providers',
      ),
      (
        l10n.adminAiProvidersTitle,
        l10n.adminAiProvidersDescription,
        LucideIcons.sparkles,
        '/admin/ai-providers',
      ),
    ];
    return AdminPage(
      backFallbackLocation: '/',
      title: l10n.adminCenterTitle,
      description: l10n.adminCenterDescription,
      refreshLabel: l10n.refreshAction,
      onRefresh: () async {},
      children: [
        for (final item in items)
          AdminSectionLink(
            title: item.$1,
            description: item.$2,
            icon: item.$3,
            onTap: () => context.push(item.$4),
          ),
      ],
    );
  }
}
