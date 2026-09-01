import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class SourceDiscoveryWorkspace extends StatelessWidget {
  const SourceDiscoveryWorkspace({
    required this.busy,
    required this.discovery,
    required this.onSelect,
    super.key,
  });

  final bool busy;
  final SourceDiscoveryResponse discovery;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Column(
      key: const Key('source-discovery-workspace'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.sourceCandidatesTitle,
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          discovery.title,
          style: theme.textTheme.titleMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          localizations.sourceCandidatesDescription,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 20),
        if (discovery.items.isEmpty)
          Text(localizations.sourceCandidatesEmpty)
        else
          ...discovery.items.map((item) {
            final ready =
                item.status == DiscoveryItemStatus.ready &&
                item.decisionHint == DiscoveryDecisionHint.candidate;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Material(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(AppTheme.radius),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  key: Key('source-candidate-${item.itemRef}'),
                  onTap: ready && !busy ? () => onSelect(item.itemRef) : null,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.video,
                          color: ready
                              ? theme.colorScheme.onSurface
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: theme.textTheme.titleSmall,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                ready
                                    ? _duration(item.durationMs)
                                    : localizations.candidateUnavailable,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (busy)
                          const SizedBox.square(
                            dimension: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        else if (ready)
                          const Icon(LucideIcons.chevronRight, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      ],
    );
  }
}

String _duration(int? durationMs) {
  if (durationMs == null) return '—';
  final seconds = durationMs ~/ 1000;
  final minutes = seconds ~/ 60;
  return '$minutes:${(seconds % 60).toString().padLeft(2, '0')}';
}
