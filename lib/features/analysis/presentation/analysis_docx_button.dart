import 'package:flutter/material.dart';
import 'package:flutter_file_saver/flutter_file_saver.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/analysis/data/analysis_docx_repository.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
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
  Widget build(BuildContext context) => FilledButton.tonalIcon(
    key: const Key('export-analysis-docx'),
    onPressed: _busy ? null : _save,
    icon: const Icon(LucideIcons.download),
    label: Text(AppLocalizations.of(context).exportDocx),
  );
}
