import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/documents/application/document_list_provider.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/destructive_confirmation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class DocumentDeleteButton extends ConsumerStatefulWidget {
  const DocumentDeleteButton({required this.documentId, super.key});

  final String documentId;

  @override
  ConsumerState<DocumentDeleteButton> createState() =>
      _DocumentDeleteButtonState();
}

final class _DocumentDeleteButtonState
    extends ConsumerState<DocumentDeleteButton> {
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
      await ref.read(documentRepositoryProvider).delete(widget.documentId);
      ref.invalidate(documentListProvider);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.operationFailed)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return IconButton(
      key: Key('delete-document-${widget.documentId}'),
      tooltip: l10n.deleteDocumentAction,
      color: Theme.of(context).colorScheme.error,
      onPressed: _busy ? null : _delete,
      icon: _busy
          ? const SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(LucideIcons.trash2, size: 18),
    );
  }
}
