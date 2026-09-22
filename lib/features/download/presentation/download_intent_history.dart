import 'package:flutter/material.dart';
import 'package:framegrab/features/download/application/download_intent_history_controller.dart';
import 'package:framegrab/features/download/presentation/intake_failure_message.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class DownloadIntentHistory extends StatelessWidget {
  const DownloadIntentHistory({
    required this.busy,
    required this.onLoad,
    required this.onMore,
    required this.onResume,
    required this.state,
    super.key,
  });

  final bool busy;
  final VoidCallback onLoad;
  final VoidCallback onMore;
  final ValueChanged<String> onResume;
  final DownloadIntentHistoryState state;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return ShadAccordion<String>(
      key: const Key('intent-history'),
      children: [
        ShadAccordionItem<String>(
          value: 'history',
          title: Text(localizations.intentHistoryTitle),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShadButton.ghost(
                onPressed: state.loading ? null : onLoad,
                child: Text(localizations.refreshAction),
              ),
              if (state.error case final error?)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(intakeFailureMessage(localizations, error)),
                ),
              if (state.loaded && state.items.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(localizations.intentHistoryEmpty),
                )
              else
                for (final item in state.items)
                  ShadButton.ghost(
                    onPressed: busy ? null : () => onResume(item.id),
                    child: Text(
                      item.title ?? localizations.intentRestoreAction,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              if (state.hasMore)
                ShadButton.outline(
                  onPressed: state.loading ? null : onMore,
                  child: Text(localizations.nextPage),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
