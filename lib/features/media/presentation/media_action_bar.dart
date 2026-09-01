import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
          child: FilledButton.icon(
            key: const Key('watch-download-video'),
            onPressed: busyAction == null ? onWatch : null,
            icon: _ActionIcon(
              busy: busyAction == MediaAction.watch,
              icon: LucideIcons.play,
            ),
            label: Text(watchLabel),
            style: _buttonStyle(context),
          ),
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: FilledButton.icon(
            key: const Key('download-video-file'),
            onPressed: busyAction == null ? onDownload : null,
            icon: _ActionIcon(
              busy: busyAction == MediaAction.download,
              icon: LucideIcons.download,
            ),
            label: Text(downloadLabel),
            style: _buttonStyle(context, secondary: true),
          ),
        ),
      ],
    );
  }

  ButtonStyle _buttonStyle(BuildContext context, {bool secondary = false}) {
    return FilledButton.styleFrom(
      backgroundColor: secondary
          ? context.appColors.input
          : Theme.of(context).colorScheme.primary,
      foregroundColor: secondary
          ? Theme.of(context).colorScheme.onSurface
          : Theme.of(context).colorScheme.onPrimary,
      disabledBackgroundColor: secondary
          ? context.appColors.input.withValues(alpha: 0.6)
          : null,
      elevation: 0,
      minimumSize: const Size(44, 52),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
        ? const SizedBox.square(
            dimension: 17,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Icon(icon, size: 18);
  }
}
