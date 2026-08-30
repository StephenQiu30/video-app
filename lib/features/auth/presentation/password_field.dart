import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
    super.key,
  });

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
    return TextFormField(
      key: fieldKey,
      controller: controller,
      obscureText: obscure,
      autocorrect: false,
      enableSuggestions: false,
      autofillHints: const [AutofillHints.password],
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          tooltip: toggleLabel,
          onPressed: onToggle,
          icon: Icon(obscure ? LucideIcons.eye : LucideIcons.eyeOff),
        ),
      ),
    );
  }
}
