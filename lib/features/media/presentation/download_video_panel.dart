import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/media/data/media_repository.dart';
import 'package:framegrab/features/media/presentation/authenticated_media_cover.dart';
import 'package:framegrab/features/media/presentation/media_action_bar.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadVideoPanel extends ConsumerStatefulWidget {
  const DownloadVideoPanel({required this.job, super.key});

  final DownloadResponse job;

  @override
  ConsumerState<DownloadVideoPanel> createState() => _DownloadVideoPanelState();
}

final class _DownloadVideoPanelState extends ConsumerState<DownloadVideoPanel> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  MediaAction? _busyAction;
  String? _error;

  @override
  void dispose() {
    _chewieController?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _watch() async {
    if (_busyAction != null || !supportsNativePlayback(widget.job)) return;
    setState(() {
      _busyAction = MediaAction.watch;
      _error = null;
    });
    try {
      final uri = await ref
          .read(mediaRepositoryProvider)
          .issueDownloadUrl(widget.job.id);
      final controller = VideoPlayerController.networkUrl(uri);
      await controller.initialize();
      final chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: true,
        allowedScreenSleep: false,
        allowFullScreen: true,
        showControlsOnInitialize: true,
      );
      if (!mounted) {
        chewieController.dispose();
        await controller.dispose();
        return;
      }
      final previousChewie = _chewieController;
      _chewieController = chewieController;
      previousChewie?.dispose();
      await _controller?.dispose();
      setState(() => _controller = controller);
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
    final playbackSupported = supportsNativePlayback(widget.job);
    final controller = _controller;
    final chewieController = _chewieController;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (controller == null)
          AuthenticatedMediaCover(
            alt: localizations.mediaCoverLabel,
            pending: !isTerminalDownloadStatus(widget.job.status.name),
            source: widget.job.thumbnailUrl,
          )
        else if (chewieController != null)
          _VideoPlayerSurface(
            chewieController: chewieController,
            controller: controller,
          ),
        if (canUseFile) ...[
          const SizedBox(height: 16),
          MediaActionBar(
            busyAction: _busyAction,
            downloadLabel: localizations.getFileAction,
            onDownload: _download,
            onWatch: _watch,
            playbackSupported: playbackSupported,
            unsupportedLabel: localizations.playbackUnsupported,
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

final class _VideoPlayerSurface extends StatelessWidget {
  const _VideoPlayerSurface({
    required this.chewieController,
    required this.controller,
  });

  final ChewieController chewieController;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio == 0
          ? 16 / 9
          : controller.value.aspectRatio,
      child: Chewie(controller: chewieController),
    );
  }
}

bool isTerminalDownloadStatus(String status) =>
    status == 'succeeded' || status == 'failed' || status == 'cancelled';

bool supportsNativePlayback(DownloadResponse job, {TargetPlatform? platform}) {
  final targetPlatform = platform ?? defaultTargetPlatform;
  if (targetPlatform != TargetPlatform.iOS) return true;
  final format = job.format;
  if (format?.containerPreference.name == 'webm') return false;
  return format?.videoCodecFamily.name != 'vp9' &&
      format?.videoCodecFamily.name != 'av1';
}
