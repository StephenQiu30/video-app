import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/media/application/media_thumbnail_provider.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class AuthenticatedMediaCover extends ConsumerWidget {
  const AuthenticatedMediaCover({
    required this.alt,
    this.borderRadius = BorderRadius.zero,
    this.compact = false,
    this.detail,
    this.eyebrow,
    this.pending = false,
    this.source,
    this.title,
    super.key,
  });

  final String alt;
  final BorderRadius borderRadius;
  final bool compact;
  final String? detail;
  final String? eyebrow;
  final bool pending;
  final String? source;
  final String? title;

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
                  ? MediaCoverFallback(
                      compact: compact,
                      detail: detail,
                      eyebrow: eyebrow,
                      pending: pending,
                      title: title,
                    )
                  : result.when(
                      data: (bytes) => Image.memory(
                        bytes,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      ),
                      error: (_, _) => MediaCoverFallback(
                        compact: compact,
                        detail: detail,
                        eyebrow: eyebrow,
                        title: title,
                      ),
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

final class MediaCoverFallback extends StatelessWidget {
  const MediaCoverFallback({
    this.compact = false,
    this.detail,
    this.eyebrow,
    this.pending = false,
    this.title,
    super.key,
  });

  final String? detail;
  final String? eyebrow;
  final bool compact;
  final bool pending;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final cardColor = colors.brightness == Brightness.dark
        ? colors.surfaceContainerHigh
        : colors.inverseSurface;
    final foreground = colors.brightness == Brightness.dark
        ? colors.onSurface
        : colors.onInverseSurface;
    final label = pending
        ? localizations.mediaCoverPending
        : localizations.mediaCoverUnavailable;
    final cleanEyebrow = _clean(eyebrow);
    final cleanTitle = _clean(title);
    final cleanDetail = _clean(detail);
    final compactMetadata = [
      if (cleanTitle != null) cleanEyebrow,
      cleanDetail,
    ].whereType<String>().join(' · ');
    final compactTitle = cleanTitle ?? cleanEyebrow;
    final labelStyle = theme.textTheme.labelSmall?.copyWith(
      color: foreground.withValues(alpha: 0.72),
      fontSize: compact ? 8 : null,
      fontWeight: FontWeight.w600,
      height: compact ? 1 : null,
      letterSpacing: compact ? 0.1 : 0.2,
    );
    final eyebrowStyle = theme.textTheme.labelSmall?.copyWith(
      color: foreground.withValues(alpha: 0.68),
      letterSpacing: 0.3,
    );
    final titleStyle = theme.textTheme.titleSmall?.copyWith(
      color: foreground,
      fontSize: compact ? 11 : null,
      fontWeight: FontWeight.w700,
      height: compact ? 1.05 : null,
    );
    final detailStyle = theme.textTheme.labelSmall?.copyWith(
      color: foreground.withValues(alpha: 0.72),
      fontSize: compact ? 8 : null,
      height: compact ? 1 : null,
    );
    final titleText = compact
        ? compactTitle ?? localizations.mediaCoverLabel
        : cleanTitle ?? localizations.mediaCoverLabel;
    final supportingText = compact ? compactMetadata : cleanDetail ?? '';

    return DecoratedBox(
      decoration: BoxDecoration(
        color: cardColor,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cardColor,
            Color.alphaBlend(foreground.withValues(alpha: 0.08), cardColor),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(compact ? 6 : 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: labelStyle,
            ),
            if (!compact && cleanEyebrow != null) ...[
              const SizedBox(height: 4),
              Text(
                cleanEyebrow,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: eyebrowStyle,
              ),
            ],
            SizedBox(height: compact ? 2 : 5),
            Text(
              titleText,
              maxLines: compact ? 1 : 2,
              overflow: TextOverflow.ellipsis,
              style: titleStyle,
            ),
            if (supportingText.isNotEmpty) ...[
              SizedBox(height: compact ? 2 : 3),
              Text(
                supportingText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: detailStyle,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

String? _clean(String? value) {
  final normalized = value?.trim();
  return normalized == null || normalized.isEmpty ? null : normalized;
}
