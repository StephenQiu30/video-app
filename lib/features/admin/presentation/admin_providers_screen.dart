import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_configuration_repository.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/features/admin/presentation/catalog_editor.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/list_filters.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
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
  ListQuery _query = const ListQuery();

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

  Future<void> _delete(ProviderCatalogEntryResponse item) async {
    if (!await confirmAdminDelete(context) || !mounted) return;
    setState(() => _busy.add(item.key));
    try {
      await ref
          .read(adminConfigurationRepositoryProvider)
          .deleteCatalog(item.key);
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
      children: [
        ListFilters(
          query: _query,
          searchLabel: l10n.searchPlatforms,
          statuses: {
            'visible': l10n.visiblePlatform,
            'hidden': l10n.hiddenPlatform,
          },
          onSearch: (v) => setState(
            () => _query = ListQuery(search: v, status: _query.status),
          ),
          onStatus: (v) => setState(
            () => _query = ListQuery(search: _query.search, status: v),
          ),
        ),
        ...result.when(
          data: (data) => [
            TextButton.icon(
              onPressed: () => editCatalog(context, ref),
              icon: const Icon(Icons.add),
              label: Text(l10n.createPlatform),
            ),
            for (final item in data.items.where(
              (item) =>
                  ('${item.key} ${item.displayName}').toLowerCase().contains(
                    _query.search.toLowerCase(),
                  ) &&
                  (_query.status == null ||
                      item.isVisible == (_query.status == 'visible')),
            ))
              Padding(
                key: ValueKey('catalog-${item.key}'),
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
                child: Column(
                  children: [
                    SwitchListTile(
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
                    Wrap(
                      children: [
                        TextButton(
                          onPressed: () => editCatalog(context, ref, item),
                          child: Text(l10n.editAction),
                        ),
                        if (!item.systemRegistered)
                          TextButton(
                            onPressed: _busy.contains(item.key)
                                ? null
                                : () => _delete(item),
                            child: Text(l10n.deleteAction),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
          error: (_, _) => adminError(
            action: l10n.retryAction,
            title: l10n.loadFailedTitle,
            description: l10n.loadFailedDescription,
            retry: () => ref.invalidate(adminProviderCatalogProvider),
          ),
          loading: () => adminLoading(l10n.loadingData),
        ),
      ],
    );
  }
}
