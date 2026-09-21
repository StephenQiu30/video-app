import 'package:flutter/widgets.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ContentIntakeMode { link, video, screenplay }

final class ContentIntakeSelector extends StatelessWidget {
  const ContentIntakeSelector({
    required this.linkLabel,
    required this.onChanged,
    required this.screenplayLabel,
    required this.selected,
    required this.videoLabel,
    this.enabled = true,
    super.key,
  });

  final String linkLabel;
  final ValueChanged<ContentIntakeMode> onChanged;
  final String screenplayLabel;
  final ContentIntakeMode selected;
  final String videoLabel;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final destinations = [
      (
        icon: PhosphorIconsRegular.linkSimple,
        label: linkLabel,
        mode: ContentIntakeMode.link,
      ),
      (
        icon: PhosphorIconsRegular.fileVideo,
        label: videoLabel,
        mode: ContentIntakeMode.video,
      ),
      (
        icon: PhosphorIconsRegular.fileText,
        label: screenplayLabel,
        mode: ContentIntakeMode.screenplay,
      ),
    ];
    // Large text uses wrapping, full-width Shad buttons rather than clipped tabs.
    if (MediaQuery.textScalerOf(context).scale(12) > 15) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 4,
        children: [
          for (final destination in destinations)
            Semantics(
              key: ValueKey('content-intake-${destination.mode.name}'),
              selected: selected == destination.mode,
              button: true,
              label: destination.label,
              excludeSemantics: true,
              enabled: enabled,
              onTap: enabled ? () => onChanged(destination.mode) : null,
              child: ShadButton.raw(
                enabled: enabled,
                variant: selected == destination.mode
                    ? ShadButtonVariant.secondary
                    : ShadButtonVariant.ghost,
                height: 0,
                expands: true,
                padding: const EdgeInsets.all(16),
                mainAxisAlignment: MainAxisAlignment.start,
                leading: Icon(destination.icon, size: 20),
                onPressed: enabled ? () => onChanged(destination.mode) : null,
                child: Text(destination.label),
              ),
            ),
        ],
      );
    }
    return ShadTabs<ContentIntakeMode>(
      value: selected,
      onChanged: onChanged,
      padding: EdgeInsets.zero,
      decoration: const ShadDecoration(
        color: Color(0x00000000),
        border: ShadBorder.none,
      ),
      tabs: [
        for (final destination in destinations)
          ShadTab(
            key: ValueKey('content-intake-${destination.mode.name}'),
            value: destination.mode,
            enabled: enabled,
            height: 44,
            backgroundColor: const Color(0x00000000),
            selectedBackgroundColor: const Color(0x00000000),
            hoverBackgroundColor: const Color(0x00000000),
            selectedHoverBackgroundColor: const Color(0x00000000),
            shadows: const [],
            selectedShadows: const [],
            decoration: const ShadDecoration(
              border: ShadBorder(
                canMerge: false,
                radius: BorderRadius.zero,
                bottom: ShadBorderSide(width: 2, color: Color(0x00000000)),
              ),
            ),
            selectedDecoration: ShadDecoration(
              border: ShadBorder(
                canMerge: false,
                radius: BorderRadius.zero,
                bottom: ShadBorderSide(
                  width: 2,
                  color: ShadTheme.of(context).colorScheme.foreground,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            leading: Icon(destination.icon, size: 18),
            child: Flexible(
              child: Text(destination.label, textAlign: TextAlign.center),
            ),
          ),
      ],
    );
  }
}
