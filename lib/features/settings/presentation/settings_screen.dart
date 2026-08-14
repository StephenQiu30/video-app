import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/core/theme/theme_mode_controller.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_page_intro.dart';

final class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final themeMode = ref.watch(themeModeProvider);
    final dark = themeMode.resolvesToDark(
      MediaQuery.platformBrightnessOf(context),
    );

    return SafeArea(
      top: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 32),
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Semantics(
                container: true,
                explicitChildNodes: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppPageIntro(
                      description: localizations.accountDescription,
                      title: localizations.accountNavigation,
                    ),
                    const SizedBox(height: AppSpacing.section),
                    _SectionLabel(label: localizations.appearanceSection),
                    const SizedBox(height: AppSpacing.xSmall),
                    SwitchListTile(
                      key: const Key('dark-theme-switch'),
                      contentPadding: EdgeInsets.zero,
                      secondary: Icon(
                        dark
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                      ),
                      title: Text(localizations.darkThemeLabel),
                      subtitle: Text(localizations.themeToggleDescription),
                      value: dark,
                      onChanged: (value) {
                        ref
                            .read(themeModeProvider.notifier)
                            .setDark(dark: value);
                      },
                    ),
                    const Divider(),
                    const SizedBox(height: AppSpacing.xxLarge),
                    _SectionLabel(label: localizations.accountSection),
                    const SizedBox(height: AppSpacing.small),
                    Semantics(
                      container: true,
                      child: Text(
                        localizations.nativeContractPendingShort,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      header: true,
      label: label,
      child: ExcludeSemantics(
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
