import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class AdminStorageScreen extends ConsumerStatefulWidget {
  const AdminStorageScreen({super.key});

  @override
  ConsumerState<AdminStorageScreen> createState() => _AdminStorageScreenState();
}

final class _AdminStorageScreenState extends ConsumerState<AdminStorageScreen> {
  bool _busy = false;

  Future<void> _cleanup() async {
    final l10n = AppLocalizations.of(context);
    final days = await showModalBottomSheet<int>(
      context: context,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.adminCleanupTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.xSmall),
              Text(l10n.adminCleanupDescription),
              const SizedBox(height: AppSpacing.large),
              for (final value in const [7, 30, 90])
                TextButton(
                  onPressed: () => Navigator.pop(context, value),
                  child: Text(l10n.adminCleanupDays(value)),
                ),
            ],
          ),
        ),
      ),
    );
    if (days == null || !mounted) return;
    setState(() => _busy = true);
    try {
      final result = await ref.read(adminRepositoryProvider).cleanupFiles(days);
      ref.invalidate(adminFilesProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              l10n.adminCleanupComplete(
                result.removedResources,
                formatByteCount(result.freedBytes),
              ),
            ),
          ),
        );
      }
    } catch (_) {
      if (mounted) _showFailure(context, l10n);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = ref.watch(adminFilesProvider);
    return AdminPage(
      title: l10n.adminFilesTitle,
      description: l10n.adminFilesDescription,
      refreshLabel: l10n.refreshAction,
      onRefresh: () => ref.refresh(adminFilesProvider.future).then((_) {}),
      children: result.when(
        data: (data) => [
          Row(
            children: [
              Expanded(child: Text(l10n.adminFileCount(data.total))),
              TextButton.icon(
                onPressed: _busy ? null : _cleanup,
                icon: const Icon(LucideIcons.trash2, size: 18),
                label: Text(l10n.adminCleanupAction),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.medium),
          if (data.items.isEmpty)
            DataStateMessage(
              title: l10n.adminFilesEmpty,
              description: l10n.adminFilesEmptyDescription,
            ),
          for (final file in data.items)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    file.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: AppSpacing.xSmall),
                  Text(
                    '${file.category.name} · ${formatByteCount(file.sizeBytes)} · '
                    '${formatDataTime(context, file.createdAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
        ],
        error: (_, _) => adminError(
          action: l10n.retryAction,
          title: l10n.loadFailedTitle,
          description: l10n.loadFailedDescription,
          retry: () => ref.invalidate(adminFilesProvider),
        ),
        loading: () => adminLoading(l10n.loadingData),
      ),
    );
  }
}

void _showFailure(BuildContext context, AppLocalizations l10n) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(l10n.adminActionFailed)));
}
