import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/documents/presentation/document_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:video_server_api/video_server_api.dart';

final class DocumentDetailSummary extends StatelessWidget {
  const DocumentDetailSummary({required this.document, super.key});

  final DocumentDetailResponse document;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: AppSpacing.xSmall,
          spacing: AppSpacing.large,
          children: [
            Text(
              l10n.documentInformationTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              l10n.documentImportSummary(document.attempt, document.version),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.large),
        DataMetricGrid(
          keyPrefix: 'document-summary',
          metrics: [
            DataMetricValue(
              key: 'format',
              label: l10n.formatLabel,
              value: document.sourceFormat.name.toUpperCase(),
            ),
            DataMetricValue(
              key: 'language',
              label: l10n.languageLabel,
              value: documentLanguageLabel(l10n, document.detectedLanguage),
            ),
            DataMetricValue(
              key: 'scenes',
              label: l10n.sceneCountLabel,
              value: _count(l10n, document.sceneCount),
            ),
            DataMetricValue(
              key: 'characters',
              label: l10n.characterCountLabel,
              value: _count(l10n, document.characterCount),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xLarge),
        _DetailGrid(
          values: [
            (l10n.fileSizeLabel, formatByteCount(document.declaredSizeBytes)),
            (l10n.createdAtLabel, formatDataTime(context, document.createdAt)),
            (l10n.updatedAtLabel, formatDataTime(context, document.updatedAt)),
            (l10n.documentStoragePolicyLabel, l10n.documentStoragePersistent),
          ],
        ),
        if (document.parseSummary case final summary?) ...[
          const SizedBox(height: AppSpacing.section),
          Text(
            l10n.documentBasicParsingTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.large),
          _DetailGrid(
            values: [
              (
                l10n.documentPageCountLabel,
                summary.pageCount?.toString() ?? l10n.waitingForParsing,
              ),
              (l10n.documentParagraphCountLabel, '${summary.paragraphCount}'),
              (l10n.documentHeadingCountLabel, '${summary.headingCount}'),
              (l10n.documentListItemCountLabel, '${summary.listItemCount}'),
              (l10n.documentTableCountLabel, '${summary.tableCount}'),
              (
                l10n.documentDialogueBlockCountLabel,
                '${summary.dialogueBlockCount}',
              ),
            ],
          ),
        ],
      ],
    );
  }
}

String _count(AppLocalizations l10n, int? value) =>
    value?.toString() ?? l10n.waitingForParsing;

final class _DetailGrid extends StatelessWidget {
  const _DetailGrid({required this.values});

  final List<(String, String)> values;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final scale = MediaQuery.textScalerOf(context).scale(14) / 14;
      final columns = constraints.maxWidth >= 560 && scale <= 1.25 ? 4 : 2;
      const gap = AppSpacing.large;
      final width = (constraints.maxWidth - (columns - 1) * gap) / columns;
      return Wrap(
        spacing: gap,
        runSpacing: AppSpacing.large,
        children: [
          for (final value in values)
            SizedBox(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.$1,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xSmall),
                  Text(value.$2, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
        ],
      );
    },
  );
}
