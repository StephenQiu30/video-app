import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/presentation/admin_page.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';

final class AdminAnalyticsScreen extends ConsumerStatefulWidget {
  const AdminAnalyticsScreen({super.key});

  @override
  ConsumerState<AdminAnalyticsScreen> createState() =>
      _AdminAnalyticsScreenState();
}

final class _AdminAnalyticsScreenState
    extends ConsumerState<AdminAnalyticsScreen> {
  int _days = 30;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = ref.watch(adminAnalyticsProvider(_days));
    return AdminPage(
      title: l10n.adminAnalyticsTitle,
      description: l10n.adminAnalyticsDescription,
      refreshLabel: l10n.refreshAction,
      onRefresh: () =>
          ref.refresh(adminAnalyticsProvider(_days).future).then((_) {}),
      children: result.when(
        data: (data) {
          final summary = data.summary;
          return [
            Wrap(
              spacing: AppSpacing.xSmall,
              children: [
                for (final days in const [7, 30, 90])
                  TextButton(
                    onPressed: () => setState(() => _days = days),
                    child: Text(
                      l10n.adminDays(days),
                      style: TextStyle(
                        fontWeight: _days == days
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.large),
            DataMetricGrid(
              keyPrefix: 'admin-analytics-summary',
              metrics: [
                DataMetricValue(
                  key: 'total',
                  label: l10n.totalLabel,
                  value: '${summary.total}',
                ),
                DataMetricValue(
                  key: 'succeeded',
                  label: l10n.succeededLabel,
                  value: '${summary.succeeded}',
                ),
                DataMetricValue(
                  key: 'failed',
                  label: l10n.failedLabel,
                  value: '${summary.failed}',
                ),
                DataMetricValue(
                  key: 'active',
                  label: l10n.activeLabel,
                  value: '${summary.active}',
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xLarge),
            Text(
              '${l10n.adminSuccessRate} ${summary.successRate.toStringAsFixed(1)}% · '
              '${l10n.adminDownloadedBytes} ${formatByteCount(summary.downloadedBytes)}',
            ),
            const SizedBox(height: AppSpacing.section),
            Text(
              l10n.adminSourceBreakdown,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            for (final source in data.sources) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
                child: Row(
                  children: [
                    Expanded(child: Text(source.sourceName)),
                    Text('${source.succeeded}/${source.total}'),
                  ],
                ),
              ),
            ],
          ];
        },
        error: (_, _) => adminError(
          action: l10n.retryAction,
          title: l10n.loadFailedTitle,
          description: l10n.loadFailedDescription,
          retry: () => ref.invalidate(adminAnalyticsProvider(_days)),
        ),
        loading: () => adminLoading(l10n.loadingData),
      ),
    );
  }
}
