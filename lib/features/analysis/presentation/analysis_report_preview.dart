import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:framegrab/core/theme/app_spacing.dart';

final class AnalysisReportPreview extends StatelessWidget {
  const AnalysisReportPreview({required this.markdown, super.key});

  final String markdown;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final bodyStyle = textTheme.bodyMedium?.copyWith(
      color: colors.onSurfaceVariant,
      height: 1.75,
    );

    return MarkdownBody(
      key: const Key('analysis-markdown-preview'),
      data: markdown.trim(),
      selectable: true,
      softLineBreak: true,
      fitContent: true,
      styleSheet: MarkdownStyleSheet(
        a: bodyStyle?.copyWith(
          color: colors.onSurface,
          decoration: TextDecoration.underline,
        ),
        p: bodyStyle,
        pPadding: const EdgeInsets.only(bottom: AppSpacing.small),
        h1: textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          height: 1.25,
        ),
        h1Padding: const EdgeInsets.only(bottom: AppSpacing.large),
        h2: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          height: 1.35,
        ),
        h2Padding: const EdgeInsets.only(
          top: AppSpacing.xLarge,
          bottom: AppSpacing.small,
        ),
        h3: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        h3Padding: const EdgeInsets.only(
          top: AppSpacing.large,
          bottom: AppSpacing.xSmall,
        ),
        h4: textTheme.titleSmall,
        h4Padding: const EdgeInsets.only(
          top: AppSpacing.medium,
          bottom: AppSpacing.xSmall,
        ),
        h5: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        h6: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        strong: const TextStyle(fontWeight: FontWeight.w700),
        em: const TextStyle(fontStyle: FontStyle.italic),
        del: const TextStyle(decoration: TextDecoration.lineThrough),
        code: textTheme.bodySmall?.copyWith(
          color: colors.onSurface,
          fontFamily: 'monospace',
          backgroundColor: colors.surface,
        ),
        codeblockPadding: const EdgeInsets.all(AppSpacing.medium),
        codeblockDecoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(6),
        ),
        blockquote: bodyStyle,
        blockquotePadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.medium,
          vertical: AppSpacing.small,
        ),
        blockquoteDecoration: BoxDecoration(
          color: colors.surface,
          border: Border(left: BorderSide(color: colors.outline, width: 2)),
        ),
        blockSpacing: AppSpacing.small,
        listIndent: AppSpacing.xLarge,
        listBullet: bodyStyle,
        listBulletPadding: const EdgeInsets.only(right: AppSpacing.xSmall),
        tableHead: textTheme.labelLarge?.copyWith(
          color: colors.onSurface,
          fontWeight: FontWeight.w600,
        ),
        tableBody: bodyStyle,
        tableHeadAlign: TextAlign.left,
        tableCellsPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.small,
          vertical: AppSpacing.xSmall,
        ),
        tableBorder: TableBorder(
          horizontalInside: BorderSide(color: colors.outline),
          bottom: BorderSide(color: colors.outline),
        ),
        tableColumnWidth: const IntrinsicColumnWidth(),
        horizontalRuleDecoration: BoxDecoration(
          border: Border(top: BorderSide(color: colors.outline)),
        ),
      ),
    );
  }
}
