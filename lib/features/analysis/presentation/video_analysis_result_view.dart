import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/presentation/video_analysis_section.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:video_server_api/video_server_api.dart';

enum _VisualResultSection { scenes, shots, highlights, assets, report }

final class VideoAnalysisResultView extends StatefulWidget {
  const VideoAnalysisResultView({
    required this.reportMarkdown,
    required this.result,
    super.key,
  });

  final String? reportMarkdown;
  final VideoAnalysisResultResponse result;

  @override
  State<VideoAnalysisResultView> createState() =>
      _VideoAnalysisResultViewState();
}

final class _VideoAnalysisResultViewState
    extends State<VideoAnalysisResultView> {
  _VisualResultSection _section = _VisualResultSection.shots;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = widget.result;
    final sections = [
      _VisualResultSection.scenes,
      _VisualResultSection.shots,
      _VisualResultSection.highlights,
      _VisualResultSection.assets,
      if (widget.reportMarkdown != null) _VisualResultSection.report,
    ];
    return Column(
      key: const Key('video-analysis-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(result.title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.xLarge),
        Wrap(
          spacing: AppSpacing.medium,
          runSpacing: AppSpacing.large,
          children: [
            _Metric(label: l10n.shotCountLabel, value: '${result.shotCount}'),
            _Metric(
              label: l10n.sceneCountLabel,
              value: '${result.scenes.length}',
            ),
            _Metric(
              label: l10n.durationLabel,
              value: formatDurationClock(result.media.durationMs ~/ 1000),
            ),
            _Metric(
              label: l10n.visualAssetCountLabel,
              value: '${result.assets.length}',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xLarge),
        Text(
          l10n.visualSummaryTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.xSmall),
        SelectableText(result.summary.text),
        const SizedBox(height: AppSpacing.large),
        Text(
          l10n.productionAdviceTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.xSmall),
        SelectableText(result.productionAdvice.summary),
        const SizedBox(height: AppSpacing.xLarge),
        DropdownButtonFormField<_VisualResultSection>(
          key: const Key('analysis-result-section'),
          initialValue: _section,
          decoration: InputDecoration(
            labelText: l10n.analysisResultSectionLabel,
          ),
          items: [
            for (final section in sections)
              DropdownMenuItem(
                value: section,
                child: Text(_sectionLabel(l10n, section)),
              ),
          ],
          onChanged: (value) {
            if (value != null) setState(() => _section = value);
          },
        ),
        const SizedBox(height: AppSpacing.medium),
        VideoAnalysisSection(
          key: ValueKey(_section),
          reportMarkdown: widget.reportMarkdown,
          result: result,
          section: _section.name,
        ),
      ],
    );
  }
}

String _sectionLabel(AppLocalizations l10n, _VisualResultSection section) =>
    switch (section) {
      _VisualResultSection.scenes => l10n.analysisScenesTab,
      _VisualResultSection.shots => l10n.analysisShotsTab,
      _VisualResultSection.highlights => l10n.analysisHighlightsTab,
      _VisualResultSection.assets => l10n.analysisAssetsTab,
      _VisualResultSection.report => l10n.analysisReportTab,
    };

final class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
