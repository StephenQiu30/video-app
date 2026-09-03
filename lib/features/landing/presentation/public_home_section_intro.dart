import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';

final class PublicHomeSectionIntro extends StatelessWidget {
  const PublicHomeSectionIntro({
    required this.description,
    required this.eyebrow,
    required this.title,
    this.prominent = false,
    this.titleKey,
    super.key,
  });

  final String description;
  final String eyebrow;
  final bool prominent;
  final String title;
  final Key? titleKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Semantics(
          header: true,
          child: Text(
            title,
            key: titleKey,
            style: prominent
                ? theme.textTheme.headlineLarge
                : theme.textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          description,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
