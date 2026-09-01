import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/features/media/presentation/authenticated_media_cover.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/deletion_failure_message.dart';
import 'package:framegrab/shared/presentation/destructive_confirmation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadHistoryItem extends ConsumerStatefulWidget {
  const DownloadHistoryItem({
    required this.item,
    required this.onTap,
    super.key,
  });

  final DownloadHistoryItemResponse item;
  final VoidCallback onTap;

  @override
  ConsumerState<DownloadHistoryItem> createState() =>
      _DownloadHistoryItemState();
}

final class _DownloadHistoryItemState
    extends ConsumerState<DownloadHistoryItem> {
  bool _busy = false;

  Future<void> _cancel() => _run(() async {
    await ref.read(downloadHistoryRepositoryProvider).cancel(widget.item.id);
    ref.invalidate(downloadHistoryProvider);
  });

  Future<void> _retry() => _run(() async {
    final next = await ref
        .read(downloadHistoryRepositoryProvider)
        .retry(widget.item.id);
    ref.invalidate(downloadHistoryProvider);
    if (mounted) {
      await DownloadDetailRoute(jobId: next.id).push<void>(context);
    }
  });

  Future<void> _delete() async {
    final localizations = AppLocalizations.of(context);
    final confirmed = await showDestructiveConfirmation(
      context: context,
      title: localizations.deleteDownloadTitle,
      description: isActiveDownloadStatus(widget.item.status.name)
          ? localizations.deleteDownloadActiveDescription
          : localizations.deleteDownloadDescription,
      cancelLabel: localizations.keepDownloadAction,
      confirmLabel: localizations.confirmDeleteAction,
    );
    if (!confirmed || !mounted) return;
    await _run(() async {
      await ref.read(downloadHistoryRepositoryProvider).delete(widget.item.id);
      ref.invalidate(downloadHistoryProvider);
    }, failureMessage: (error) => deletionFailureMessage(localizations, error));
  }

  Future<void> _run(
    Future<void> Function() operation, {
    String Function(Object error)? failureMessage,
  }) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await operation();
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              failureMessage?.call(error) ??
                  AppLocalizations.of(context).operationFailed,
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final item = widget.item;
    final statusName = item.status.name;
    final status = downloadStatusLabel(localizations, statusName);
    final failure = item.errorCode == null
        ? null
        : downloadFailureLabel(localizations, item.errorCode!.name);
    final meta = [
      item.sourceLabel,
      item.formatName,
    ].where((value) => value.trim().isNotEmpty).join(' · ');
    final canCancel = isActiveDownloadStatus(statusName);
    final canRetry =
        statusName == 'failed' ||
        statusName == 'cancelled' ||
        (statusName == 'succeeded' && !item.fileAvailable);
    final actionCount = 2 + (canCancel || canRetry ? 1 : 0);
    final semanticActions = <CustomSemanticsAction, VoidCallback>{
      CustomSemanticsAction(label: localizations.downloadDetailNavigation):
          widget.onTap,
      if (canCancel)
        CustomSemanticsAction(label: localizations.cancelDownloadAction): () =>
            unawaited(_cancel()),
      if (canRetry)
        CustomSemanticsAction(label: localizations.retryDownloadAction): () =>
            unawaited(_retry()),
      CustomSemanticsAction(label: localizations.deleteDownloadAction): () =>
          unawaited(_delete()),
    };
    final colors = Theme.of(context).colorScheme;

    return Slidable(
      key: Key('download-history-slidable-${item.id}'),
      groupTag: 'download-history',
      enabled: !_busy,
      endActionPane: ActionPane(
        extentRatio: actionCount == 2 ? 0.44 : 0.66,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            key: Key('view-download-${item.id}'),
            onPressed: _busy ? null : (_) => widget.onTap(),
            backgroundColor: colors.surfaceContainerHigh,
            foregroundColor: colors.onSurface,
            icon: LucideIcons.eye,
            label: localizations.downloadDetailNavigation,
          ),
          if (canCancel)
            SlidableAction(
              key: Key('cancel-download-${item.id}'),
              onPressed: _busy ? null : (_) => unawaited(_cancel()),
              backgroundColor: colors.secondaryContainer,
              foregroundColor: colors.onSecondaryContainer,
              icon: LucideIcons.x,
              label: localizations.cancelDownloadAction,
            ),
          if (canRetry)
            SlidableAction(
              key: Key('retry-download-${item.id}'),
              onPressed: _busy ? null : (_) => unawaited(_retry()),
              backgroundColor: colors.secondaryContainer,
              foregroundColor: colors.onSecondaryContainer,
              icon: LucideIcons.refreshCw,
              label: localizations.retryDownloadAction,
            ),
          SlidableAction(
            key: Key('delete-download-${item.id}'),
            onPressed: _busy ? null : (_) => unawaited(_delete()),
            backgroundColor: colors.errorContainer,
            foregroundColor: colors.onErrorContainer,
            icon: LucideIcons.trash2,
            label: localizations.deleteDownloadAction,
          ),
        ],
      ),
      child: Semantics(
        container: true,
        button: true,
        label: '${item.title}, $status, ${item.progress}%',
        hint: localizations.downloadRowActionsHint,
        onTap: widget.onTap,
        customSemanticsActions: semanticActions,
        child: ExcludeSemantics(
          child: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: InkWell(
              key: Key('download-history-item-${item.id}'),
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 112,
                      child: AuthenticatedMediaCover(
                        alt: '${item.title} ${localizations.mediaCoverLabel}',
                        borderRadius: BorderRadius.circular(6),
                        pending: isActiveDownloadStatus(item.status.name),
                        source: item.thumbnailUrl,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.medium),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          if (meta.isNotEmpty) ...[
                            const SizedBox(height: AppSpacing.xSmall),
                            Text(
                              meta,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: colors.onSurfaceVariant),
                            ),
                          ],
                          const SizedBox(height: AppSpacing.small),
                          DataStatusLabel(
                            color: downloadStatusColor(context, statusName),
                            label: isActiveDownloadStatus(statusName)
                                ? '$status · ${item.progress}%'
                                : status,
                          ),
                          if (failure != null) ...[
                            const SizedBox(height: AppSpacing.xSmall),
                            Text(
                              failure,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: colors.error),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.xSmall),
                    Icon(
                      LucideIcons.chevronRight,
                      size: 18,
                      color: colors.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
