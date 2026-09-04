import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:video_server_api/video_server_api.dart';

final class ScreenplayAnalysisResultView extends StatelessWidget {
  const ScreenplayAnalysisResultView({
    required this.reportMarkdown,
    required this.result,
    super.key,
  });

  final String? reportMarkdown;
  final ScreenplayAnalysisResultResponse result;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      key: const Key('screenplay-analysis-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataMetricGrid(
          keyPrefix: 'screenplay-analysis',
          metrics: [
            DataMetricValue(
              key: 'scenes',
              label: l10n.screenplaySceneCoverageLabel,
              value: '${result.scenes.length}',
            ),
            DataMetricValue(
              key: 'characters',
              label: l10n.screenplayMainCharactersLabel,
              value: '${result.characters.length}',
            ),
            DataMetricValue(
              key: 'language',
              label: l10n.languageLabel,
              value: result.language,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.section),
        Text(
          l10n.screenplayStoryOverview,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.large),
        _LabeledText(label: l10n.screenplayLoglineLabel, value: result.logline),
        const SizedBox(height: AppSpacing.large),
        _LabeledText(
          label: l10n.screenplaySynopsisLabel,
          value: result.synopsis,
        ),
        const SizedBox(height: AppSpacing.large),
        _LabeledText(
          label: l10n.screenplayStructuredResultTitle,
          value: result.structure.pacingSummary,
        ),
        if (_report(reportMarkdown) case final report?) ...[
          const SizedBox(height: AppSpacing.section),
          Text(
            l10n.screenplayFullReportTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.large),
          AnalysisReportPreview(markdown: report),
        ],
      ],
    );
  }
}

final class ScreenplayRewriteResultView extends StatelessWidget {
  const ScreenplayRewriteResultView({
    required this.reportMarkdown,
    required this.result,
    super.key,
  });

  final String? reportMarkdown;
  final ScreenplayRewriteResultResponse result;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      key: const Key('screenplay-rewrite-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataMetricGrid(
          keyPrefix: 'screenplay-rewrite',
          metrics: [
            DataMetricValue(
              key: 'source-scenes',
              label: l10n.screenplaySourceScenesLabel,
              value: '${result.sourceSceneCount}',
            ),
            DataMetricValue(
              key: 'output-scenes',
              label: l10n.screenplayOutputScenesLabel,
              value: '${result.outputSceneCount}',
            ),
            DataMetricValue(
              key: 'language',
              label: l10n.languageLabel,
              value: '${result.sourceLanguage} → ${result.targetLanguage}',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.section),
        Text(
          l10n.screenplayGlossaryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.medium),
        for (final term in result.glossary)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.small),
            child: SelectableText(
              '${term.source_} → ${term.target} · ${term.category}',
            ),
          ),
        const SizedBox(height: AppSpacing.xLarge),
        Text(
          l10n.screenplayRewriteSummaryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.medium),
        for (final summary in result.changeSummary)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.small),
            child: SelectableText('• $summary'),
          ),
        if (_report(reportMarkdown) case final report?) ...[
          const SizedBox(height: AppSpacing.section),
          Text(
            l10n.screenplayFullReportTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: AppSpacing.large),
          AnalysisReportPreview(markdown: report),
        ],
      ],
    );
  }
}

final class _LabeledText extends StatelessWidget {
  const _LabeledText({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: Theme.of(context).textTheme.labelMedium),
      const SizedBox(height: AppSpacing.xSmall),
      SelectableText(value, style: Theme.of(context).textTheme.bodyLarge),
    ],
  );
}

String? _report(String? value) {
  final normalized = value?.trim();
  return normalized == null || normalized.isEmpty ? null : normalized;
}
