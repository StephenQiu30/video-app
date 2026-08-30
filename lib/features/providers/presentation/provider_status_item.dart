import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:video_server_api/video_server_api.dart';

final class ProviderStatusItem extends StatelessWidget {
  const ProviderStatusItem({required this.item, super.key});

  final ProviderStatusResponse item;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final status = _statusLabel(localizations, item.status.name);
    final capabilities = item.capabilities
        .map((value) => _capabilityLabel(localizations, value.name))
        .join('、');
    final accessModes = item.accessModes
        .map((value) => _accessModeLabel(localizations, value.name))
        .join('、');
    final verifiedAt =
        item.lastVerifiedAt ?? item.lastMediaVerifiedAt ?? item.lastCheckedAt;

    return Semantics(
      container: true,
      label: '${item.displayName}, $status',
      child: ExcludeSemantics(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.displayName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  DataStatusLabel(
                    color: _statusColor(context, item.status.name),
                    label: status,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.small),
              _DetailLine(
                label: localizations.downloadAvailableLabel,
                value: item.downloadAvailable
                    ? localizations.yesLabel
                    : localizations.noLabel,
              ),
              if (capabilities.isNotEmpty)
                _DetailLine(
                  label: localizations.capabilitiesLabel,
                  value: capabilities,
                ),
              if (accessModes.isNotEmpty)
                _DetailLine(
                  label: localizations.accessModesLabel,
                  value: accessModes,
                ),
              _DetailLine(
                label: localizations.lastVerifiedLabel,
                value: verifiedAt == null
                    ? localizations.notYetVerified
                    : formatDataTime(context, verifiedAt),
              ),
              if (item.userAction?.trim().isNotEmpty ?? false)
                _DetailLine(
                  label: localizations.userActionLabel,
                  value: item.userAction!.trim(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _DetailLine extends StatelessWidget {
  const _DetailLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xSmall),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label  ',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            TextSpan(text: value, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

Color _statusColor(BuildContext context, String status) => switch (status) {
  'verified' => context.appColors.success,
  'degraded' || 'accessRequired' || 'rateLimited' => context.appColors.warning,
  'blocked' || 'unsupported' => Theme.of(context).colorScheme.error,
  _ => Theme.of(context).colorScheme.onSurfaceVariant,
};

String _statusLabel(AppLocalizations l10n, String status) => switch (status) {
  'verified' => l10n.providerStatusVerified,
  'degraded' => l10n.providerStatusDegraded,
  'accessRequired' => l10n.providerStatusAccessRequired,
  'rateLimited' => l10n.providerStatusRateLimited,
  'blocked' => l10n.providerStatusBlocked,
  'disabled' => l10n.providerStatusDisabled,
  'unsupported' => l10n.providerStatusUnsupported,
  _ => l10n.providerStatusUnknown,
};

String _capabilityLabel(AppLocalizations l10n, String value) => switch (value) {
  'singleVideo' => l10n.capabilitySingleVideo,
  'shortVideo' => l10n.capabilityShortVideo,
  'clipOrVod' => l10n.capabilityClipOrVod,
  'audioVideoSplit' => l10n.capabilityAudioVideoSplit,
  'subtitles' => l10n.capabilitySubtitles,
  'imageOrCarousel' => l10n.capabilityImageOrCarousel,
  'live' => l10n.capabilityLive,
  'playlist' => l10n.capabilityPlaylist,
  _ => l10n.providerStatusUnknown,
};

String _accessModeLabel(AppLocalizations l10n, String value) => switch (value) {
  'anonymous' => l10n.accessModeAnonymous,
  'operatorManaged' => l10n.accessModeOperatorManaged,
  _ => l10n.providerStatusUnknown,
};
