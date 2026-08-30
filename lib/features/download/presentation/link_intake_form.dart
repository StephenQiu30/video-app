import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final class LinkIntakeForm extends StatelessWidget {
  const LinkIntakeForm({
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                  : const Icon(LucideIcons.download, size: 20),
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
        const SizedBox(height: AppSpacing.small),
        Text(
          localizations.linkIntakeSupport,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.55,
          ),
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
          prefixIcon: const Icon(LucideIcons.link, size: 21),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  onPressed: onClear,
                  tooltip: localizations.clearMediaUrl,
                  icon: const Icon(LucideIcons.x, size: 20),
                ),
        ),
      ),
    );
  }
}
