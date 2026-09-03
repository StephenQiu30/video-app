import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';

typedef PublicHomeWorkflowItem = ({String description, String title});

final class PublicHomeWorkflow extends StatelessWidget {
  const PublicHomeWorkflow({
    required this.items,
    required this.title,
    super.key,
  });

  final List<PublicHomeWorkflowItem> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      key: const Key('public-home-workflow'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(title, style: theme.textTheme.titleMedium),
        ),
        const SizedBox(height: AppSpacing.large),
        for (final (index, item) in items.indexed)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.large),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 36,
                  child: Text(
                    '${index + 1}'.padLeft(2, '0'),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: theme.textTheme.titleSmall),
                      const SizedBox(height: AppSpacing.xSmall),
                      Text(
                        item.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
