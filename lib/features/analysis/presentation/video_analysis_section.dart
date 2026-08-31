import 'dart:math';

import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/presentation/analysis_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:video_server_api/video_server_api.dart';

final class VideoAnalysisSection extends StatefulWidget {
  const VideoAnalysisSection({
    required this.reportMarkdown,
    required this.result,
    required this.section,
    super.key,
  });

  final String? reportMarkdown;
  final VideoAnalysisResultResponse result;
  final String section;

  @override
  State<VideoAnalysisSection> createState() => _VideoAnalysisSectionState();
}

final class _VideoAnalysisSectionState extends State<VideoAnalysisSection> {
  static const _pageSize = 20;
  var _visibleCount = _pageSize;

  @override
  Widget build(BuildContext context) {
    final total = switch (widget.section) {
      'scenes' => widget.result.scenes.length,
      'shots' => widget.result.shots.length,
      'highlights' => widget.result.highlights.length,
      'assets' => widget.result.assets.length,
      'report' => widget.reportMarkdown == null ? 0 : 1,
      _ => 0,
    };
    final limit = min(_visibleCount, total);
    final children = switch (widget.section) {
      'scenes' => [
        for (final item in widget.result.scenes.take(limit)) _scene(item),
      ],
      'shots' => [
        for (final item in widget.result.shots.take(limit)) _shot(item),
      ],
      'highlights' => [
        for (final item in widget.result.highlights.take(limit))
          _highlight(context, item),
      ],
      'assets' => [
        for (final item in widget.result.assets.take(limit))
          _asset(context, item),
      ],
      'report' => [
        if (widget.reportMarkdown case final value?) SelectableText(value),
      ],
      _ => const <Widget>[],
    };
    if (children.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
        child: Text(AppLocalizations.of(context).analysisEmptySection),
      );
    }
    return Column(
      key: Key('analysis-section-${widget.section}'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, child) in children.indexed) ...[
          if (index > 0) const Divider(),
          child,
        ],
        if (limit < total)
          TextButton(
            key: const Key('load-more-analysis-results'),
            onPressed: () => setState(() => _visibleCount += _pageSize),
            child: Text(
              AppLocalizations.of(
                context,
              ).loadMoreAnalysisResults(total - limit),
            ),
          ),
      ],
    );
  }

  Widget _scene(VideoSceneResponse item) => _ResultItem(
    eyebrow: _timeRange(item.startMs, item.endMs),
    title: '${item.index}. ${item.title}',
    body: '${item.description}\n${item.narrativeFunction}',
    footer: item.location,
  );

  Widget _shot(ShotResponse item) => _ResultItem(
    eyebrow: _timeRange(item.startMs, item.endMs),
    title: '${item.index}. ${item.shotSize} · ${item.cameraMotion}',
    body: item.description,
    footer: item.visualTags.join(' · '),
  );

  Widget _highlight(BuildContext context, HighlightResponse item) {
    final l10n = AppLocalizations.of(context);
    return _ResultItem(
      eyebrow: _timeRange(item.startMs, item.endMs),
      title: item.title,
      body: '${item.description}\n${item.reason}',
      footer: '${l10n.highlightScoreLabel} ${item.score}',
    );
  }

  Widget _asset(BuildContext context, VisualAssetResponse item) {
    final l10n = AppLocalizations.of(context);
    return _ResultItem(
      eyebrow: analysisAssetTypeLabel(l10n, item.type),
      title: item.label,
      body: item.description,
      footer: formatDurationClock(item.firstSeenMs ~/ 1000),
    );
  }
}

final class _ResultItem extends StatelessWidget {
  const _ResultItem({
    required this.body,
    required this.eyebrow,
    required this.footer,
    required this.title,
  });

  final String body;
  final String eyebrow;
  final String footer;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eyebrow,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xSmall),
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xSmall),
          SelectableText(body),
          if (footer.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xSmall),
            Text(
              footer,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

String _timeRange(int startMs, int endMs) =>
    '${formatDurationClock(startMs ~/ 1000)}–'
    '${formatDurationClock(endMs ~/ 1000)}';
