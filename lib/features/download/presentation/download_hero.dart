import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/download/presentation/content_intake_controls.dart';
import 'package:framegrab/features/download/presentation/link_intake_form.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class DownloadHero extends StatelessWidget {
  const DownloadHero({
    required this.busy,
    required this.controller,
    required this.invalid,
    required this.mode,
    required this.onChanged,
    required this.onClear,
    required this.onModeChanged,
    required this.onPendingAction,
    required this.onSubmit,
    super.key,
  });

  final bool busy;
  final TextEditingController controller;
  final bool invalid;
  final ContentIntakeMode mode;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final ValueChanged<ContentIntakeMode> onModeChanged;
  final VoidCallback onPendingAction;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 600;
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    final titleStyle = wide
        ? theme.textTheme.displayLarge
        : textScale > 1.25
        ? theme.textTheme.headlineLarge
        : theme.textTheme.displayMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          container: true,
          header: true,
          label: localizations.downloadHomeTitle.replaceAll('\n', ' '),
          child: ExcludeSemantics(
            child: Text(localizations.downloadHomeTitle, style: titleStyle),
          ),
        ),
        const SizedBox(height: AppSpacing.large),
        Text(
          localizations.downloadHomeDescription,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.xxLarge),
        ContentIntakeSelector(
          linkLabel: localizations.linkIntakeMode,
          onChanged: onModeChanged,
          screenplayLabel: localizations.screenplayIntakeMode,
          selected: mode,
          videoLabel: localizations.videoIntakeMode,
        ),
        const SizedBox(height: AppSpacing.large),
        if (mode == ContentIntakeMode.link)
          LinkIntakeForm(
            busy: busy,
            controller: controller,
            invalid: invalid,
            onChanged: onChanged,
            onClear: onClear,
            onSubmit: onSubmit,
          )
        else if (mode == ContentIntakeMode.video)
          PendingIntakePanel(
            actionLabel: localizations.selectVideoFile,
            description: localizations.videoIntakeDescription,
            icon: LucideIcons.video,
            onPressed: onPendingAction,
            title: localizations.videoIntakeTitle,
          )
        else
          PendingIntakePanel(
            actionLabel: localizations.selectScreenplayFile,
            description: localizations.screenplayIntakeDescription,
            icon: LucideIcons.fileText,
            onPressed: onPendingAction,
            title: localizations.screenplayIntakeTitle,
          ),
      ],
    );
  }
}
