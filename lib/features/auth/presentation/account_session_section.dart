import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/presentation/auth_error_text.dart';
import 'package:framegrab/features/auth/presentation/auth_failure_message.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class AccountSessionSection extends ConsumerWidget {
  const AccountSessionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final session = ref.watch(authSessionProvider);
    if (session.phase == AuthSessionPhase.restoring) {
      return Semantics(
        liveRegion: true,
        child: Row(
          children: [
            const SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: AppSpacing.small),
            Expanded(child: Text(localizations.sessionRestoring)),
          ],
        ),
      );
    }
    final user = session.user;
    if (user != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            localizations.signedInAs,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          Text(user.username, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.xSmall),
          Text(
            user.email,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.medium),
          TextButton.icon(
            key: const Key('logout-button'),
            onPressed: session.isBusy
                ? null
                : () => unawaited(
                    ref.read(authSessionProvider.notifier).logout(),
                  ),
            icon: const Icon(LucideIcons.logOut),
            label: Text(
              session.phase == AuthSessionPhase.signingOut
                  ? localizations.loggingOut
                  : localizations.logoutAction,
            ),
          ),
        ],
      );
    }
    final failure = session.failure;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          localizations.signedOutTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.xSmall),
        Text(
          localizations.signedOutDescription,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        if (failure != null) ...[
          const SizedBox(height: AppSpacing.medium),
          AuthErrorText(message: authFailureMessage(localizations, failure)),
        ],
        const SizedBox(height: AppSpacing.medium),
        FilledButton(
          key: const Key('account-login-button'),
          onPressed: () => context.push('/auth/login'),
          child: Text(localizations.loginAction),
        ),
        const SizedBox(height: AppSpacing.xSmall),
        TextButton(
          key: const Key('account-register-button'),
          onPressed: () => context.push('/auth/register'),
          child: Text(localizations.registerAction),
        ),
      ],
    );
  }
}
