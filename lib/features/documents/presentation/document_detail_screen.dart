import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/documents/application/document_detail_provider.dart';
import 'package:framegrab/features/documents/application/document_list_provider.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:framegrab/features/documents/presentation/document_detail_content.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_navigation_bar.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/deletion_failure_message.dart';
import 'package:framegrab/shared/presentation/destructive_confirmation.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class DocumentDetailScreen extends ConsumerStatefulWidget {
  const DocumentDetailScreen({required this.documentId, super.key});

  final String documentId;

  @override
  ConsumerState<DocumentDetailScreen> createState() =>
      _DocumentDetailScreenState();
}

final class _DocumentDetailScreenState
    extends ConsumerState<DocumentDetailScreen> {
  bool _deleting = false;

  Future<void> _delete() async {
    if (_deleting) return;
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDestructiveConfirmation(
      context: context,
      title: l10n.deleteDocumentTitle,
      description: l10n.deleteDocumentDescription,
      cancelLabel: l10n.keepDocumentAction,
      confirmLabel: l10n.confirmDeleteAction,
    );
    if (!confirmed || !mounted) return;
    setState(() => _deleting = true);
    try {
      await ref.read(documentRepositoryProvider).delete(widget.documentId);
      ref.invalidate(documentListProvider);
      ref.invalidate(documentDetailProvider(widget.documentId));
      if (!mounted) return;
      if (context.canPop()) {
        context.pop();
      } else {
        context.go('/');
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(deletionFailureMessage(l10n, error))),
      );
      setState(() => _deleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final result = ref.watch(documentDetailProvider(widget.documentId));
    Future<void> refresh() => ref
        .refresh(documentDetailProvider(widget.documentId).future)
        .then((_) {});

    return Scaffold(
      appBar: const AppNavigationBar(backFallbackLocation: '/'),
      body: result.when(
        skipLoadingOnRefresh: true,
        data: (document) => DataPageView(
          compactTitle: true,
          title: document.title,
          description: document.originalFilename,
          refreshLabel: l10n.refreshAction,
          onRefresh: refresh,
          children: [
            DocumentDetailContent(
              deleting: _deleting,
              document: document,
              onDelete: _delete,
            ),
          ],
        ),
        error: (_, _) => DataPageView(
          title: l10n.screenplayDocumentDetailNavigation,
          description: l10n.screenplayDocumentDetailDescription,
          refreshLabel: l10n.refreshAction,
          onRefresh: refresh,
          children: [
            DataStateMessage(
              icon: LucideIcons.cloudOff,
              title: l10n.loadFailedTitle,
              description: l10n.loadFailedDescription,
              actionLabel: l10n.retryAction,
              onAction: () =>
                  ref.invalidate(documentDetailProvider(widget.documentId)),
            ),
          ],
        ),
        loading: () => DataPageView(
          title: l10n.screenplayDocumentDetailNavigation,
          description: l10n.screenplayDocumentDetailDescription,
          refreshLabel: l10n.refreshAction,
          onRefresh: refresh,
          children: const [DocumentDetailSkeleton()],
        ),
      ),
    );
  }
}
