import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class PendingIntakePanel extends StatelessWidget {
  const PendingIntakePanel({
    required this.actionLabel,
    required this.description,
    required this.icon,
    required this.onPressed,
    required this.title,
    super.key,
  });

  final String actionLabel;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: theme.colorScheme.onSurfaceVariant, size: 24),
              const SizedBox(width: AppSpacing.small),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleSmall),
                    const SizedBox(height: AppSpacing.xSmall),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xLarge),
          ShadButton(
            onPressed: onPressed,
            leading: Icon(icon, size: 20),
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(child: Text(actionLabel)),
          ),
        ],
      ),
    );
  }
}
