import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/landing/presentation/public_home_section_intro.dart';

typedef PublicHomeQuestion = ({String answer, String question});

final class PublicHomeFaq extends StatelessWidget {
  const PublicHomeFaq({
    required this.description,
    required this.eyebrow,
    required this.items,
    required this.title,
    super.key,
  });

  final String description;
  final String eyebrow;
  final List<PublicHomeQuestion> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      key: const Key('public-home-faq'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PublicHomeSectionIntro(
          description: description,
          eyebrow: eyebrow,
          title: title,
        ),
        const SizedBox(height: AppSpacing.xLarge),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.question, style: theme.textTheme.titleMedium),
                const SizedBox(height: AppSpacing.small),
                Text(
                  item.answer,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
