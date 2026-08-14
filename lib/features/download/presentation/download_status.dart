import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/l10n/app_localizations.dart';

enum DownloadNoticeTone { neutral, destructive }

final class DownloadInlineStatus extends StatelessWidget {
  const DownloadInlineStatus({
    required this.message,
    this.tone = DownloadNoticeTone.destructive,
    super.key,
  });

  final String message;
  final DownloadNoticeTone tone;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final destructive = tone == DownloadNoticeTone.destructive;
    final foreground = destructive
        ? colorScheme.error
        : colorScheme.onSurfaceVariant;
    final background = destructive
        ? colorScheme.errorContainer
        : context.appColors.input;

    return Semantics(
      container: true,
      liveRegion: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                destructive
                    ? Icons.error_outline_rounded
                    : Icons.info_outline_rounded,
                color: foreground,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: destructive
                        ? colorScheme.onErrorContainer
                        : colorScheme.onSurface,
                    height: 1.55,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class DownloadTrustFooter extends StatelessWidget {
  const DownloadTrustFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Divider(color: Theme.of(context).colorScheme.outline),
        const SizedBox(height: 20),
        _FooterStatus(
          icon: Icons.check_circle_outline_rounded,
          iconColor: context.appColors.success,
          label: localizations.legalMediaStatus,
        ),
        const SizedBox(height: 12),
        _FooterStatus(
          icon: Icons.shield_outlined,
          iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
          label: localizations.privacyStatus,
        ),
      ],
    );
  }
}

final class _FooterStatus extends StatelessWidget {
  const _FooterStatus({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
