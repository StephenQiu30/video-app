import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/media/application/media_thumbnail_provider.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class AuthenticatedMediaCover extends ConsumerWidget {
  const AuthenticatedMediaCover({
    required this.alt,
    this.borderRadius = BorderRadius.zero,
    this.pending = false,
    this.source,
    super.key,
  });

  final String alt;
  final BorderRadius borderRadius;
  final bool pending;
  final String? source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final normalized = source?.trim();
    final result = normalized == null || normalized.isEmpty
        ? null
        : ref.watch(mediaThumbnailProvider(normalized));
    return Semantics(
      image: true,
      label: alt,
      child: ExcludeSemantics(
        child: AspectRatio(
          aspectRatio: 1.86,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: ColoredBox(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: result == null
                  ? _CoverFallback(pending: pending)
                  : result.when(
                      data: (bytes) => Image.memory(
                        bytes,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      ),
                      error: (_, _) => const _CoverFallback(),
                      loading: () => const _CoverLoading(),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _CoverLoading extends StatelessWidget {
  const _CoverLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(strokeWidth: 2));
  }
}

final class _CoverFallback extends StatelessWidget {
  const _CoverFallback({this.pending = false});

  final bool pending;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final color = Theme.of(context).colorScheme.onSurfaceVariant;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            pending ? LucideIcons.image : LucideIcons.imageOff,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            pending
                ? localizations.mediaCoverPending
                : localizations.mediaCoverUnavailable,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
