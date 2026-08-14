import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/shared/presentation/app_page_intro.dart';

final class ContractPendingView extends StatelessWidget {
  const ContractPendingView({
    required this.description,
    required this.pageDescription,
    required this.pageTitle,
    required this.title,
    super.key,
  });

  final String description;
  final String pageDescription;
  final String pageTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 32),
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppPageIntro(description: pageDescription, title: pageTitle),
                  const SizedBox(height: AppSpacing.section),
                  const Divider(),
                  const SizedBox(height: AppSpacing.xLarge),
                  Semantics(
                    container: true,
                    explicitChildNodes: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Semantics(
                          container: true,
                          header: true,
                          label: title,
                          child: ExcludeSemantics(
                            child: Text(
                              title,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ),
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
            ),
          ),
        ],
      ),
    );
  }
}
