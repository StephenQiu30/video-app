import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/providers/application/provider_status_provider.dart';
import 'package:framegrab/features/providers/presentation/provider_status_item.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:video_server_api/video_server_api.dart';

final class ProviderStatusScreen extends ConsumerWidget {
  const ProviderStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final result = ref.watch(providerStatusProvider);
    return DataPageView(
      title: localizations.providerStatusNavigation,
      description: localizations.providerStatusDescription,
      refreshLabel: localizations.refreshAction,
      onRefresh: () => ref.refresh(providerStatusProvider.future).then((_) {}),
      children: result.when(
        skipLoadingOnRefresh: true,
        data: (data) => _content(context, data),
        error: (_, _) => [
          DataStateMessage(
            icon: LucideIcons.cloudOff,
            title: localizations.loadFailedTitle,
            description: localizations.loadFailedDescription,
            actionLabel: localizations.retryAction,
            onAction: () => ref.invalidate(providerStatusProvider),
          ),
        ],
        loading: () => [
          ProviderStatusSkeleton(label: localizations.loadingData),
        ],
      ),
    );
  }

  List<Widget> _content(BuildContext context, ProviderListResponse data) {
    final localizations = AppLocalizations.of(context);
    if (data.items.isEmpty) {
      return [
        DataStateMessage(
          title: localizations.providerEmptyTitle,
          description: localizations.providerEmptyDescription,
          icon: LucideIcons.activity,
        ),
      ];
    }
    return [
      Wrap(
        spacing: AppSpacing.xLarge,
        children: [
          DataMetric(label: localizations.totalLabel, value: data.items.length),
          DataMetric(
            label: localizations.availableLabel,
            value: data.items.where((item) => item.downloadAvailable).length,
          ),
        ],
      ),
      const SizedBox(height: AppSpacing.xLarge),
      for (final (index, item) in data.items.indexed) ...[
        if (index > 0) const Divider(),
        ProviderStatusItem(item: item),
      ],
    ];
  }
}

final class ProviderStatusSkeleton extends StatelessWidget {
  const ProviderStatusSkeleton({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;
    return Semantics(
      container: true,
      liveRegion: true,
      label: label,
      child: ExcludeSemantics(
        child: Column(
          key: const Key('provider-status-skeleton'),
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var index = 0; index < 3; index += 1) ...[
              if (index > 0) const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 132, height: 18, color: color),
                    const SizedBox(height: AppSpacing.small),
                    Container(height: 13, color: color),
                    const SizedBox(height: AppSpacing.xSmall),
                    Container(width: 220, height: 13, color: color),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
