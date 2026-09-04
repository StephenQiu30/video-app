import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/presentation/analysis_panel.dart';
import 'package:framegrab/features/documents/presentation/document_detail_summary.dart';
import 'package:framegrab/features/documents/presentation/document_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DocumentDetailContent extends StatelessWidget {
  const DocumentDetailContent({
    required this.deleting,
    required this.document,
    required this.onDelete,
    super.key,
  });

  final bool deleting;
  final DocumentDetailResponse document;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final preview = document.preview?.trim();
    return Column(
      key: const Key('document-detail-content'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: AppSpacing.xSmall,
          spacing: AppSpacing.large,
          children: [
            DataStatusLabel(
              color: documentStatusColor(context, document.status.name),
              label: documentStatusLabel(l10n, document.status.name),
            ),
            TextButton.icon(
              key: const Key('delete-document-detail'),
              onPressed: deleting ? null : onDelete,
              icon: deleting
                  ? const SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(LucideIcons.trash2, size: 18),
              label: Text(l10n.deleteDocumentAction),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xLarge),
        DocumentDetailSummary(document: document),
        if (document.errorCode case final error?) ...[
          const SizedBox(height: AppSpacing.xLarge),
          _Notice(
            icon: LucideIcons.triangleAlert,
            title: l10n.documentParsingIncompleteTitle,
            message: documentErrorLabel(l10n, error.name),
            error: true,
          ),
        ],
        if (document.qualityWarnings.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xLarge),
          _Notice(
            icon: LucideIcons.circleAlert,
            title: l10n.documentManualReviewTitle,
            message: document.qualityWarnings
                .map((warning) => documentQualityWarningLabel(l10n, warning))
                .join('\n'),
          ),
        ],
        const SizedBox(height: AppSpacing.section),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: AppSpacing.xSmall,
          spacing: AppSpacing.large,
          children: [
            Text(
              l10n.normalizedScreenplayTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (preview?.isNotEmpty ?? false)
              Text(
                l10n.markdownPreviewLabel,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.large),
        if (document.status == ImportStatus.ready &&
            (preview?.isNotEmpty ?? false))
          Semantics(
            label: l10n.markdownPreviewLabel,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.large),
                child: MarkdownBody(
                  key: const Key('document-markdown-preview'),
                  data: _escapeHtml(preview!),
                  selectable: true,
                  softLineBreak: true,
                  onTapLink: (_, _, _) {},
                  styleSheet: _markdownStyle(context),
                ),
              ),
            ),
          )
        else
          DataStateMessage(
            icon: LucideIcons.fileClock,
            title: documentStatusLabel(l10n, document.status.name),
            description: _previewMessage(l10n, document.status),
          ),
        if (document.previewTruncated) ...[
          const SizedBox(height: AppSpacing.large),
          _Notice(
            icon: LucideIcons.info,
            title: l10n.documentPreviewTruncatedTitle,
            message: l10n.documentPreviewTruncatedDescription,
          ),
        ],
        if (document.status == ImportStatus.ready) ...[
          const SizedBox(height: AppSpacing.section),
          AnalysisPanel.screenplay(documentId: document.id),
        ],
      ],
    );
  }
}

String _previewMessage(AppLocalizations l10n, ImportStatus status) =>
    switch (status.name) {
      'uploading' => l10n.documentPreviewUploading,
      'verifying' => l10n.documentPreviewVerifying,
      'ready' => l10n.documentPreviewEmpty,
      'failed' => l10n.documentPreviewFailed,
      'cancelled' => l10n.documentPreviewCancelled,
      _ => l10n.documentPreviewExpired,
    };

String _escapeHtml(String markdown) => markdown.replaceAllMapped(
  RegExp(r'</?[a-z][^>]*>', caseSensitive: false),
  (match) => match.group(0)!.replaceAll('<', '&lt;').replaceAll('>', '&gt;'),
);

MarkdownStyleSheet _markdownStyle(BuildContext context) {
  final theme = Theme.of(context);
  final body = theme.textTheme.bodyMedium?.copyWith(height: 1.75);
  return MarkdownStyleSheet(
    p: body,
    pPadding: const EdgeInsets.only(bottom: AppSpacing.small),
    h1: theme.textTheme.headlineSmall,
    h2: theme.textTheme.titleLarge,
    h3: theme.textTheme.titleMedium,
    blockSpacing: AppSpacing.small,
    listIndent: AppSpacing.xLarge,
    code: theme.textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
  );
}

final class _Notice extends StatelessWidget {
  const _Notice({
    required this.icon,
    required this.message,
    required this.title,
    this.error = false,
  });

  final bool error;
  final IconData icon;
  final String message;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final color = error ? colors.error : colors.onSurfaceVariant;
    return Semantics(
      container: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: AppSpacing.small),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: AppSpacing.xSmall),
                Text(message, style: TextStyle(color: color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final class DocumentDetailSkeleton extends StatelessWidget {
  const DocumentDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) => Semantics(
    liveRegion: true,
    label: AppLocalizations.of(context).loadingData,
    child: const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.section),
        child: CircularProgressIndicator(),
      ),
    ),
  );
}
