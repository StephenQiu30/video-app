import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/core/theme/theme_toggle_button.dart';
import 'package:framegrab/features/landing/domain/public_home_links.dart';
import 'package:framegrab/features/landing/presentation/public_home_details.dart';
import 'package:framegrab/features/landing/presentation/public_home_section_intro.dart';
import 'package:framegrab/features/landing/presentation/public_home_workflow.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_brand.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

final class PublicHomeScreen extends StatelessWidget {
  const PublicHomeScreen({super.key});

  Future<void> _openExternal(
    BuildContext context,
    Uri uri,
    String errorMessage,
  ) async {
    try {
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (opened) return;
    } catch (_) {
      // Surface the same localized failure for rejected and unavailable links.
    }
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
            child: Text(l10n.loginAction),
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
                        PublicHomeSectionIntro(
                          description: l10n.publicHomeDescription,
                          eyebrow: l10n.publicHomeEyebrow,
                          prominent: true,
                          title: l10n.publicHomeTitle,
                          titleKey: const Key('public-home-title'),
                        ),
                        const SizedBox(height: AppSpacing.xLarge),
                        Wrap(
                          spacing: AppSpacing.small,
                          runSpacing: AppSpacing.small,
                          children: [
                            FilledButton.icon(
                              key: const Key('public-home-register'),
                              onPressed: () => context.push('/auth/register'),
                              icon: const Icon(LucideIcons.arrowRight),
                              label: Text(l10n.publicRegisterAction),
                            ),
                            FilledButton.tonalIcon(
                              key: const Key('public-home-source'),
                              onPressed: () => _openExternal(
                                context,
                                PublicHomeLinks.repository,
                                l10n.publicExternalLinkError,
                              ),
                              icon: const Icon(LucideIcons.codeXml),
                              label: Text(l10n.publicSourceAction),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.section),
                        PublicHomeWorkflow(
                          title: l10n.publicWorkflowTitle,
                          items: [
                            (
                              title: l10n.publicWorkflowInspectTitle,
                              description:
                                  l10n.publicWorkflowInspectDescription,
                            ),
                            (
                              title: l10n.publicWorkflowSelectTitle,
                              description: l10n.publicWorkflowSelectDescription,
                            ),
                            (
                              title: l10n.publicWorkflowExecuteTitle,
                              description:
                                  l10n.publicWorkflowExecuteDescription,
                            ),
                            (
                              title: l10n.publicWorkflowDeliverTitle,
                              description:
                                  l10n.publicWorkflowDeliverDescription,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.section),
                        PublicHomeSectionIntro(
                          description: l10n.publicHomeCapabilitiesDescription,
                          eyebrow: l10n.publicCapabilitiesEyebrow,
                          title: l10n.publicHomeCapabilitiesTitle,
                        ),
                        const SizedBox(height: AppSpacing.xLarge),
                        PublicHomeCapabilities(
                          items: [
                            (
                              eyebrow: l10n.publicVideoEyebrow,
                              title: l10n.publicVideoTitle,
                              description: l10n.publicVideoDescription,
                              icon: LucideIcons.video,
                            ),
                            (
                              eyebrow: l10n.publicDocumentEyebrow,
                              title: l10n.publicDocumentTitle,
                              description: l10n.publicDocumentDescription,
                              icon: LucideIcons.fileText,
                            ),
                            (
                              eyebrow: l10n.publicAnalysisEyebrow,
                              title: l10n.publicAnalysisTitle,
                              description: l10n.publicAnalysisDescription,
                              icon: LucideIcons.sparkles,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.section),
                        PublicHomeSectionIntro(
                          description: l10n.publicTrustDescription,
                          eyebrow: l10n.publicTrustEyebrow,
                          title: l10n.publicTrustTitle,
                        ),
                        const SizedBox(height: AppSpacing.xLarge),
                        PublicHomeSafeguards(
                          items: [
                            l10n.publicSafeguardSession,
                            l10n.publicSafeguardWorkers,
                            l10n.publicSafeguardArtifacts,
                            l10n.publicSafeguardAuthorization,
                          ],
                        ),
                        const SizedBox(height: AppSpacing.section),
                        PublicHomeSectionIntro(
                          description: l10n.publicStartDescription,
                          eyebrow: l10n.publicStartEyebrow,
                          title: l10n.publicStartTitle,
                        ),
                        const SizedBox(height: AppSpacing.xLarge),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FilledButton.tonalIcon(
                            key: const Key('public-home-deployment'),
                            onPressed: () => _openExternal(
                              context,
                              PublicHomeLinks.quickStart,
                              l10n.publicExternalLinkError,
                            ),
                            icon: const Icon(LucideIcons.externalLink),
                            label: Text(l10n.publicDeploymentAction),
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
