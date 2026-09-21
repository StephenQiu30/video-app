import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/presentation/account_session_section.dart';
import 'package:framegrab/features/auth/presentation/profile_editor.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_page_intro.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final isAdmin = ref.watch(
      authSessionProvider.select(
        (session) => session.user?.role.name == 'admin',
      ),
    );

    return SafeArea(
      top: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.pageHorizontal,
          AppSpacing.pageTop,
          AppSpacing.pageHorizontal,
          AppSpacing.pageBottom,
        ),
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Semantics(
                container: true,
                explicitChildNodes: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppPageIntro(
                      description: localizations.accountDescription,
                      title: localizations.accountNavigation,
                    ),
                    const SizedBox(height: AppSpacing.section),
                    _SectionLabel(label: localizations.accountSection),
                    const SizedBox(height: AppSpacing.small),
                    const AccountSessionSection(),
                    const SizedBox(height: AppSpacing.large),
                    const ProfileEditor(),
                    if (isAdmin) ...[
                      const SizedBox(height: AppSpacing.section),
                      _SectionLabel(label: localizations.adminCenterTitle),
                      const SizedBox(height: AppSpacing.small),
                      _AdminEntry(
                        onTap: () => context.push('/admin'),
                        title: localizations.adminCenterTitle,
                        description: localizations.adminCenterDescription,
                      ),
                    ],
                    const SizedBox(height: AppSpacing.section),
                    const _LogoutAction(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _LogoutAction extends ConsumerWidget {
  const _LogoutAction();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final session = ref.watch(authSessionProvider);
    if (session.user == null) {
      return const SizedBox.shrink();
    }
    return ShadButton.destructive(
      key: const Key('logout-button'),
      onPressed: session.isBusy
          ? null
          : () => unawaited(ref.read(authSessionProvider.notifier).logout()),
      leading: const Icon(PhosphorIconsRegular.signOut),
      enabled:
          (session.isBusy
              ? null
              : () => unawaited(
                  ref.read(authSessionProvider.notifier).logout(),
                )) !=
          null,
      height: 0,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Flexible(
        child: Text(
          session.phase == AuthSessionPhase.signingOut
              ? localizations.loggingOut
              : localizations.logoutAction,
        ),
      ),
    );
  }
}

final class _AdminEntry extends StatelessWidget {
  const _AdminEntry({
    required this.description,
    required this.onTap,
    required this.title,
  });

  final String description;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ShadButton.ghost(
      key: const Key('admin-center-entry'),
      onPressed: onTap,
      padding: EdgeInsets.zero,
      height: 0,
      expands: true,
      mainAxisAlignment: MainAxisAlignment.start,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
        child: Row(
          children: [
            const Icon(PhosphorIconsRegular.shieldCheck),
            const SizedBox(width: AppSpacing.medium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.xSmall),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(PhosphorIconsRegular.caretRight, size: 18),
          ],
        ),
      ),
    );
  }
}

final class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      header: true,
      label: label,
      child: ExcludeSemantics(
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
