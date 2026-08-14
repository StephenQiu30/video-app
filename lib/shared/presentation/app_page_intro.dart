import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';

final class AppPageIntro extends StatelessWidget {
  const AppPageIntro({
    required this.description,
    required this.title,
    super.key,
  });

  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            key: const Key('page-title-heading'),
            container: true,
            header: true,
            label: title,
            child: ExcludeSemantics(
              child: Text(title, style: theme.textTheme.displaySmall),
            ),
          ),
          const SizedBox(height: AppSpacing.medium),
          Semantics(
            key: const Key('page-description'),
            container: true,
            label: description,
            child: ExcludeSemantics(
              child: Text(
                description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
