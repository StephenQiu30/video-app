import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/features/media/data/media_repository.dart';
import 'package:framegrab/features/media/presentation/authenticated_media_cover.dart';
import 'package:framegrab/features/media/presentation/media_action_bar.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadVideoPanel extends ConsumerStatefulWidget {
  const DownloadVideoPanel({required this.job, super.key});

  final DownloadResponse job;

  @override
  ConsumerState<DownloadVideoPanel> createState() => _DownloadVideoPanelState();
}

final class _DownloadVideoPanelState extends ConsumerState<DownloadVideoPanel> {
  Player? _player;
  VideoController? _videoController;
  StreamSubscription<String>? _playbackErrorSubscription;
  MediaAction? _busyAction;
  String? _error;

  @override
  void dispose() {
    unawaited(_playbackErrorSubscription?.cancel());
    unawaited(_player?.dispose());
    super.dispose();
  }

  Future<void> _watch() async {
    if (_busyAction != null) return;
    setState(() {
      _busyAction = MediaAction.watch;
      _error = null;
    });
    try {
      final uri = await ref
          .read(mediaRepositoryProvider)
          .issueDownloadUrl(widget.job.id);
      final player = Player();
      final videoController = VideoController(player);
      final errorSubscription = player.stream.error.listen((_) {
        if (mounted && identical(_player, player)) {
          setState(() => _error = 'playback');
        }
      });
      try {
        await player.open(Media(uri.toString()), play: true);
      } catch (_) {
        await errorSubscription.cancel();
        await player.dispose();
        rethrow;
      }
      if (!mounted) {
        await errorSubscription.cancel();
        await player.dispose();
        return;
      }
      final previousPlayer = _player;
      final previousSubscription = _playbackErrorSubscription;
      setState(() {
        _player = player;
        _videoController = videoController;
        _playbackErrorSubscription = errorSubscription;
      });
      await previousSubscription?.cancel();
      await previousPlayer?.dispose();
    } catch (_) {
      if (mounted) setState(() => _error = 'playback');
    } finally {
      if (mounted) setState(() => _busyAction = null);
    }
  }

  Future<void> _download() async {
    if (_busyAction != null) return;
    setState(() {
      _busyAction = MediaAction.download;
      _error = null;
    });
    try {
      final uri = await ref
          .read(mediaRepositoryProvider)
          .issueDownloadUrl(widget.job.id);
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!opened) throw StateError('Unable to open system download.');
    } catch (_) {
      if (mounted) setState(() => _error = 'download');
    } finally {
      if (mounted) setState(() => _busyAction = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final canUseFile =
        widget.job.status.name == 'succeeded' && widget.job.fileAvailable;
    final videoController = _videoController;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (videoController == null)
          AuthenticatedMediaCover(
            alt: localizations.mediaCoverLabel,
            detail: downloadFormatLabel(localizations, widget.job.format),
            eyebrow: _sourceLabel(widget.job),
            pending: !isTerminalDownloadStatus(widget.job.status.name),
            source: widget.job.thumbnailUrl,
            title: widget.job.title,
          )
        else
          _VideoPlayerSurface(controller: videoController),
        if (canUseFile) ...[
          const SizedBox(height: 16),
          MediaActionBar(
            busyAction: _busyAction,
            downloadLabel: localizations.getFileAction,
            onDownload: _download,
            onWatch: _watch,
            watchLabel: localizations.watchVideoAction,
          ),
        ],
        if (_error != null) ...[
          const SizedBox(height: 12),
          Text(
            _error == 'playback'
                ? localizations.playbackFailed
                : localizations.downloadOpenFailed,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ],
    );
  }
}

String _sourceLabel(DownloadResponse job) {
  final extractor = job.extractorKey?.trim();
  if (extractor == null ||
      extractor.isEmpty ||
      extractor.toLowerCase() == job.sourceLabel.toLowerCase()) {
    return job.sourceLabel;
  }
  return '${job.sourceLabel} · $extractor';
}

final class _VideoPlayerSurface extends StatelessWidget {
  const _VideoPlayerSurface({required this.controller});

  final VideoController controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Video(controller: controller, fit: BoxFit.contain),
    );
  }
}

bool isTerminalDownloadStatus(String status) =>
    status == 'succeeded' || status == 'failed' || status == 'cancelled';
