import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/presentation/analysis_panel.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/features/history/presentation/download_task_actions.dart';
import 'package:framegrab/features/media/presentation/download_video_panel.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadDetailContent extends StatelessWidget {
  const DownloadDetailContent({required this.job, super.key});

  final DownloadResponse job;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final status = downloadStatusLabel(localizations, job.status.name);
    final failure = job.errorCode == null
        ? null
        : downloadFailureLabel(localizations, job.errorCode!.name);
    return Column(
      key: const Key('download-detail-content'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DownloadVideoPanel(job: job),
        const SizedBox(height: AppSpacing.section),
        Row(
          children: [
            Expanded(
              child: DataStatusLabel(
                color: downloadStatusColor(context, job.status.name),
                label: status,
              ),
            ),
            Text(
              '${job.progress}%',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        if (isActiveDownloadStatus(job.status.name)) ...[
          const SizedBox(height: AppSpacing.small),
          LinearProgressIndicator(value: job.progress / 100),
        ],
        if (failure != null) ...[
          const SizedBox(height: AppSpacing.medium),
          Text(
            failure,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
        const SizedBox(height: AppSpacing.large),
        DownloadTaskActions(job: job),
        const SizedBox(height: AppSpacing.xLarge),
        _DetailLine(label: localizations.sourceLabel, value: _source(job)),
        _DetailLine(
          label: localizations.formatLabel,
          value: downloadFormatLabel(localizations, job.format),
        ),
        if (job.stage case final stage?)
          _DetailLine(
            label: localizations.stageLabel,
            value: downloadStageLabel(localizations, stage.name),
          ),
        _DetailLine(label: localizations.attemptLabel, value: '${job.attempt}'),
        _DetailLine(
          label: localizations.fileAvailabilityLabel,
          value: job.fileAvailable
              ? localizations.fileAvailable
              : localizations.fileCleared,
        ),
        if (job.durationSeconds case final duration?)
          _DetailLine(
            label: localizations.durationLabel,
            value: formatDurationClock(duration),
          ),
        _DetailLine(
          label: localizations.createdAtLabel,
          value: formatDataTime(context, job.createdAt),
        ),
        _DetailLine(
          label: localizations.updatedAtLabel,
          value: formatDataTime(context, job.updatedAt),
        ),
        if (job.finishedAt case final finished?)
          _DetailLine(
            label: localizations.finishedAtLabel,
            value: formatDataTime(context, finished),
          ),
        if (job.status == DownloadStatus.succeeded) ...[
          const SizedBox(height: AppSpacing.section),
          AnalysisPanel(downloadId: job.id),
        ],
      ],
    );
  }
}

final class DownloadDetailSkeleton extends StatelessWidget {
  const DownloadDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;
    return Semantics(
      liveRegion: true,
      label: AppLocalizations.of(context).loadingData,
      child: ExcludeSemantics(
        child: Column(
          key: const Key('download-detail-skeleton'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 112, height: 18, color: color),
            const SizedBox(height: AppSpacing.xLarge),
            for (var index = 0; index < 6; index += 1) ...[
              const SizedBox(height: AppSpacing.large),
              Container(
                width: index.isEven ? 240 : 180,
                height: 14,
                color: color,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

final class _DetailLine extends StatelessWidget {
  const _DetailLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          SelectableText(value, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

String _source(DownloadResponse job) {
  final extractor = job.extractorKey?.trim();
  if (extractor == null ||
      extractor.isEmpty ||
      extractor.toLowerCase() == job.sourceLabel.toLowerCase()) {
    return job.sourceLabel;
  }
  return '${job.sourceLabel} · $extractor';
}
