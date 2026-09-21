import 'package:flutter/material.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

final class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = [
      (
        l10n.adminAnalyticsTitle,
        l10n.adminAnalyticsDescription,
        PhosphorIconsRegular.chartLineUp,
        '/admin/analytics',
      ),
      (
        l10n.adminFilesTitle,
        l10n.adminFilesDescription,
        PhosphorIconsRegular.hardDrive,
        '/admin/files',
      ),
      (
        l10n.adminUsersTitle,
        l10n.adminUsersDescription,
        PhosphorIconsRegular.users,
        '/admin/users',
      ),
      (
        l10n.adminProvidersTitle,
        l10n.adminProvidersDescription,
        PhosphorIconsRegular.treeStructure,
        '/admin/providers',
      ),
      (
        l10n.adminAiProvidersTitle,
        l10n.adminAiProvidersDescription,
        PhosphorIconsRegular.sparkle,
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
