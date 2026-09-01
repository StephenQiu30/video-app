import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/documents/application/document_list_provider.dart';
import 'package:framegrab/features/documents/presentation/document_list_item.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:framegrab/shared/presentation/swipe_action_hint.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class DocumentListScreen extends ConsumerWidget {
  const DocumentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final result = ref.watch(documentListProvider);
    return DataPageView(
      title: localizations.screenplayDocumentsNavigation,
      description: localizations.screenplayDocumentsDescription,
      refreshLabel: localizations.refreshAction,
      onRefresh: () => ref.refresh(documentListProvider.future).then((_) {}),
      children: result.when(
        data: (data) => _content(context, data),
        error: (_, _) => [
          DataStateMessage(
            icon: LucideIcons.cloudOff,
            title: localizations.loadFailedTitle,
            description: localizations.loadFailedDescription,
            actionLabel: localizations.retryAction,
            onAction: () => ref.invalidate(documentListProvider),
          ),
        ],
        loading: () => [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Center(child: CircularProgressIndicator()),
          ),
          Center(child: Text(localizations.loadingData)),
        ],
      ),
    );
  }

  List<Widget> _content(BuildContext context, DocumentPageResponse data) {
    final localizations = AppLocalizations.of(context);
    if (data.items.isEmpty) {
      return [
        DataStateMessage(
          title: localizations.documentEmptyTitle,
          description: localizations.documentEmptyDescription,
          icon: LucideIcons.fileText,
        ),
      ];
    }
    return [
      DataMetricGrid(
        keyPrefix: 'document-summary',
        metrics: [
          DataMetricValue(
            key: 'total',
            label: localizations.totalLabel,
            value: '${data.total}',
          ),
          DataMetricValue(
            key: 'available',
            label: localizations.availableLabel,
            value:
                '${data.items.where((item) => item.status.name == 'ready').length}',
          ),
        ],
      ),
      const SizedBox(height: AppSpacing.xLarge),
      SwipeActionHint(label: localizations.documentRowActionsHint),
      const SizedBox(height: AppSpacing.small),
      SlidableAutoCloseBehavior(
        child: Column(
          children: [
            for (final item in data.items) DocumentListItem(item: item),
          ],
        ),
      ),
      if (data.total > data.items.length) ...[
        const SizedBox(height: AppSpacing.large),
        Text(
          localizations.showingFirstPage,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    ];
  }
}
