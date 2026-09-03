import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/download_status.dart';
import 'package:framegrab/features/media/presentation/authenticated_media_cover.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class InspectionWorkspace extends StatelessWidget {
  const InspectionWorkspace({
    required this.onCreate,
    required this.onSelectFormat,
    required this.state,
    super.key,
  });

  final VoidCallback onCreate;
  final ValueChanged<String> onSelectFormat;
  final DownloadIntakeState state;

  @override
  Widget build(BuildContext context) {
    final inspection = state.inspection!;
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final downloadable =
        inspection.accessDecision == AccessDecision.downloadable;
    return Column(
      key: const Key('inspection-workspace'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          localizations.inspectionResultTitle,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        AuthenticatedMediaCover(
          alt: localizations.mediaCoverLabel,
          borderRadius: BorderRadius.circular(AppTheme.radius),
          detail: _duration(inspection.durationSeconds),
          eyebrow: inspection.extractorKey.toUpperCase(),
          source: inspection.thumbnailUrl,
          title: inspection.title,
        ),
        const SizedBox(height: 18),
        Text(
          inspection.title,
          style: theme.textTheme.headlineSmall,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          '${inspection.extractorKey.toUpperCase()} · '
          '${_duration(inspection.durationSeconds)}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 28),
        if (!downloadable)
          DownloadInlineStatus(
            message:
                inspection.userAction ??
                inspection.restrictionReason ??
                localizations.mediaUnavailableDescription,
            tone: DownloadNoticeTone.neutral,
          )
        else if (inspection.formats.isEmpty)
          DownloadInlineStatus(
            message: localizations.noFormatsAvailable,
            tone: DownloadNoticeTone.neutral,
          )
        else ...[
          Text(
            localizations.formatSelectionTitle,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(
            localizations.formatSelectionDescription,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 360),
            child: Scrollbar(
              child: ListView.separated(
                key: const Key('format-options-list'),
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: inspection.formats.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final format = inspection.formats[index];
                  return _FormatOption(
                    assetCount: inspection.assetCount,
                    format: format,
                    mediaKind: inspection.mediaKind,
                    onTap: state.busy ? null : () => onSelectFormat(format.id),
                    selected: state.selectedFormatId == format.id,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            key: const Key('create-download-button'),
            onPressed: state.busy ? null : onCreate,
            icon: state.phase == DownloadIntakePhase.creating
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(LucideIcons.download),
            label: Text(
              state.phase == DownloadIntakePhase.creating
                  ? localizations.creatingDownload
                  : localizations.createDownloadAction,
            ),
          ),
        ],
      ],
    );
  }
}

final class _FormatOption extends StatelessWidget {
  const _FormatOption({
    required this.assetCount,
    required this.format,
    required this.mediaKind,
    required this.onTap,
    required this.selected,
  });

  final int assetCount;
  final FormatResponse format;
  final MediaKind mediaKind;
  final VoidCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final plan = format.plan;
    final localizations = AppLocalizations.of(context);
    final details = plan == null
        ? switch (mediaKind) {
            MediaKind.imageGallery => localizations.imageGalleryFormatDetails(
              assetCount,
            ),
            MediaKind.videoCollection =>
              localizations.videoCollectionFormatDetails(assetCount),
            _ => localizations.formatUnavailable,
          }
        : '${plan.width}×${plan.height} · '
              '${plan.containerPreference.name.toUpperCase()} · '
              '${plan.videoCodecFamily.name.toUpperCase()}';
    return Material(
      color: selected
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppTheme.radius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: Key('format-option-${format.id}'),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                selected ? LucideIcons.circleCheck : LucideIcons.circle,
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
                size: 21,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(format.displayName, style: theme.textTheme.titleSmall),
                    const SizedBox(height: 4),
                    Text(
                      details,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _duration(int seconds) {
  final minutes = seconds ~/ 60;
  return '$minutes:${(seconds % 60).toString().padLeft(2, '0')}';
}
