import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/application/analysis_state.dart';
import 'package:framegrab/features/analysis/presentation/analysis_docx_button.dart';
import 'package:framegrab/features/analysis/presentation/analysis_presentation_labels.dart';
import 'package:framegrab/features/analysis/presentation/analysis_result_view.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class AnalysisJobState extends StatelessWidget {
  const AnalysisJobState({
    required this.action,
    required this.isScreenplay,
    required this.job,
    required this.onCancel,
    required this.onDelete,
    required this.onRefresh,
    required this.onRetry,
    super.key,
  });

  final AnalysisAction action;
  final bool isScreenplay;
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
      job.status == AnalysisStatus.succeeded ||
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
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: AppSpacing.xSmall,
          spacing: AppSpacing.large,
          children: [
            DataStatusLabel(
              color: analysisStatusColor(context, job.status),
              label: analysisStatusLabel(l10n, job.status),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShadTooltip(
                  builder: (context) => Text(l10n.refreshAnalysisAction),
                  child: Semantics(
                    label: l10n.refreshAnalysisAction,
                    child: ShadIconButton.ghost(
                      key: const Key('refresh-analysis-button'),
                      onPressed: busy ? null : onRefresh,
                      icon: const Icon(
                        PhosphorIconsRegular.arrowClockwise,
                        size: 18,
                      ),
                      enabled: (busy ? null : onRefresh) != null,
                    ),
                  ),
                ),
                Text('${job.progress}%'),
              ],
            ),
          ],
        ),
        if (_active) ...[
          const SizedBox(height: AppSpacing.xSmall),
          Semantics(
            label: l10n.analysisProgressSemantics(job.progress),
            child: ShadProgress(value: job.progress / 100),
          ),
        ],
        const SizedBox(height: AppSpacing.small),
        Text(
          _active
              ? '${l10n.analysisRunSummary(job.runNo, job.attempt)} · '
                    '${analysisStageLabel(l10n, job.stage)}'
              : l10n.analysisRunSummary(job.runNo, job.attempt),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        if (job.status == AnalysisStatus.failed) ...[
          const SizedBox(height: AppSpacing.medium),
          Text(
            analysisFailureMessage(
              l10n,
              job.errorCode,
              isScreenplay: isScreenplay,
            ),
            key: const Key('analysis-failure-message'),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
        const SizedBox(height: AppSpacing.large),
        Wrap(
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.small,
          children: [
            if (job.report?.status == 'available' &&
                (job.report?.artifacts.any((a) => a.format == 'docx') ?? false))
              AnalysisDocxButton(analysisId: job.id),
            if (_active)
              ShadButton.secondary(
                key: const Key('cancel-analysis-button'),
                onPressed: busy ? null : () => _confirmCancel(context),
                leading: const Icon(PhosphorIconsRegular.x, size: 18),
                enabled: (busy ? null : () => _confirmCancel(context)) != null,
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Flexible(child: Text(l10n.cancelAnalysisAction)),
              ),
            if (_retryable)
              ShadButton(
                key: const Key('retry-analysis-button'),
                onPressed: busy ? null : onRetry,
                leading: const Icon(
                  PhosphorIconsRegular.arrowCounterClockwise,
                  size: 18,
                ),
                enabled: (busy ? null : onRetry) != null,
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Flexible(
                  child: Text(
                    action == AnalysisAction.retry
                        ? l10n.retryingAnalysis
                        : l10n.retryAnalysisAction,
                  ),
                ),
              ),
            ShadButton.destructive(
              key: const Key('delete-analysis-button'),
              onPressed: busy ? null : () => _confirmDelete(context),
              leading: const Icon(PhosphorIconsRegular.trash, size: 18),
              enabled: (busy ? null : () => _confirmDelete(context)) != null,
              height: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Flexible(
                child: Text(
                  action == AnalysisAction.delete
                      ? l10n.deletingAnalysis
                      : l10n.deleteAnalysisAction,
                ),
              ),
            ),
          ],
        ),
        if (job.result != null) ...[
          if (job.status != AnalysisStatus.succeeded)
            Text(l10n.previousAnalysisResult),
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
    await showShadDialog<bool>(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: Text(title),
        actions: [
          ShadButton.ghost(
            onPressed: () => Navigator.pop(context, false),
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(
              child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
            ),
          ),
          ShadButton(
            onPressed: () => Navigator.pop(context, true),
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(child: Text(action)),
          ),
        ],
        description: Text(description),
      ),
    ) ??
    false;
