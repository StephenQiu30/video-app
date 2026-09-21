import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.controller,
    required this.label,
    required this.fieldKey,
    required this.obscure,
    required this.onToggle,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.newPassword = false,
    super.key,
  });

  final bool newPassword;
  final TextEditingController controller;
  final String label;
  final Key fieldKey;
  final bool obscure;
  final VoidCallback onToggle;
  final FormFieldValidator<String> validator;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final toggleLabel = obscure
        ? localizations.showPassword
        : localizations.hidePassword;
    return ShadInputFormField(
      key: fieldKey,
      controller: controller,
      obscureText: obscure,
      autocorrect: false,
      enableSuggestions: false,
      autofillHints: [
        newPassword ? AutofillHints.newPassword : AutofillHints.password,
      ],
      textInputAction: textInputAction,
      validator: validator,
      onSubmitted: onFieldSubmitted,
      label: Text(label),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      trailing: ShadTooltip(
        builder: (context) => Text(toggleLabel),
        child: Semantics(
          label: toggleLabel,
          child: ShadIconButton.ghost(
            onPressed: onToggle,
            icon: Icon(
              obscure
                  ? PhosphorIconsRegular.eye
                  : PhosphorIconsRegular.eyeSlash,
            ),
          ),
        ),
      ),
    );
  }
}
