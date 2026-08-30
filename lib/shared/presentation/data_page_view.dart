import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/shared/presentation/app_page_intro.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class DataPageView extends StatelessWidget {
  const DataPageView({
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
    return SafeArea(
      top: false,
      child: RefreshIndicator(
        onRefresh: onRefresh,
        semanticsLabel: refreshLabel,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 32),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppPageIntro(description: description, title: title),
                    const SizedBox(height: AppSpacing.section),
                    const Divider(),
                    const SizedBox(height: AppSpacing.xLarge),
                    ...children,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class DataStateMessage extends StatelessWidget {
  const DataStateMessage({
    required this.description,
    required this.title,
    this.actionLabel,
    this.icon = LucideIcons.inbox,
    this.onAction,
    super.key,
  });

  final String? actionLabel;
  final String description;
  final IconData icon;
  final VoidCallback? onAction;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxLarge),
        child: Column(
          children: [
            Icon(icon, color: theme.colorScheme.onSurfaceVariant, size: 28),
            const SizedBox(height: AppSpacing.medium),
            Text(title, style: theme.textTheme.titleSmall),
            const SizedBox(height: AppSpacing.xSmall),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.large),
              TextButton.icon(
                onPressed: onAction,
                icon: const Icon(LucideIcons.refreshCw, size: 18),
                label: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

final class DataMetric extends StatelessWidget {
  const DataMetric({required this.label, required this.value, super.key});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$value', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

final class DataStatusLabel extends StatelessWidget {
  const DataStatusLabel({required this.color, required this.label, super.key});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: const SizedBox.square(dimension: 8),
        ),
        const SizedBox(width: AppSpacing.xSmall),
        Flexible(
          child: Text(label, style: Theme.of(context).textTheme.labelMedium),
        ),
      ],
    );
  }
}
