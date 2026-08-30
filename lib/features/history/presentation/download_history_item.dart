import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/history/presentation/download_presentation_labels.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadHistoryItem extends StatelessWidget {
  const DownloadHistoryItem({
    required this.item,
    required this.onTap,
    super.key,
  });

  final DownloadHistoryItemResponse item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final status = downloadStatusLabel(localizations, item.status.name);
    final failure = item.errorCode == null
        ? null
        : downloadFailureLabel(localizations, item.errorCode!.name);
    final meta = [
      item.sourceLabel,
      item.formatName,
    ].where((value) => value.trim().isNotEmpty).join(' · ');

    return Semantics(
      container: true,
      button: true,
      label: '${item.title}, $status, ${item.progress}%',
      onTap: onTap,
      child: ExcludeSemantics(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            key: Key('download-history-item-${item.id}'),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.small),
                      Icon(
                        LucideIcons.chevronRight,
                        size: 18,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                  if (meta.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xSmall),
                    Text(
                      meta,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.small),
                  DataStatusLabel(
                    color: downloadStatusColor(context, item.status.name),
                    label: status,
                  ),
                  if (isActiveDownloadStatus(item.status.name)) ...[
                    const SizedBox(height: AppSpacing.small),
                    LinearProgressIndicator(value: item.progress / 100),
                    const SizedBox(height: AppSpacing.xSmall),
                    Text('${localizations.progressLabel} ${item.progress}%'),
                  ],
                  if (failure != null) ...[
                    const SizedBox(height: AppSpacing.small),
                    Text(
                      failure,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
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
        ),
      ),
    );
  }
}
