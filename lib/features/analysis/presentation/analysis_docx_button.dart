import 'package:flutter/material.dart';
import 'package:flutter_file_saver/flutter_file_saver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/analysis/data/analysis_docx_repository.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AnalysisDocxButton extends ConsumerStatefulWidget {
  const AnalysisDocxButton({required this.analysisId, super.key});
  final String analysisId;
  @override
  ConsumerState<AnalysisDocxButton> createState() => _AnalysisDocxButtonState();
}

final class _AnalysisDocxButtonState extends ConsumerState<AnalysisDocxButton> {
  bool _busy = false;
  Future<void> _save() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final bytes = await ref
          .read(analysisDocxRepositoryProvider)
          .fetch(widget.analysisId);
      if (!mounted) return;
      await FlutterFileSaver().writeFileAsBytes(
        fileName: 'analysis-report-${widget.analysisId}.docx',
        bytes: bytes,
      );
    } catch (_) {
      if (mounted) {
        ShadSonner.of(context).show(
          ShadToast(
            description: Text(
              AppLocalizations.of(context).analysisReportDownloadFailed,
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) => ShadButton.secondary(
    key: const Key('export-analysis-docx'),
    onPressed: _busy ? null : _save,
    leading: const Icon(PhosphorIconsRegular.download),
    enabled: (_busy ? null : _save) != null,
    height: 0,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    child: Flexible(child: Text(AppLocalizations.of(context).exportDocx)),
  );
}
