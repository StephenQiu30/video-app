import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/presentation/registration_code_field.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

class CodeGateway implements NativeAuthGateway {
  final result = Completer<RegistrationCodeResponse>();
  final emails = <String>[];
  @override
  Future<RegistrationCodeResponse> sendRegistrationCode(String email) {
    emails.add(email);
    return result.future;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  Future<void> show(WidgetTester tester, CodeGateway gateway) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [nativeAuthGatewayProvider.overrideWithValue(gateway)],
        child: MaterialApp(
          locale: const Locale('zh'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: RegistrationCodeField(
              email: 'member@example.com',
              controller: controller,
              disabled: false,
              onSendingChanged: (_) {},
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets(
    'sends once, waits for acceptance, and enforces resend cooldown',
    (tester) async {
      final gateway = CodeGateway();
      await show(tester, gateway);
      final button = find.byKey(const Key('register-send-code-button'));
      await tester.tap(button);
      await tester.pump();
      expect(find.text('正在发送…'), findsOneWidget);
      await tester.tap(button);
      expect(gateway.emails, ['member@example.com']);
      gateway.result.complete(
        RegistrationCodeResponse(
          (b) => b
            ..emailSent = true
            ..retryAfterSeconds = 60
            ..expiresInSeconds = 600,
        ),
      );
      await tester.pumpAndSettle();
      expect(find.textContaining('验证码已发送'), findsOneWidget);
      expect(tester.widget<OutlinedButton>(button).onPressed, isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets('shows send failure and allows an explicit retry', (
    tester,
  ) async {
    final gateway = CodeGateway();
    await show(tester, gateway);
    final button = find.byKey(const Key('register-send-code-button'));
    await tester.tap(button);
    gateway.result.completeError(
      const AuthRequestFailure(AuthFailureKind.emailSendFailed),
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('邮件发送未能确认'), findsOneWidget);
    expect(find.textContaining('验证码已发送'), findsNothing);
    expect(tester.widget<OutlinedButton>(button).onPressed, isNotNull);
  });
}
