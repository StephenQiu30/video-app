import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/download/presentation/download_app_bar.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class AdminPage extends StatelessWidget {
  const AdminPage({
    required this.children,
    required this.description,
    required this.onRefresh,
    required this.refreshLabel,
    required this.title,
    super.key,
  });

  final List<Widget> children;
  final String description;
  final Future<void> Function() onRefresh;
  final String refreshLabel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DownloadAppBar(showBackButton: true),
      body: DataPageView(
        title: title,
        description: description,
        refreshLabel: refreshLabel,
        onRefresh: onRefresh,
        children: children,
      ),
    );
  }
}

final class AdminSectionLink extends StatelessWidget {
  const AdminSectionLink({
    required this.description,
    required this.icon,
    required this.onTap,
    required this.title,
    super.key,
  });

  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
          child: Row(
            children: [
              Icon(icon, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: AppSpacing.medium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium),
                    const SizedBox(height: AppSpacing.xSmall),
                    Text(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.small),
              const Icon(LucideIcons.chevronRight, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> adminLoading(String label) => [
  const Padding(
    padding: EdgeInsets.symmetric(vertical: 56),
    child: Center(child: CircularProgressIndicator()),
  ),
  Center(child: Text(label)),
];

List<Widget> adminError({
  required String action,
  required String description,
  required VoidCallback retry,
  required String title,
}) => [
  DataStateMessage(
    icon: LucideIcons.cloudOff,
    title: title,
    description: description,
    actionLabel: action,
    onAction: retry,
  ),
];
