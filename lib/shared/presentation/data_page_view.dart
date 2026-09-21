import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/shared/presentation/app_page_intro.dart';
import 'package:framegrab/shared/presentation/app_refresh_indicator.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum DataStateActionEmphasis { subtle, primary }

final class DataPageView extends StatelessWidget {
  const DataPageView({
    required this.children,
    required this.description,
    required this.onRefresh,
    required this.refreshLabel,
    required this.title,
    this.compactTitle = false,
    super.key,
  });

  final List<Widget> children;
  final bool compactTitle;
  final String description;
  final Future<void> Function() onRefresh;
  final String refreshLabel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: AppRefreshIndicator(
        onRefresh: onRefresh,
        label: refreshLabel,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.pageHorizontal,
            AppSpacing.pageTop,
            AppSpacing.pageHorizontal,
            AppSpacing.pageBottom,
          ),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppPageIntro(
                      compactTitle: compactTitle,
                      description: description,
                      title: title,
                    ),
                    const SizedBox(height: AppSpacing.section),
                    ...children,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class DataMetricValue {
  const DataMetricValue({
    required this.key,
    required this.label,
    required this.value,
  });

  final String key;
  final String label;
  final String value;
}

/// A responsive, full-width metric group shared by summary and analytics pages.
///
/// Four values stay on one line at the standard phone width. Large accessibility
/// text intentionally falls back to two columns so labels are not clipped.
final class DataMetricGrid extends StatelessWidget {
  const DataMetricGrid({
    required this.keyPrefix,
    required this.metrics,
    super.key,
  });

  final String keyPrefix;
  final List<DataMetricValue> metrics;

  @override
  Widget build(BuildContext context) {
    assert(metrics.isNotEmpty);
    final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;

    return LayoutBuilder(
      builder: (context, constraints) {
        final columnCount = constraints.maxWidth >= 340 && textScale <= 1.25
            ? metrics.length
            : metrics.length.clamp(1, 2);
        const gap = AppSpacing.xSmall;
        final width =
            (constraints.maxWidth - (columnCount - 1) * gap) / columnCount;
        return Wrap(
          spacing: gap,
          runSpacing: AppSpacing.large,
          children: [
            for (final metric in metrics)
              SizedBox(
                key: Key('$keyPrefix-${metric.key}'),
                width: width,
                child: _CenteredDataMetric(
                  label: metric.label,
                  value: metric.value,
                ),
              ),
          ],
        );
      },
    );
  }
}

final class _CenteredDataMetric extends StatelessWidget {
  const _CenteredDataMetric({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final valueStyle = theme.textTheme.headlineSmall;
    final valueLine = TextPainter(
      text: TextSpan(text: 'Ag', style: valueStyle),
      maxLines: 1,
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();
    return Semantics(
      container: true,
      label: '$label: $value',
      child: ExcludeSemantics(
        child: Column(
          children: [
            SizedBox(
              height: valueLine.height,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  value,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: valueStyle,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class DataStateMessage extends StatelessWidget {
  const DataStateMessage({
    required this.description,
    required this.title,
    this.actionEmphasis = DataStateActionEmphasis.subtle,
    this.actionLabel,
    this.actionIcon = PhosphorIconsRegular.arrowClockwise,
    this.icon = PhosphorIconsRegular.tray,
    this.onAction,
    super.key,
  });

  final DataStateActionEmphasis actionEmphasis;
  final IconData? actionIcon;
  final String? actionLabel;
  final String description;
  final IconData icon;
  final VoidCallback? onAction;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxLarge),
        child: Column(
          children: [
            Icon(icon, color: theme.colorScheme.onSurfaceVariant, size: 28),
            const SizedBox(height: AppSpacing.medium),
            Text(title, style: theme.textTheme.titleSmall),
            const SizedBox(height: AppSpacing.xSmall),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: AppSpacing.large),
              if (actionEmphasis == DataStateActionEmphasis.primary)
                if (actionIcon == null)
                  ShadButton(
                    onPressed: onAction,
                    enabled: onAction != null,
                    height: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: Flexible(child: Text(actionLabel!)),
                  )
                else
                  ShadButton(
                    onPressed: onAction,
                    leading: Icon(actionIcon, size: 18),
                    enabled: onAction != null,
                    height: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: Flexible(child: Text(actionLabel!)),
                  )
              else if (actionIcon == null)
                ShadButton.ghost(
                  onPressed: onAction,
                  enabled: onAction != null,
                  height: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Flexible(child: Text(actionLabel!)),
                )
              else
                ShadButton.ghost(
                  onPressed: onAction,
                  leading: Icon(actionIcon, size: 18),
                  enabled: onAction != null,
                  height: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Flexible(child: Text(actionLabel!)),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

final class DataStatusLabel extends StatelessWidget {
  const DataStatusLabel({required this.color, required this.label, super.key});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ShadBadge.secondary(
      backgroundColor: color.withValues(alpha: .1),
      foregroundColor: color,
      child: Text(label),
    );
  }
}
