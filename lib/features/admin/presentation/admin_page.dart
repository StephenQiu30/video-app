import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/download/presentation/download_app_bar.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminPage extends StatelessWidget {
  const AdminPage({
    required this.children,
    required this.description,
    required this.onRefresh,
    required this.refreshLabel,
    required this.title,
    this.backFallbackLocation = '/admin',
    super.key,
  });

  final String backFallbackLocation;
  final List<Widget> children;
  final String description;
  final Future<void> Function() onRefresh;
  final String refreshLabel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DownloadAppBar(backFallbackLocation: backFallbackLocation),
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
    return ShadButton.ghost(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      height: 0,
      expands: true,
      mainAxisAlignment: MainAxisAlignment.start,
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
            const Icon(PhosphorIconsRegular.caretRight, size: 18),
          ],
        ),
      ),
    );
  }
}

List<Widget> adminLoading(String label) => [
  const Padding(
    padding: EdgeInsets.symmetric(vertical: 56),
    child: Center(child: AppSpinner()),
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
    icon: PhosphorIconsRegular.cloudSlash,
    title: title,
    description: description,
    actionLabel: action,
    onAction: retry,
  ),
];
