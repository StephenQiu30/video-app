import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/features/history/application/download_detail_provider.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadTaskActions extends ConsumerStatefulWidget {
  const DownloadTaskActions({required this.job, super.key});

  final DownloadResponse job;

  @override
  ConsumerState<DownloadTaskActions> createState() =>
      _DownloadTaskActionsState();
}

final class _DownloadTaskActionsState
    extends ConsumerState<DownloadTaskActions> {
  bool _busy = false;

  Future<void> _cancel() async {
    await _run(() async {
      await ref.read(downloadHistoryRepositoryProvider).cancel(widget.job.id);
      ref.invalidate(downloadDetailProvider(widget.job.id));
      ref.invalidate(downloadHistoryProvider);
    });
  }

  Future<void> _retry() async {
    await _run(() async {
      final next = await ref
          .read(downloadHistoryRepositoryProvider)
          .retry(widget.job.id);
      ref.invalidate(downloadHistoryProvider);
      if (mounted) DownloadDetailRoute(jobId: next.id).replace(context);
    });
  }

  Future<void> _run(Future<void> Function() operation) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await operation();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).operationFailed)),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final status = widget.job.status.name;
    final canCancel = isActiveDownloadStatus(status);
    final canRetry =
        status == 'failed' ||
        status == 'cancelled' ||
        (status == 'succeeded' && !widget.job.fileAvailable);
    if (!canCancel && !canRetry) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.centerLeft,
      child: canCancel
          ? OutlinedButton.icon(
              onPressed: _busy ? null : _cancel,
              icon: const Icon(LucideIcons.x, size: 18),
              label: Text(l10n.cancelDownloadAction),
            )
          : FilledButton.icon(
              onPressed: _busy ? null : _retry,
              icon: const Icon(LucideIcons.refreshCw, size: 18),
              label: Text(l10n.retryDownloadAction),
            ),
    );
  }
}
