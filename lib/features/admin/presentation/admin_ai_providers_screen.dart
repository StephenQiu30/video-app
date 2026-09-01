import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class AdminAiProvidersScreen extends ConsumerStatefulWidget {
  const AdminAiProvidersScreen({super.key});

  @override
  ConsumerState<AdminAiProvidersScreen> createState() =>
      _AdminAiProvidersScreenState();
}

final class _AdminAiProvidersScreenState
    extends ConsumerState<AdminAiProvidersScreen> {
  String? _busyKey;

  Future<void> _activate(String key) async {
    setState(() => _busyKey = key);
    try {
      await ref.read(adminRepositoryProvider).activateAiProvider(key);
      ref.invalidate(adminAiProvidersProvider);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).adminActionFailed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busyKey = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = ref.watch(adminAiProvidersProvider);
    return AdminPage(
      title: l10n.adminAiProvidersTitle,
      description: l10n.adminAiProvidersDescription,
      refreshLabel: l10n.refreshAction,
      onRefresh: () =>
          ref.refresh(adminAiProvidersProvider.future).then((_) {}),
      children: result.when(
        data: (data) => [
          Text(
            data.agentAvailable
                ? l10n.adminAgentAvailable
                : l10n.adminAgentUnavailable,
          ),
          const SizedBox(height: AppSpacing.medium),
          for (final item in data.items)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.displayName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppSpacing.xSmall),
                        Text(
                          '${item.engine.name} · ${item.model} · '
                          '${item.credentialConfigured ? l10n.adminCredentialReady : l10n.adminCredentialMissing}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.small),
                  if (item.isActive)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(LucideIcons.check, size: 16),
                        const SizedBox(width: 4),
                        Text(l10n.adminActiveLine),
                      ],
                    )
                  else
                    TextButton(
                      onPressed: _busyKey == null
                          ? () => _activate(item.key)
                          : null,
                      child: _busyKey == item.key
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(l10n.adminActivateAction),
                    ),
                ],
              ),
            ),
        ],
        error: (_, _) => adminError(
          action: l10n.retryAction,
          title: l10n.loadFailedTitle,
          description: l10n.loadFailedDescription,
          retry: () => ref.invalidate(adminAiProvidersProvider),
        ),
        loading: () => adminLoading(l10n.loadingData),
      ),
    );
  }
}
