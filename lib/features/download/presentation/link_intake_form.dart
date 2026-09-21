import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/app_spinner.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
            final button = ShadButton(
              key: const Key('inspect-media-button'),
              onPressed: busy ? null : onSubmit,
              leading: busy
                  ? const SizedBox.square(dimension: 18, child: AppSpinner())
                  : const Icon(PhosphorIconsRegular.download, size: 20),
              enabled: (busy ? null : onSubmit) != null,
              height: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Flexible(
                child: Text(
                  busy
                      ? localizations.inspectingMedia
                      : localizations.inspectMedia,
                ),
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

    return Semantics(
      label: localizations.mediaUrlLabel,
      child: ShadInput(
        key: const Key('media-url-input'),
        controller: controller,
        autocorrect: false,
        autofillHints: const [AutofillHints.url],
        enableSuggestions: false,
        keyboardType: TextInputType.multiline,
        maxLines: 4,
        maxLength: 4096,
        minLines: 1,
        onChanged: onChanged,
        onSubmitted: (_) => onSubmit(),
        textInputAction: TextInputAction.newline,
        decoration: invalid
            ? ShadDecoration(
                border: ShadBorder.all(
                  color: ShadTheme.of(context).colorScheme.destructive,
                ),
                secondaryBorder: ShadBorder.all(
                  color: ShadTheme.of(
                    context,
                  ).colorScheme.destructive.withValues(alpha: .2),
                  width: 3,
                ),
              )
            : null,
        placeholder: Text(localizations.mediaUrlHint),
        leading: const Icon(PhosphorIconsRegular.link, size: 21),
        trailing: controller.text.isEmpty
            ? null
            : ShadTooltip(
                builder: (context) => Text(localizations.clearMediaUrl),
                child: Semantics(
                  label: localizations.clearMediaUrl,
                  child: ShadIconButton.ghost(
                    onPressed: onClear,
                    icon: const Icon(PhosphorIconsRegular.x, size: 20),
                  ),
                ),
              ),
      ),
    );
  }
}
