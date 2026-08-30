import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/media/data/media_repository.dart';
import 'package:framegrab/features/media/presentation/authenticated_media_cover.dart';
import 'package:framegrab/features/media/presentation/media_action_bar.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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
  MediaAction? _busyAction;
  String? _error;

  @override
  void dispose() {
    _controller?.removeListener(_playerChanged);
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
      controller.addListener(_playerChanged);
      await controller.play();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      _controller?.removeListener(_playerChanged);
      await _controller?.dispose();
      setState(() => _controller = controller);
    } catch (_) {
      if (mounted) setState(() => _error = 'playback');
    } finally {
      if (mounted) setState(() => _busyAction = null);
    }
  }

  void _playerChanged() {
    if (mounted) setState(() {});
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (controller == null)
          AuthenticatedMediaCover(
            alt: localizations.mediaCoverLabel,
            pending: !isTerminalDownloadStatus(widget.job.status.name),
            source: widget.job.thumbnailUrl,
          )
        else
          _VideoPlayerSurface(controller: controller),
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
  const _VideoPlayerSurface({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio == 0
          ? 16 / 9
          : controller.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          VideoPlayer(controller),
          VideoProgressIndicator(controller, allowScrubbing: true),
          Center(
            child: IconButton.filledTonal(
              onPressed: () => controller.value.isPlaying
                  ? controller.pause()
                  : controller.play(),
              icon: Icon(
                controller.value.isPlaying
                    ? LucideIcons.pause
                    : LucideIcons.play,
              ),
            ),
          ),
        ],
      ),
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
