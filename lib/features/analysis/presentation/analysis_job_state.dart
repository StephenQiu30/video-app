import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/application/analysis_state.dart';
import 'package:framegrab/features/analysis/presentation/analysis_presentation_labels.dart';
import 'package:framegrab/features/analysis/presentation/analysis_result_view.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class AnalysisJobState extends StatelessWidget {
  const AnalysisJobState({
    required this.action,
    required this.job,
    required this.onCancel,
    required this.onDelete,
    required this.onRefresh,
    required this.onRetry,
    super.key,
  });

  final AnalysisAction action;
  final AnalysisResponse job;
  final Future<void> Function() onCancel;
  final Future<void> Function() onDelete;
  final Future<void> Function() onRefresh;
  final Future<void> Function() onRetry;

  bool get _active =>
      job.status == AnalysisStatus.queued ||
      job.status == AnalysisStatus.running ||
      job.status == AnalysisStatus.retryWait;

  bool get _retryable =>
      job.status == AnalysisStatus.failed ||
      job.status == AnalysisStatus.cancelled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final busy = action != AnalysisAction.idle;
    return Column(
      key: const Key('analysis-job-state'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: DataStatusLabel(
                color: analysisStatusColor(context, job.status),
                label: analysisStatusLabel(l10n, job.status),
              ),
            ),
            IconButton(
              key: const Key('refresh-analysis-button'),
              tooltip: l10n.refreshAnalysisAction,
              onPressed: busy ? null : onRefresh,
              icon: const Icon(LucideIcons.refreshCw, size: 18),
            ),
            Text('${job.progress}%'),
          ],
        ),
        if (_active) ...[
          const SizedBox(height: AppSpacing.xSmall),
          Semantics(
            label: l10n.analysisProgressSemantics(job.progress),
            child: LinearProgressIndicator(value: job.progress / 100),
          ),
        ],
        const SizedBox(height: AppSpacing.small),
        Text(
          '${l10n.analysisRunSummary(job.runNo, job.attempt)} · '
          '${analysisStageLabel(l10n, job.stage)}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        if (job.status == AnalysisStatus.failed) ...[
          const SizedBox(height: AppSpacing.medium),
          Text(
            analysisFailureMessage(l10n, job.errorCode),
            key: const Key('analysis-failure-message'),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
        const SizedBox(height: AppSpacing.large),
        Wrap(
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.small,
          children: [
            if (_active)
              OutlinedButton.icon(
                key: const Key('cancel-analysis-button'),
                onPressed: busy ? null : () => _confirmCancel(context),
                icon: const Icon(LucideIcons.x, size: 18),
                label: Text(l10n.cancelAnalysisAction),
              ),
            if (_retryable)
              FilledButton.icon(
                key: const Key('retry-analysis-button'),
                onPressed: busy ? null : onRetry,
                icon: const Icon(LucideIcons.rotateCcw, size: 18),
                label: Text(
                  action == AnalysisAction.retry
                      ? l10n.retryingAnalysis
                      : l10n.retryAnalysisAction,
                ),
              ),
            OutlinedButton.icon(
              key: const Key('delete-analysis-button'),
              onPressed: busy ? null : () => _confirmDelete(context),
              icon: const Icon(LucideIcons.trash2, size: 18),
              label: Text(
                action == AnalysisAction.delete
                    ? l10n.deletingAnalysis
                    : l10n.deleteAnalysisAction,
              ),
            ),
          ],
        ),
        if (job.status == AnalysisStatus.succeeded) ...[
          const SizedBox(height: AppSpacing.section),
          AnalysisResultView(job: job),
        ],
      ],
    );
  }

  Future<void> _confirmCancel(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await _confirm(
      context,
      action: l10n.confirmCancelAnalysis,
      description: l10n.cancelAnalysisDescription,
      title: l10n.cancelAnalysisTitle,
    );
    if (confirmed) await onCancel();
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await _confirm(
      context,
      action: l10n.confirmDeleteAnalysis,
      description: l10n.deleteAnalysisDescription,
      title: l10n.deleteAnalysisTitle,
    );
    if (confirmed) await onDelete();
  }
}

Future<bool> _confirm(
  BuildContext context, {
  required String action,
  required String description,
  required String title,
}) async =>
    await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(action),
          ),
        ],
      ),
    ) ??
    false;
