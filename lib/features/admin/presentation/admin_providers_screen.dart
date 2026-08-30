import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

final class AdminProvidersScreen extends ConsumerStatefulWidget {
  const AdminProvidersScreen({super.key});

  @override
  ConsumerState<AdminProvidersScreen> createState() =>
      _AdminProvidersScreenState();
}

final class _AdminProvidersScreenState
    extends ConsumerState<AdminProvidersScreen> {
  final Set<String> _busy = {};

  Future<void> _toggle(ProviderCatalogEntryResponse item, bool value) async {
    setState(() => _busy.add(item.key));
    try {
      await ref
          .read(adminRepositoryProvider)
          .updateProviderVisibility(item, value);
      ref.invalidate(adminProviderCatalogProvider);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).adminActionFailed),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busy.remove(item.key));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = ref.watch(adminProviderCatalogProvider);
    return AdminPage(
      title: l10n.adminProvidersTitle,
      description: l10n.adminProvidersDescription,
      refreshLabel: l10n.refreshAction,
      onRefresh: () =>
          ref.refresh(adminProviderCatalogProvider.future).then((_) {}),
      children: result.when(
        data: (data) => [
          for (final (index, item) in data.items.indexed) ...[
            if (index > 0) const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(item.displayName),
                subtitle: Text(
                  '${item.key} · ${item.systemStatus.name} · '
                  '${item.systemRegistered ? l10n.adminSystemRegistered : l10n.adminSystemMissing}',
                ),
                value: item.isVisible,
                onChanged: _busy.contains(item.key)
                    ? null
                    : (value) => _toggle(item, value),
              ),
            ),
          ],
        ],
        error: (_, _) => adminError(
          action: l10n.retryAction,
          title: l10n.loadFailedTitle,
          description: l10n.loadFailedDescription,
          retry: () => ref.invalidate(adminProviderCatalogProvider),
        ),
        loading: () => adminLoading(l10n.loadingData),
      ),
    );
  }
}
