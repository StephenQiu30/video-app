import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:video_server_api/video_server_api.dart';

final class DocumentListItem extends StatelessWidget {
  const DocumentListItem({required this.item, super.key});

  final DocumentResponse item;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final status = _statusLabel(localizations, item.status.name);
    final detailValues = <String>[
      formatByteCount(item.declaredSizeBytes),
      item.sourceFormat.name.toUpperCase(),
      if (item.sceneCount != null)
        '${localizations.sceneCountLabel} ${item.sceneCount}',
      if (item.characterCount != null)
        '${localizations.characterCountLabel} ${item.characterCount}',
      if (item.detectedLanguage?.isNotEmpty ?? false)
        '${localizations.languageLabel} ${item.detectedLanguage}',
    ];

    return Semantics(
      container: true,
      label: '${item.title}, $status, ${item.originalFilename}',
      child: ExcludeSemantics(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(item.title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.xSmall),
              Text(
                item.originalFilename,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              DataStatusLabel(
                color: _statusColor(context, item.status.name),
                label: status,
              ),
              const SizedBox(height: AppSpacing.small),
              Text(
                detailValues.join(' · '),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.small),
              Text(
                '${localizations.updatedAtLabel} ${formatDataTime(context, item.updatedAt)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color _statusColor(BuildContext context, String status) => switch (status) {
  'ready' => context.appColors.success,
  'failed' || 'expired' => Theme.of(context).colorScheme.error,
  'uploading' || 'verifying' => context.appColors.warning,
  _ => Theme.of(context).colorScheme.onSurfaceVariant,
};

String _statusLabel(AppLocalizations l10n, String status) => switch (status) {
  'uploading' => l10n.documentStatusUploading,
  'verifying' => l10n.documentStatusVerifying,
  'ready' => l10n.documentStatusReady,
  'failed' => l10n.documentStatusFailed,
  'cancelled' => l10n.documentStatusCancelled,
  'expired' => l10n.documentStatusExpired,
  _ => l10n.documentStatusUnknown,
};
