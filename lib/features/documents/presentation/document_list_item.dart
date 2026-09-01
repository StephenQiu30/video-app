import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/documents/application/document_list_provider.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_formatters.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/deletion_failure_message.dart';
import 'package:framegrab/shared/presentation/destructive_confirmation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DocumentListItem extends ConsumerStatefulWidget {
  const DocumentListItem({required this.item, super.key});

  final DocumentResponse item;

  @override
  ConsumerState<DocumentListItem> createState() => _DocumentListItemState();
}

final class _DocumentListItemState extends ConsumerState<DocumentListItem> {
  bool _busy = false;

  Future<void> _delete() async {
    if (_busy) return;
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDestructiveConfirmation(
      context: context,
      title: l10n.deleteDocumentTitle,
      description: l10n.deleteDocumentDescription,
      cancelLabel: l10n.keepDocumentAction,
      confirmLabel: l10n.confirmDeleteAction,
    );
    if (!confirmed || !mounted) return;
    setState(() => _busy = true);
    try {
      await ref.read(documentRepositoryProvider).delete(widget.item.id);
      ref.invalidate(documentListProvider);
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(deletionFailureMessage(l10n, error))),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final l10n = AppLocalizations.of(context);
    final status = _statusLabel(l10n, item.status.name);
    final details = <String>[
      formatByteCount(item.declaredSizeBytes),
      item.sourceFormat.name.toUpperCase(),
      if (item.sceneCount != null) '${l10n.sceneCountLabel} ${item.sceneCount}',
      if (item.characterCount != null)
        '${l10n.characterCountLabel} ${item.characterCount}',
      if (item.detectedLanguage?.isNotEmpty ?? false)
        '${l10n.languageLabel} ${item.detectedLanguage}',
    ];
    final colors = Theme.of(context).colorScheme;
    final deleteAction = CustomSemanticsAction(
      label: l10n.deleteDocumentAction,
    );

    return Slidable(
      key: Key('document-slidable-${item.id}'),
      groupTag: 'document-list',
      enabled: !_busy,
      endActionPane: ActionPane(
        extentRatio: 0.34,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            key: Key('delete-document-${item.id}'),
            onPressed: _busy ? null : (_) => unawaited(_delete()),
            backgroundColor: colors.errorContainer,
            foregroundColor: colors.onErrorContainer,
            icon: LucideIcons.trash2,
            label: l10n.deleteDocumentAction,
          ),
        ],
      ),
      child: Semantics(
        container: true,
        label: '${item.title}, $status, ${item.originalFilename}',
        hint: l10n.documentRowActionsHint,
        customSemanticsActions: {deleteAction: () => unawaited(_delete())},
        child: ExcludeSemantics(
          child: Material(
            color: Colors.transparent,
            child: Padding(
              key: Key('document-list-item-${item.id}'),
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.xSmall),
                  Text(
                    item.originalFilename,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.small),
                  DataStatusLabel(
                    color: _statusColor(context, item.status.name),
                    label: status,
                  ),
                  const SizedBox(height: AppSpacing.small),
                  Text(
                    details.join(' · '),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.small),
                  Text(
                    '${l10n.updatedAtLabel} '
                    '${formatDataTime(context, item.updatedAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colors.onSurfaceVariant,
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
