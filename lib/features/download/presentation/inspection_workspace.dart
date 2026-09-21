import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/download_status.dart';
import 'package:framegrab/features/media/presentation/authenticated_media_cover.dart';
import 'package:framegrab/features/providers/presentation/provider_access_selector.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
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
        if (inspection.accessPolicyId != null)
          Text(
            '${localizations.accessPolicyLabel}: ${accessPolicyLabel(localizations, inspection.accessPolicyId!)}',
          ),
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
            child: ShadRadioGroup<String>(
              axis: Axis.horizontal,
              key: ValueKey(state.selectedFormatId),
              initialValue: state.selectedFormatId,
              enabled: !state.busy,
              onChanged: (value) {
                if (value != null) onSelectFormat(value);
              },
              items: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 360),
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ShadButton(
            key: const Key('create-download-button'),
            onPressed: state.busy ? null : onCreate,
            leading: state.phase == DownloadIntakePhase.creating
                ? const SizedBox.square(dimension: 18, child: AppSpinner())
                : const Icon(PhosphorIconsRegular.download),
            enabled: (state.busy ? null : onCreate) != null,
            height: 0,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Flexible(
              child: Text(
                state.phase == DownloadIntakePhase.creating
                    ? localizations.creatingDownload
                    : localizations.createDownloadAction,
              ),
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
  });

  final int assetCount;
  final FormatResponse format;
  final MediaKind mediaKind;

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
    return ShadRadio<String>(
      value: format.id,
      padding: const EdgeInsets.all(16),
      label: Text(
        format.displayName,
        key: Key('format-option-${format.id}'),
        style: theme.textTheme.titleSmall,
      ),
      sublabel: Text(details),
    );
  }
}

String _duration(int seconds) {
  final minutes = seconds ~/ 60;
  return '$minutes:${(seconds % 60).toString().padLeft(2, '0')}';
}
