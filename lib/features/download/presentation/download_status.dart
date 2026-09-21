import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
    final colorScheme = ShadTheme.of(context).colorScheme;
    final destructive = tone == DownloadNoticeTone.destructive;
    final foreground = destructive
        ? colorScheme.destructive
        : colorScheme.mutedForeground;
    final background = destructive
        ? colorScheme.destructive.withValues(alpha: .1)
        : colorScheme.muted;

    return Semantics(
      container: true,
      liveRegion: true,
      child: ShadAlert.raw(
        variant: destructive
            ? ShadAlertVariant.destructive
            : ShadAlertVariant.primary,
        icon: Icon(
          destructive
              ? PhosphorIconsRegular.warningCircle
              : PhosphorIconsRegular.info,
        ),
        iconColor: foreground,
        decoration: ShadDecoration(color: background, border: ShadBorder.none),
        descriptionStyle: ShadTheme.of(context).textTheme.p,
        description: Text(message),
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
        _FooterStatus(
          icon: PhosphorIconsRegular.checkCircle,
          iconColor: context.appColors.success,
          label: localizations.legalMediaStatus,
        ),
        const SizedBox(height: 12),
        _FooterStatus(
          icon: PhosphorIconsRegular.shieldCheck,
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
