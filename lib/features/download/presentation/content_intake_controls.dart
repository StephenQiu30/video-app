import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/core/theme/app_spacing.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _IntakeDestination(
          icon: Icons.link_rounded,
          label: linkLabel,
          mode: ContentIntakeMode.link,
          onChanged: onChanged,
          selected: selected == ContentIntakeMode.link,
        ),
        const SizedBox(width: AppSpacing.xSmall),
        _IntakeDestination(
          icon: Icons.video_file_outlined,
          label: videoLabel,
          mode: ContentIntakeMode.video,
          onChanged: onChanged,
          selected: selected == ContentIntakeMode.video,
        ),
        const SizedBox(width: AppSpacing.xSmall),
        _IntakeDestination(
          icon: Icons.description_outlined,
          label: screenplayLabel,
          mode: ContentIntakeMode.screenplay,
          onChanged: onChanged,
          selected: selected == ContentIntakeMode.screenplay,
        ),
      ],
    );
  }
}

final class PendingIntakePanel extends StatelessWidget {
  const PendingIntakePanel({
    required this.actionLabel,
    required this.description,
    required this.icon,
    required this.onPressed,
    required this.title,
    super.key,
  });

  final String actionLabel;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(color: theme.colorScheme.outline),
          const SizedBox(height: AppSpacing.large),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: theme.colorScheme.onSurfaceVariant, size: 24),
              const SizedBox(width: AppSpacing.small),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleSmall),
                    const SizedBox(height: AppSpacing.xSmall),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xLarge),
          FilledButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 20),
            label: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}

final class _IntakeDestination extends StatelessWidget {
  const _IntakeDestination({
    required this.icon,
    required this.label,
    required this.mode,
    required this.onChanged,
    required this.selected,
  });

  final IconData icon;
  final String label;
  final ContentIntakeMode mode;
  final ValueChanged<ContentIntakeMode> onChanged;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Semantics(
        button: true,
        selected: selected,
        child: Material(
          color: selected ? context.appColors.input : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () => onChanged(mode),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 64),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: selected
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onSurfaceVariant,
                      size: 20,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: selected
                            ? theme.colorScheme.onSurface
                            : theme.colorScheme.onSurfaceVariant,
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
