import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('registers, restores account UI, and signs out', (tester) async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    app.main();
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('login-email-field')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
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

    await tester.tap(find.byKey(const Key('logout-button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('login-email-field')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
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
