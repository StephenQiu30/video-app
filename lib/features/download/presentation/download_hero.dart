import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class DownloadHero extends StatelessWidget {
  const DownloadHero({
    required this.busy,
    required this.controller,
    required this.invalid,
    required this.onChanged,
    required this.onClear,
    required this.onSubmit,
    super.key,
  });

  final bool busy;
  final TextEditingController controller;
  final bool invalid;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
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
        LayoutBuilder(
          builder: (context, constraints) {
            final input = _UrlInput(
              controller: controller,
              invalid: invalid,
              onChanged: onChanged,
              onClear: onClear,
              onSubmit: onSubmit,
            );
            final button = FilledButton.icon(
              key: const Key('inspect-media-button'),
              onPressed: busy ? null : onSubmit,
              icon: busy
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.download_outlined, size: 20),
              label: Text(
                busy
                    ? localizations.inspectingMedia
                    : localizations.inspectMedia,
              ),
            );

            if (constraints.maxWidth >= 600) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: input),
                  const SizedBox(width: AppSpacing.xSmall),
                  SizedBox(width: 148, child: button),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                input,
                const SizedBox(height: AppSpacing.xSmall),
                button,
              ],
            );
          },
        ),
      ],
    );
  }
}

final class _UrlInput extends StatelessWidget {
  const _UrlInput({
    required this.controller,
    required this.invalid,
    required this.onChanged,
    required this.onClear,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final bool invalid;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final invalidBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 2,
      ),
    );

    return Semantics(
      label: localizations.mediaUrlLabel,
      child: TextField(
        key: const Key('media-url-input'),
        controller: controller,
        autocorrect: false,
        autofillHints: const [AutofillHints.url],
        enableSuggestions: false,
        keyboardType: TextInputType.url,
        maxLength: 4096,
        onChanged: onChanged,
        onSubmitted: (_) => onSubmit(),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: invalid ? invalidBorder : null,
          focusedBorder: invalid ? invalidBorder : null,
          hintText: localizations.mediaUrlHint,
          prefixIcon: const Icon(Icons.link_rounded, size: 21),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  onPressed: onClear,
                  tooltip: localizations.clearMediaUrl,
                  icon: const Icon(Icons.close_rounded, size: 20),
                ),
        ),
      ),
    );
  }
}
