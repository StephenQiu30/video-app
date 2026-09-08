import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/main.dart' as app;
import 'package:integration_test/integration_test.dart';

// Use only the isolated QA service and a synthetic administrator supplied at run time.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const email = String.fromEnvironment('PARITY_QA_EMAIL');
  const password = String.fromEnvironment('PARITY_QA_PASSWORD');
  testWidgets(
    'admin creates, edits and deletes configurations through native forms',
    (tester) async {
      expect(email, isNotEmpty, reason: 'Provide a synthetic QA admin email');
      await const FlutterSecureStorage().deleteAll();
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('public-home-login')));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('login-email-field')), email);
      await tester.enterText(
        find.byKey(const Key('login-password-field')),
        password,
      );
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.ensureVisible(find.byKey(const Key('login-submit-button')));
      await tester.tap(find.byKey(const Key('login-submit-button')));
      await until(tester, find.byKey(const Key('app-bottom-navigation')));
      await tester.tap(find.byKey(const Key('app-tab-4')));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byKey(const Key('admin-center-entry')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('admin-center-entry')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('平台目录'));
      await until(tester, find.text('新增平台'));
      await tester.tap(find.text('新增平台'));
      await tester.pumpAndSettle();
      final suffix = DateTime.now().millisecondsSinceEpoch.toString();
      await tester.enterText(
        find.widgetWithText(TextFormField, '配置标识'),
        'qa$suffix',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, '显示名称'),
        'QA platform $suffix',
      );
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.ensureVisible(find.text('保存'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('保存'));
      await until(tester, find.text('QA platform $suffix'));
      expect(tester.takeException(), isNull);
      final catalogRow = find.byKey(ValueKey('catalog-qa$suffix'));
      await tester.ensureVisible(catalogRow);
      await tester.pumpAndSettle();
      await tester.tap(
        find.descendant(of: catalogRow, matching: find.text('编辑')),
      );
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextFormField, '显示名称'),
        'QA platform edited $suffix',
      );
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.ensureVisible(find.text('保存'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('保存'));
      await until(tester, find.text('QA platform edited $suffix'));
      await tester.ensureVisible(catalogRow);
      await tester.pumpAndSettle();
      await tester.tap(
        find.descendant(of: catalogRow, matching: find.text('删除')),
      );
      await tester.pumpAndSettle();
      await tester.tap(
        find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('删除'),
        ),
      );
      await gone(tester, find.text('QA platform edited $suffix'));
      await tester.tap(find.byKey(const Key('navbar-back-button')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('AI 服务'));
      await until(tester, find.text('新增 AI 服务'));
      await tester.tap(find.text('新增 AI 服务'));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextFormField, '配置标识'),
        'qa$suffix',
      );
      await tester.enterText(
        find.widgetWithText(TextFormField, '显示名称'),
        'QA AI $suffix',
      );
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.ensureVisible(find.text('保存'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('保存'));
      await until(tester, find.text('QA AI $suffix'));
      final aiRow = find.byKey(ValueKey('ai-qa$suffix'));
      await tester.ensureVisible(aiRow);
      await tester.pumpAndSettle();
      await tester.tap(find.descendant(of: aiRow, matching: find.text('编辑')));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.widgetWithText(TextFormField, '显示名称'),
        'QA AI edited $suffix',
      );
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.ensureVisible(find.text('保存'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('保存'));
      await until(tester, find.text('QA AI edited $suffix'));
      await tester.ensureVisible(aiRow);
      await tester.pumpAndSettle();
      await tester.tap(find.descendant(of: aiRow, matching: find.text('删除')));
      await tester.pumpAndSettle();
      await tester.tap(
        find.descendant(
          of: find.byType(AlertDialog),
          matching: find.text('删除'),
        ),
      );
      await gone(tester, find.text('QA AI edited $suffix'));
      expect(tester.takeException(), isNull);
    },
  );
}

Future<void> until(WidgetTester tester, Finder finder) async {
  for (var i = 0; i < 100 && finder.evaluate().isEmpty; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
  await tester.pumpAndSettle();
  expect(finder, findsWidgets);
}

Future<void> gone(WidgetTester tester, Finder finder) async {
  for (var i = 0; i < 100 && finder.evaluate().isNotEmpty; i++) {
    await tester.pump(const Duration(milliseconds: 200));
  }
  await tester.pumpAndSettle();
  expect(finder, findsNothing);
}
