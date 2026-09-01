import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/core/theme/theme_toggle_button.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_brand.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class PublicHomeScreen extends StatelessWidget {
  const PublicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      key: const Key('public-home-screen'),
      appBar: AppBar(
        title: const AppBrand(),
        toolbarHeight: 72,
        actions: [
          const ThemeToggleButton(),
          TextButton(
            key: const Key('public-home-login'),
            onPressed: () => context.push('/auth/login'),
            child: Text(localizations.loginAction),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.pageHorizontal,
                AppSpacing.pageTop,
                AppSpacing.pageHorizontal,
                48,
              ),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Semantics(
                          header: true,
                          child: Text(
                            localizations.publicHomeTitle,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.medium),
                        Text(
                          localizations.publicHomeDescription,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                        const SizedBox(height: AppSpacing.xLarge),
                        FilledButton(
                          key: const Key('public-home-register'),
                          onPressed: () => context.push('/auth/register'),
                          child: Text(localizations.registerAction),
                        ),
                        const SizedBox(height: AppSpacing.section),
                        Text(
                          localizations.publicHomeCapabilitiesTitle,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.xLarge),
                        _Capability(
                          description: localizations.publicVideoDescription,
                          icon: LucideIcons.video,
                          title: localizations.publicVideoTitle,
                        ),
                        _Capability(
                          description: localizations.publicDocumentDescription,
                          icon: LucideIcons.fileText,
                          title: localizations.publicDocumentTitle,
                        ),
                        _Capability(
                          description: localizations.publicAnalysisDescription,
                          icon: LucideIcons.sparkles,
                          title: localizations.publicAnalysisTitle,
                        ),
                        const SizedBox(height: AppSpacing.section),
                        Icon(
                          LucideIcons.shieldCheck,
                          size: 28,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: AppSpacing.medium),
                        Text(
                          localizations.publicTrustTitle,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.small),
                        Text(
                          localizations.publicTrustDescription,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _Capability extends StatelessWidget {
  const _Capability({
    required this.description,
    required this.icon,
    required this.title,
  });

  final String description;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xLarge),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 22,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: AppSpacing.medium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: AppSpacing.xSmall),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
