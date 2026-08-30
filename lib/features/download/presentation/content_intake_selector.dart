import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum ContentIntakeMode { link, video, screenplay }

final class ContentIntakeSelector extends StatelessWidget {
  const ContentIntakeSelector({
    required this.linkLabel,
    required this.onChanged,
    required this.screenplayLabel,
    required this.selected,
    required this.videoLabel,
    super.key,
  });

  final String linkLabel;
  final ValueChanged<ContentIntakeMode> onChanged;
  final String screenplayLabel;
  final ContentIntakeMode selected;
  final String videoLabel;

  @override
  Widget build(BuildContext context) {
    final destinations = [
      (icon: LucideIcons.link, label: linkLabel, mode: ContentIntakeMode.link),
      (
        icon: LucideIcons.video,
        label: videoLabel,
        mode: ContentIntakeMode.video,
      ),
      (
        icon: LucideIcons.fileText,
        label: screenplayLabel,
        mode: ContentIntakeMode.screenplay,
      ),
    ];
    final useStackedLayout = MediaQuery.textScalerOf(context).scale(12) > 15;

    if (useStackedLayout) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final (index, destination) in destinations.indexed) ...[
            if (index > 0) const SizedBox(height: AppSpacing.xSmall),
            _IntakeDestination(
              horizontal: true,
              icon: destination.icon,
              label: destination.label,
              mode: destination.mode,
              onChanged: onChanged,
              selected: selected == destination.mode,
            ),
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final (index, destination) in destinations.indexed) ...[
          if (index > 0) const SizedBox(width: AppSpacing.xSmall),
          Expanded(
            child: _IntakeDestination(
              horizontal: false,
              icon: destination.icon,
              label: destination.label,
              mode: destination.mode,
              onChanged: onChanged,
              selected: selected == destination.mode,
            ),
          ),
        ],
      ],
    );
  }
}

final class _IntakeDestination extends StatelessWidget {
  const _IntakeDestination({
    required this.horizontal,
    required this.icon,
    required this.label,
    required this.mode,
    required this.onChanged,
    required this.selected,
  });

  final bool horizontal;
  final IconData icon;
  final String label;
  final ContentIntakeMode mode;
  final ValueChanged<ContentIntakeMode> onChanged;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground = selected
        ? theme.colorScheme.onSurface
        : theme.colorScheme.onSurfaceVariant;
    final labelStyle = theme.textTheme.labelSmall?.copyWith(
      color: foreground,
      fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
    );

    final content = horizontal
        ? Row(
            children: [
              Icon(icon, color: foreground, size: 21),
              const SizedBox(width: AppSpacing.small),
              Expanded(child: Text(label, style: labelStyle)),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: foreground, size: 22),
              const SizedBox(height: 7),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: labelStyle,
              ),
              const SizedBox(height: 9),
              AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                curve: Curves.easeOut,
                width: 48,
                height: 2,
                color: selected ? foreground : Colors.transparent,
              ),
            ],
          );

    return Semantics(
      key: ValueKey('content-intake-${mode.name}'),
      button: true,
      selected: selected,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onChanged(mode),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: horizontal ? 56 : 76),
            child: Padding(
              padding: horizontal
                  ? const EdgeInsets.symmetric(
                      horizontal: AppSpacing.medium,
                      vertical: AppSpacing.small,
                    )
                  : const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}
