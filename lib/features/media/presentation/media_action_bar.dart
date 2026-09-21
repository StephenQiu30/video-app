import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum MediaAction { watch, download }

final class MediaActionBar extends StatelessWidget {
  const MediaActionBar({
    required this.downloadLabel,
    required this.onDownload,
    required this.watchLabel,
    this.busyAction,
    this.onWatch,
    super.key,
  });

  final MediaAction? busyAction;
  final String downloadLabel;
  final VoidCallback onDownload;
  final VoidCallback? onWatch;
  final String watchLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ShadButton(
            key: const Key('watch-download-video'),
            onPressed: busyAction == null ? onWatch : null,
            leading: _ActionIcon(
              busy: busyAction == MediaAction.watch,
              icon: PhosphorIconsRegular.play,
            ),
            enabled: (busyAction == null ? onWatch : null) != null,
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(child: Text(watchLabel)),
          ),
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: ShadButton.secondary(
            key: const Key('download-video-file'),
            onPressed: busyAction == null ? onDownload : null,
            leading: _ActionIcon(
              busy: busyAction == MediaAction.download,
              icon: PhosphorIconsRegular.download,
            ),
            enabled: (busyAction == null ? onDownload : null) != null,
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(child: Text(downloadLabel)),
          ),
        ),
      ],
    );
  }
}

final class _ActionIcon extends StatelessWidget {
  const _ActionIcon({required this.busy, required this.icon});

  final bool busy;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return busy
        ? const SizedBox.square(dimension: 17, child: AppSpinner())
        : Icon(icon, size: 18);
  }
}
