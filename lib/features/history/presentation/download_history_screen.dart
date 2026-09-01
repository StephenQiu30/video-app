import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/presentation/download_history_item.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadHistoryScreen extends ConsumerWidget {
  const DownloadHistoryScreen({super.key});

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
        ),
      ];
    }
    final summary = data.summary;
    return [
      _DownloadHistorySummary(
        total: summary.total,
        succeeded: summary.succeeded,
        active: summary.active,
        failed: summary.failed,
      ),
      const SizedBox(height: AppSpacing.xLarge),
      SlidableAutoCloseBehavior(
        child: Column(
          children: [
            for (final (index, item) in data.items.indexed) ...[
              if (index > 0) const Divider(),
              DownloadHistoryItem(
                item: item,
                onTap: () =>
                    DownloadDetailRoute(jobId: item.id).push<void>(context),
              ),
            ],
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

final class _DownloadHistorySummary extends StatelessWidget {
  const _DownloadHistorySummary({
    required this.total,
    required this.succeeded,
    required this.active,
    required this.failed,
  });

  final int total;
  final int succeeded;
  final int active;
  final int failed;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final metrics = [
      (key: 'total', label: localizations.totalLabel, value: total),
      (key: 'succeeded', label: localizations.succeededLabel, value: succeeded),
      (key: 'active', label: localizations.activeLabel, value: active),
      (key: 'failed', label: localizations.failedLabel, value: failed),
    ];
    final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;

    return LayoutBuilder(
      builder: (context, constraints) {
        final columnCount = constraints.maxWidth >= 340 && textScale <= 1.25
            ? 4
            : 2;
        const gap = AppSpacing.xSmall;
        final width =
            (constraints.maxWidth - (columnCount - 1) * gap) / columnCount;
        return Wrap(
          spacing: gap,
          runSpacing: AppSpacing.large,
          children: [
            for (final metric in metrics)
              SizedBox(
                key: Key('download-summary-${metric.key}'),
                width: width,
                child: _CenteredDataMetric(
                  label: metric.label,
                  value: metric.value,
                ),
              ),
          ],
        );
      },
    );
  }
}

final class _CenteredDataMetric extends StatelessWidget {
  const _CenteredDataMetric({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      container: true,
      label: '$label: $value',
      child: ExcludeSemantics(
        child: Column(
          children: [
            Text(
              '$value',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
