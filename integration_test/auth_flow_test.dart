import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/config/app_config.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:video_server_api/video_server_api.dart';

import 'registration_mailbox.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('registers, restores account UI, and signs out', (tester) async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    app.main();
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('public-home-screen')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
    await tester.tap(find.byKey(const Key('public-home-login')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('login-email-field')), findsOneWidget);
    await tester.tap(find.byKey(const Key('go-register-button')));
    await tester.pumpAndSettle();

    final suffix = DateTime.now().microsecondsSinceEpoch.toString();
    final username = 'qa${suffix.substring(suffix.length - 12)}';
    final email = '$username@example.com';
    await tester.enterText(
      find.byKey(const Key('register-username-field')),
      username,
    );
    await tester.enterText(
      find.byKey(const Key('register-email-field')),
      email,
    );
    await tester.enterText(
      find.byKey(const Key('register-password-field')),
      'strong-pass-123',
    );
    await tester.enterText(
      find.byKey(const Key('register-confirm-field')),
      'strong-pass-123',
    );
    await tester.ensureVisible(
      find.byKey(const Key('register-send-code-button')),
    );
    await tester.tap(find.byKey(const Key('register-send-code-button')));
    await _pumpUntilVisible(tester, find.textContaining('验证码已发送'));
    final code = await registrationCodeFromTestInbox(email);
    await tester.enterText(find.byKey(const Key('register-code-field')), code);
    FocusManager.instance.primaryFocus?.unfocus();
    final submit = find.byKey(const Key('register-submit-button'));
    await tester.ensureVisible(submit);
    await tester.pumpAndSettle();
    await tester.tap(submit);
    await _pumpUntilVisible(
      tester,
      find.byKey(const Key('app-bottom-navigation')),
    );

    expect(tester.takeException(), isNull);
    expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);
    expect(find.byKey(const Key('navbar-theme-toggle')), findsOneWidget);

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await _pumpUntilVisible(tester, find.text('暂无下载记录'));
    expect(find.text('下载记录尚未开放'), findsNothing);

    await tester.tap(find.byKey(const Key('app-tab-2')));
    await _pumpUntilVisible(tester, find.text('暂无剧本文档'));
    expect(find.text('剧本文档尚未开放'), findsNothing);

    await tester.tap(find.byKey(const Key('app-tab-3')));
    await _pumpUntilVisible(tester, find.text('YouTube'));
    expect(find.text('YouTube'), findsOneWidget);
    expect(find.text('平台状态尚未开放'), findsNothing);

    await tester.tap(find.byKey(const Key('app-tab-4')));
    await tester.pumpAndSettle();
    expect(find.text(email), findsOneWidget);
    expect(find.text('外观'), findsNothing);
    final updatedUsername = '${username}x';
    await tester.enterText(
      find.byKey(const Key('profile-username-field')),
      updatedUsername,
    );
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.ensureVisible(find.byKey(const Key('profile-save-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('profile-save-button')));
    await _pumpUntilVisible(tester, find.text('个人资料已更新。'));
    expect(find.text(updatedUsername), findsWidgets);

    await tester.ensureVisible(find.byKey(const Key('logout-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('logout-button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('public-home-screen')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
    await tester.tap(find.byKey(const Key('public-home-login')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('login-email-field')), email);
    await tester.enterText(
      find.byKey(const Key('login-password-field')),
      'strong-pass-123',
    );
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.ensureVisible(find.byKey(const Key('login-submit-button')));
    await tester.tap(find.byKey(const Key('login-submit-button')));
    await _pumpUntilVisible(
      tester,
      find.byKey(const Key('app-bottom-navigation')),
    );
    expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);
    await tester.tap(find.byKey(const Key('app-tab-4')));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byKey(const Key('logout-button')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('logout-button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('public-home-screen')), findsOneWidget);
  });

  testWidgets('uses the generated Analysis client against the local service', (
    _,
  ) async {
    final client = VideoServerApi(
      dio: Dio(BaseOptions(baseUrl: AppConfig.serverBaseUrl)),
    );
    final gateway = GeneratedNativeAuthGateway(client);
    final suffix = DateTime.now().microsecondsSinceEpoch.toString();
    final username = 'aiqa${suffix.substring(suffix.length - 12)}';
    await gateway.sendRegistrationCode('$username@example.com');
    final code = await registrationCodeFromTestInbox('$username@example.com');
    final session = await gateway.register(
      verificationCode: code,
      username: username,
      email: '$username@example.com',
      password: 'strong-pass-123',
    );
    addTearDown(() => gateway.logout(session.refreshToken));
    final request = AuthenticatedRequest(
      client: client,
      accessToken: () => session.accessToken,
      sessionGeneration: () => 0,
      refreshSession: () async => false,
      expireSession: () async {},
    );
    final repository = GeneratedAnalysisRepository(request);

    final skills = await repository.fetchSkills(AnalysisInputKind.video);
    expect(skills, isNotEmpty);
    expect(
      skills.any((skill) => skill.inputKinds.contains(AnalysisInputKind.video)),
      isTrue,
    );

    await expectLater(
      repository.create(
        customPrompt: '',
        inputKind: AnalysisInputKind.video,
        idempotencyKey: 'integration-ai-missing-download-$suffix',
        outputLanguage: 'zh-CN',
        skillId: skills.first.id,
        sourceId: '00000000-0000-0000-0000-000000000999',
      ),
      throwsA(
        isA<DataRequestFailure>().having(
          (failure) => failure.statusCode,
          'statusCode',
          404,
        ),
      ),
    );
  });
}

Future<void> _pumpUntilVisible(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  final deadline = DateTime.now().add(timeout);
  while (finder.evaluate().isEmpty && DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}
