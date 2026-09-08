import 'package:framegrab/features/auth/domain/username.dart';
import 'package:framegrab/l10n/app_localizations.dart';

bool isValidAuthEmail(String value) {
  final parts = value.trim().split('@');
  if (parts.length != 2 ||
      parts[0].isEmpty ||
      parts[0].length > 64 ||
      parts[1].isEmpty ||
      parts[1].length > 253 ||
      RegExp(r'\s').hasMatch(value.trim())) {
    return false;
  }
  final labels = parts[1].toLowerCase().split('.');
  if (labels.length < 2 ||
      labels.any(
        (label) =>
            label.isEmpty ||
            label.length > 63 ||
            label.startsWith('-') ||
            label.endsWith('-') ||
            !RegExp(r'^[a-z0-9-]+$').hasMatch(label),
      )) {
    return false;
  }
  return RegExp(r'^[a-z]{2,63}$').hasMatch(labels.last) &&
      !{'example', 'invalid', 'localhost', 'test'}.contains(labels.last);
}

String? validateAuthEmail(String? value, AppLocalizations l) =>
    (value ?? '').trim().isEmpty
    ? l.requiredEmail
    : isValidAuthEmail(value!)
    ? null
    : l.invalidEmail;
String? validateAuthPassword(
  String? value,
  AppLocalizations l, {
  bool registering = false,
}) {
  final length = (value ?? '').runes.length;
  if (length == 0) {
    return registering ? l.requiredNewPassword : l.requiredPassword;
  }
  if (length < 8) return l.invalidPassword;
  if (length > 128) return l.passwordTooLong;
  return null;
}

String? validateAuthUsername(String? value, AppLocalizations l) {
  final text = normalizeUsername(value ?? '');
  if (text.isEmpty) return l.requiredUsername;
  if (text.runes.length < 2) return l.usernameTooShort;
  if (text.runes.length > 32) return l.usernameTooLong;
  return isValidUsername(text) ? null : l.usernameInvalidCharacters;
}
