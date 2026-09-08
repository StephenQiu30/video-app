import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/presentation/auth_validation.dart';
import 'package:framegrab/l10n/app_localizations_zh.dart';

void main() {
  final l = AppLocalizationsZh();
  test('email validation follows the same domain rules as Web', () {
    for (final email in ['member@example.com', 'name+tag@sub.example.cn']) {
      expect(validateAuthEmail(email, l), isNull);
    }
    for (final email in [
      'a@bad.test',
      'a@-host.com',
      'a@host..com',
      'a@host.c',
      'a b@example.com',
      'a@@example.com',
    ]) {
      expect(validateAuthEmail(email, l), l.invalidEmail, reason: email);
    }
    expect(validateAuthEmail('', l), l.requiredEmail);
  });
  test('password bounds count Unicode code points like the server', () {
    expect(validateAuthPassword('😀' * 4, l), l.invalidPassword);
    expect(validateAuthPassword('😀' * 8, l), isNull);
    expect(validateAuthPassword('😀' * 128, l), isNull);
    expect(validateAuthPassword('a' * 129, l), l.passwordTooLong);
    expect(
      validateAuthPassword('', l, registering: true),
      l.requiredNewPassword,
    );
  });
  test('username normalization and errors match Web', () {
    expect(validateAuthUsername(' ＡＢ ', l), isNull);
    expect(validateAuthUsername('', l), l.requiredUsername);
    expect(validateAuthUsername('a', l), l.usernameTooShort);
    expect(validateAuthUsername('a' * 33, l), l.usernameTooLong);
    expect(validateAuthUsername('two words', l), l.usernameInvalidCharacters);
  });
}
