import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/destructive_confirmation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class DownloadDeleteButton extends ConsumerStatefulWidget {
  const DownloadDeleteButton({
    required this.jobId,
    required this.status,
    super.key,
  });

  final String jobId;
  final String status;

  @override
  ConsumerState<DownloadDeleteButton> createState() =>
      _DownloadDeleteButtonState();
}

final class _DownloadDeleteButtonState
    extends ConsumerState<DownloadDeleteButton> {
  bool _busy = false;

  Future<void> _delete() async {
    if (_busy) return;
    final l10n = AppLocalizations.of(context);
    final active = isActiveDownloadStatus(widget.status);
    final confirmed = await showDestructiveConfirmation(
      context: context,
      title: l10n.deleteDownloadTitle,
      description: active
          ? l10n.deleteDownloadActiveDescription
          : l10n.deleteDownloadDescription,
      cancelLabel: l10n.keepDownloadAction,
      confirmLabel: l10n.confirmDeleteAction,
    );
    if (!confirmed || !mounted) return;
    setState(() => _busy = true);
    try {
      await ref.read(downloadHistoryRepositoryProvider).delete(widget.jobId);
      ref.invalidate(downloadHistoryProvider);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.operationFailed)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return IconButton(
      key: Key('delete-download-${widget.jobId}'),
      tooltip: l10n.deleteDownloadAction,
      color: Theme.of(context).colorScheme.error,
      onPressed: _busy ? null : _delete,
      icon: _busy
          ? const SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(LucideIcons.trash2, size: 18),
    );
  }
}
