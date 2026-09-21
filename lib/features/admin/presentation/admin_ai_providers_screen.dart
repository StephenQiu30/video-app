import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_configuration_repository.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/features/admin/presentation/ai_provider_editor.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

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
        ShadSonner.of(context).show(
          ShadToast(
            description: Text(AppLocalizations.of(context).adminActionFailed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busyKey = null);
    }
  }

  Future<void> _delete(AiProviderProfileResponse item) async {
    if (!await confirmAdminDelete(context) || !mounted) return;
    setState(() => _busyKey = item.key);
    try {
      await ref.read(adminConfigurationRepositoryProvider).deleteAi(item.key);
      ref.invalidate(adminAiProvidersProvider);
    } catch (_) {
      if (mounted) {
        ShadSonner.of(context).show(
          ShadToast(
            description: Text(AppLocalizations.of(context).adminActionFailed),
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
          ShadButton.ghost(
            onPressed: () => editAiProvider(context, ref),
            leading: const Icon(PhosphorIconsRegular.plus),
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(child: Text(l10n.createAiProvider)),
          ),
          Text(
            data.agentAvailable
                ? l10n.adminAgentAvailable
                : l10n.adminAgentUnavailable,
          ),
          const SizedBox(height: AppSpacing.medium),
          for (final item in data.items)
            Padding(
              key: ValueKey('ai-${item.key}'),
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
              child: Column(
                children: [
                  Row(
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
                            const Icon(PhosphorIconsRegular.check, size: 16),
                            const SizedBox(width: 4),
                            Text(l10n.adminActiveLine),
                          ],
                        )
                      else
                        ShadButton.ghost(
                          onPressed: _busyKey == null
                              ? () => _activate(item.key)
                              : null,
                          enabled:
                              (_busyKey == null
                                  ? () => _activate(item.key)
                                  : null) !=
                              null,
                          child: _busyKey == item.key
                              ? const SizedBox.square(
                                  dimension: 18,
                                  child: AppSpinner(),
                                )
                              : Text(l10n.adminActivateAction),
                        ),
                    ],
                  ),
                  Wrap(
                    children: [
                      ShadButton.ghost(
                        onPressed: _busyKey == null
                            ? () => editAiProvider(context, ref, item)
                            : null,
                        enabled:
                            (_busyKey == null
                                ? () => editAiProvider(context, ref, item)
                                : null) !=
                            null,
                        height: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Flexible(child: Text(l10n.editAction)),
                      ),
                      if (!item.isActive && item.key != 'local-codex')
                        ShadButton.ghost(
                          onPressed: _busyKey == null
                              ? () => _delete(item)
                              : null,
                          enabled:
                              (_busyKey == null ? () => _delete(item) : null) !=
                              null,
                          height: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Flexible(child: Text(l10n.deleteAction)),
                        ),
                    ],
                  ),
                ],
              ),
            ),
        ],
        error: (error, _) => adminError(
          action: l10n.retryAction,
          title: l10n.loadFailedTitle,
          description: dataRequestFailureMessage(l10n, error),
          retry: () => ref.invalidate(adminAiProvidersProvider),
        ),
        loading: () => adminLoading(l10n.loadingData),
      ),
    );
  }
}
