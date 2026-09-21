import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/shared/presentation/app_navigation_bar.dart';

final class AuthPageScaffold extends StatelessWidget {
  const AuthPageScaffold({
    required this.title,
    required this.description,
    required this.child,
    this.showBackButton = true,
    super.key,
  });

  final String title;
  final String description;
  final Widget child;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavigationBar(
        backFallbackLocation: showBackButton ? '/' : null,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.xLarge,
            AppSpacing.pageTop,
            AppSpacing.xLarge,
            AppSpacing.section,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.small),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxLarge),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
