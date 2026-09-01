import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/presentation/download_history_item.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/swipe_action_hint.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadHistoryScreen extends ConsumerWidget {
  const DownloadHistoryScreen({this.onCreateDownload, super.key});

  final VoidCallback? onCreateDownload;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final result = ref.watch(downloadHistoryProvider);
    return DataPageView(
      title: localizations.downloadHistoryNavigation,
      description: localizations.downloadHistoryDescription,
      refreshLabel: localizations.refreshAction,
      onRefresh: () => ref.refresh(downloadHistoryProvider.future).then((_) {}),
      children: result.when(
        data: (data) => _content(context, data),
        error: (_, _) => [
          DataStateMessage(
            icon: LucideIcons.cloudOff,
            title: localizations.loadFailedTitle,
            description: localizations.loadFailedDescription,
            actionLabel: localizations.retryAction,
            onAction: () => ref.invalidate(downloadHistoryProvider),
          ),
        ],
        loading: () => [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Center(child: CircularProgressIndicator()),
          ),
          Center(child: Text(localizations.loadingData)),
        ],
      ),
    );
  }

  List<Widget> _content(BuildContext context, DownloadHistoryResponse data) {
    final localizations = AppLocalizations.of(context);
    if (data.items.isEmpty) {
      return [
        DataStateMessage(
          title: localizations.downloadHistoryEmptyTitle,
          description: localizations.downloadHistoryEmptyDescription,
          actionLabel: onCreateDownload == null
              ? null
              : localizations.createDownloadFromHomeAction,
          actionIcon: LucideIcons.chevronRight,
          onAction: onCreateDownload,
        ),
      ];
    }
    final summary = data.summary;
    return [
      DataMetricGrid(
        keyPrefix: 'download-summary',
        metrics: [
          DataMetricValue(
            key: 'total',
            label: localizations.totalLabel,
            value: '${summary.total}',
          ),
          DataMetricValue(
            key: 'succeeded',
            label: localizations.succeededLabel,
            value: '${summary.succeeded}',
          ),
          DataMetricValue(
            key: 'active',
            label: localizations.activeLabel,
            value: '${summary.active}',
          ),
          DataMetricValue(
            key: 'failed',
            label: localizations.failedLabel,
            value: '${summary.failed}',
          ),
        ],
      ),
      const SizedBox(height: AppSpacing.xLarge),
      SwipeActionHint(label: localizations.downloadRowActionsHint),
      const SizedBox(height: AppSpacing.small),
      SlidableAutoCloseBehavior(
        child: Column(
          children: [
            for (final item in data.items)
              DownloadHistoryItem(
                item: item,
                onTap: () =>
                    DownloadDetailRoute(jobId: item.id).push<void>(context),
              ),
          ],
        ),
      ),
      if (data.total > data.items.length) ...[
        const SizedBox(height: AppSpacing.large),
        Text(
          localizations.showingFirstPage,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    ];
  }
}
