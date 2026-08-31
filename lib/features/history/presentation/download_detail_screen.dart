import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/download/presentation/download_app_bar.dart';
import 'package:framegrab/features/history/application/download_detail_provider.dart';
import 'package:framegrab/features/history/presentation/download_detail_content.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class DownloadDetailScreen extends ConsumerWidget {
  const DownloadDetailScreen({required this.jobId, super.key});

  final String jobId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final result = ref.watch(downloadDetailProvider(jobId));
    return Scaffold(
      appBar: const DownloadAppBar(backFallbackLocation: '/'),
      body: result.when(
        skipLoadingOnRefresh: true,
        data: (job) => DataPageView(
          title: _title(job.title, job.sourceLabel),
          description:
              '${job.sourceLabel} · ${downloadFormatLabel(localizations, job.format)}',
          refreshLabel: localizations.refreshAction,
          onRefresh: () =>
              ref.refresh(downloadDetailProvider(jobId).future).then((_) {}),
          children: [DownloadDetailContent(job: job)],
        ),
        error: (_, _) => DataPageView(
          title: localizations.downloadDetailNavigation,
          description: localizations.downloadDetailDescription,
          refreshLabel: localizations.refreshAction,
          onRefresh: () =>
              ref.refresh(downloadDetailProvider(jobId).future).then((_) {}),
          children: [
            DataStateMessage(
              icon: LucideIcons.cloudOff,
              title: localizations.loadFailedTitle,
              description: localizations.loadFailedDescription,
              actionLabel: localizations.retryAction,
              onAction: () => ref.invalidate(downloadDetailProvider(jobId)),
            ),
          ],
        ),
        loading: () => DataPageView(
          title: localizations.downloadDetailNavigation,
          description: localizations.downloadDetailDescription,
          refreshLabel: localizations.refreshAction,
          onRefresh: () =>
              ref.refresh(downloadDetailProvider(jobId).future).then((_) {}),
          children: const [DownloadDetailSkeleton()],
        ),
      ),
    );
  }
}

String _title(String? title, String fallback) {
  final normalized = title?.trim();
  return normalized == null || normalized.isEmpty ? fallback : normalized;
}
