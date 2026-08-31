import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:video_server_api/video_server_api.dart';

final class VideoArticleResultView extends StatelessWidget {
  const VideoArticleResultView({
    required this.reportMarkdown,
    required this.result,
    super.key,
  });

  final String? reportMarkdown;
  final VideoArticleResultResponse result;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      key: const Key('video-article-result'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(result.title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.medium),
        SelectableText(result.lead),
        for (final section in result.sections) ...[
          const SizedBox(height: AppSpacing.xLarge),
          Text(section.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xSmall),
          SelectableText(section.body),
          if (section.evidence.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xSmall),
            Text(
              '${l10n.articleEvidenceLabel} · '
              '${section.evidence.map(_evidence).join(' · ')}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
        _StringList(title: l10n.articleKeyPointsTitle, items: result.keyPoints),
        const SizedBox(height: AppSpacing.xLarge),
        Text(
          l10n.articleClosingTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.xSmall),
        SelectableText(result.closing),
        _StringList(
          title: l10n.articleLimitationsTitle,
          items: result.limitations,
        ),
        if (reportMarkdown case final report?) ...[
          const SizedBox(height: AppSpacing.xLarge),
          ExpansionTile(
            tilePadding: EdgeInsets.zero,
            childrenPadding: const EdgeInsets.only(bottom: AppSpacing.large),
            title: Text(l10n.analysisReportTab),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SelectableText(report),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

final class _StringList extends StatelessWidget {
  const _StringList({required this.items, required this.title});

  final Iterable<String> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xSmall),
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xSmall),
              child: Text('• $item'),
            ),
        ],
      ),
    );
  }
}

String _evidence(VideoArticleEvidenceResponse value) =>
    '${formatDurationClock(value.startMs ~/ 1000)}–'
    '${formatDurationClock(value.endMs ~/ 1000)}';
