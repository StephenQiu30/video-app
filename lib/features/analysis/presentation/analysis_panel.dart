import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/application/analysis_controller.dart';
import 'package:framegrab/features/analysis/application/analysis_state.dart';
import 'package:framegrab/features/analysis/application/analysis_target.dart';
import 'package:framegrab/features/analysis/presentation/analysis_configurator.dart';
import 'package:framegrab/features/analysis/presentation/analysis_job_state.dart';
import 'package:framegrab/features/analysis/presentation/analysis_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class AnalysisPanel extends ConsumerWidget {
  AnalysisPanel({required String downloadId, super.key})
    : target = AnalysisTarget.video(downloadId);

  AnalysisPanel.screenplay({required String documentId, super.key})
    : target = AnalysisTarget.screenplay(documentId);

  final AnalysisTarget target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final result = ref.watch(analysisControllerProvider(target));
    final controller = ref.read(analysisControllerProvider(target).notifier);
    final title = target.isScreenplay
        ? l10n.screenplayAnalysisTitle
        : l10n.aiAnalysisTitle;
    final description = target.isScreenplay
        ? l10n.screenplayAnalysisDescription
        : l10n.aiAnalysisDescription;
    return Semantics(
      container: true,
      explicitChildNodes: true,
      label: title,
      child: Column(
        key: const Key('analysis-panel'),
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: AppSpacing.small),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xLarge),
          result.when(
            data: (state) => _content(context, state, controller),
            error: (_, _) => DataStateMessage(
              icon: LucideIcons.cloudOff,
              title: l10n.analysisLoadFailed,
              description: l10n.analysisServiceUnavailable,
              actionLabel: l10n.retryAction,
              onAction: () =>
                  ref.invalidate(analysisControllerProvider(target)),
            ),
            loading: () => Semantics(
              liveRegion: true,
              label: l10n.loadingData,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(
    BuildContext context,
    AnalysisState state,
    AnalysisController controller,
  ) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state.actionError case final error?) ...[
          Text(
            analysisFailureMessage(
              l10n,
              error,
              isScreenplay: target.isScreenplay,
            ),
            key: const Key('analysis-action-error'),
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: AppSpacing.medium),
        ],
        if (state.job case final job?)
          AnalysisJobState(
            action: state.action,
            isScreenplay: target.isScreenplay,
            job: job,
            onCancel: controller.cancel,
            onDelete: controller.delete,
            onRefresh: controller.refresh,
            onRetry: controller.retry,
          )
        else
          AnalysisConfigurator(
            busy: state.action == AnalysisAction.start,
            skills: state.skills,
            onStart: controller.start,
          ),
      ],
    );
  }
}
