import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/analysis/data/analysis_report_file_actions.dart';
import 'package:framegrab/features/download/presentation/download_app_bar.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_page_intro.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class AnalysisReportPreview extends StatelessWidget {
  const AnalysisReportPreview({
    required this.markdown,
    this.padding = EdgeInsets.zero,
    this.scrollable = false,
    super.key,
  });

  final String markdown;
  final EdgeInsets padding;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final styleSheet = _styleSheet(context);
    if (scrollable) {
      return Markdown(
        key: const Key('analysis-markdown-preview'),
        data: markdown.trim(),
        padding: padding,
        selectable: true,
        softLineBreak: true,
        styleSheet: styleSheet,
      );
    }
    return MarkdownBody(
      key: const Key('analysis-markdown-preview'),
      data: markdown.trim(),
      selectable: true,
      softLineBreak: true,
      fitContent: true,
      styleSheet: styleSheet,
    );
  }

  MarkdownStyleSheet _styleSheet(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final bodyStyle = textTheme.bodyMedium?.copyWith(
      color: colors.onSurfaceVariant,
      height: 1.75,
    );

    return MarkdownStyleSheet(
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
    );
  }
}

final class AnalysisReportLauncher extends StatelessWidget {
  const AnalysisReportLauncher({
    required this.markdown,
    required this.title,
    this.fileActions = const NativeAnalysisReportFileActions(),
    super.key,
  });

  final AnalysisReportFileActions fileActions;
  final String markdown;
  final String title;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FilledButton.tonalIcon(
      key: const Key('open-analysis-report'),
      onPressed: () => Navigator.of(context).push<void>(
        MaterialPageRoute(
          builder: (_) => AnalysisReportScreen(
            fileActions: fileActions,
            markdown: markdown,
            title: title,
          ),
        ),
      ),
      icon: const Icon(LucideIcons.fileText, size: 20),
      label: Text(l10n.openAnalysisReportAction),
    );
  }
}

final class AnalysisReportScreen extends StatefulWidget {
  const AnalysisReportScreen({
    required this.markdown,
    required this.title,
    this.fileActions = const NativeAnalysisReportFileActions(),
    super.key,
  });

  final AnalysisReportFileActions fileActions;
  final String markdown;
  final String title;

  @override
  State<AnalysisReportScreen> createState() => _AnalysisReportScreenState();
}

final class _AnalysisReportScreenState extends State<AnalysisReportScreen> {
  Animation<double>? _routeAnimation;
  var _downloadBusy = false;
  var _exportBusy = false;
  var _renderMarkdown = false;
  var _renderScheduled = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final animation = ModalRoute.of(context)?.animation;
    if (identical(animation, _routeAnimation)) return;
    _routeAnimation?.removeStatusListener(_handleRouteStatus);
    _routeAnimation = animation;
    if (animation == null || animation.status == AnimationStatus.completed) {
      _scheduleReportRender();
    } else {
      animation.addStatusListener(_handleRouteStatus);
    }
  }

  void _handleRouteStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) _scheduleReportRender();
  }

  void _scheduleReportRender() {
    if (_renderMarkdown || _renderScheduled) return;
    _renderScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _renderMarkdown = true);
    });
  }

  @override
  void dispose() {
    _routeAnimation?.removeStatusListener(_handleRouteStatus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      key: const Key('analysis-report-screen'),
      appBar: const DownloadAppBar(backFallbackLocation: '/'),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.pageHorizontal,
                AppSpacing.pageTop,
                AppSpacing.pageHorizontal,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppPageIntro(
                    compactTitle: true,
                    description: widget.title,
                    title: l10n.analysisReportTab,
                  ),
                  const SizedBox(height: AppSpacing.xLarge),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          key: const Key('download-analysis-report'),
                          onPressed: _downloadBusy ? null : _downloadReport,
                          icon: _downloadBusy
                              ? const SizedBox.square(
                                  dimension: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(LucideIcons.download, size: 20),
                          label: Text(l10n.downloadAnalysisReportAction),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.small),
                      Expanded(
                        child: Builder(
                          builder: (buttonContext) => TextButton.icon(
                            key: const Key('export-analysis-report'),
                            onPressed: _exportBusy
                                ? null
                                : () => _exportReport(buttonContext),
                            icon: _exportBusy
                                ? const SizedBox.square(
                                    dimension: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(LucideIcons.share2, size: 20),
                            label: Text(l10n.exportAnalysisReportAction),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.medium),
                ],
              ),
            ),
            Expanded(
              child: _renderMarkdown
                  ? AnalysisReportPreview(
                      markdown: widget.markdown,
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.pageHorizontal,
                        0,
                        AppSpacing.pageHorizontal,
                        AppSpacing.pageBottom,
                      ),
                      scrollable: true,
                    )
                  : Center(
                      key: const Key('analysis-report-loading'),
                      child: Semantics(
                        liveRegion: true,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircularProgressIndicator(),
                            const SizedBox(height: AppSpacing.medium),
                            Text(l10n.analysisReportLoading),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _downloadReport() async {
    final l10n = AppLocalizations.of(context);
    setState(() => _downloadBusy = true);
    try {
      await widget.fileActions.download(
        markdown: widget.markdown,
        title: widget.title,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.analysisReportDownloaded)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.analysisReportDownloadFailed)),
      );
    } finally {
      if (mounted) setState(() => _downloadBusy = false);
    }
  }

  Future<void> _exportReport(BuildContext buttonContext) async {
    final l10n = AppLocalizations.of(context);
    final renderBox = buttonContext.findRenderObject() as RenderBox?;
    final shareOrigin = renderBox == null
        ? Offset.zero & MediaQuery.sizeOf(context)
        : renderBox.localToGlobal(Offset.zero) & renderBox.size;
    setState(() => _exportBusy = true);
    try {
      await widget.fileActions.export(
        markdown: widget.markdown,
        shareOrigin: shareOrigin,
        title: widget.title,
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.analysisReportExportFailed)));
    } finally {
      if (mounted) setState(() => _exportBusy = false);
    }
  }
}
