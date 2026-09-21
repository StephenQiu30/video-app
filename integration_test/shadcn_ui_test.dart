import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../test/support/auth_fakes.dart';
import '../test/support/data_fakes.dart';
import '../test/widget/app/test_app.dart';

// Native rendering/interaction evidence with synthetic repositories. This does
// not claim API, authentication provider, download, or AI end-to-end success.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> capture(WidgetTester tester, String name) async {
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await binding.takeScreenshot(name);
  }

  testWidgets('native Shad public, validation, and signed-in home', (
    tester,
  ) async {
    await pumpFramegrabApp(tester, credentialStore: MemoryCredentialStore());
    await capture(tester, 'shad-public-light');
    await tester.tap(find.byKey(const Key('public-home-login')));
    await tester.pumpAndSettle();
    final submit = find.byKey(const Key('login-submit-button'));
    await tester.ensureVisible(submit);
    await tester.tap(submit);
    await tester.pumpAndSettle();
    expect(find.byType(ShadInputFormField), findsWidgets);
    await capture(tester, 'shad-login-validation');
    await tester.enterText(
      find.byKey(const Key('login-email-field')),
      'member@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('login-password-field')),
      'SyntheticOnly123!',
    );
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.ensureVisible(submit);
    await tester.tap(submit);
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);
    await capture(tester, 'shad-home-light');
    await tester.tap(find.byKey(const Key('navbar-theme-toggle')));
    await capture(tester, 'shad-home-dark');
  });

  testWidgets('native Shad history, confirmation and cancellation', (
    tester,
  ) async {
    final history = FakeDownloadHistoryRepository(
      data: downloadHistoryFixture(),
    );
    await pumpFramegrabApp(tester, downloadHistoryRepository: history);
    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();
    final row = find.byKey(
      const Key('download-history-item-00000000-0000-0000-0000-000000000101'),
    );
    await tester.ensureVisible(row);
    await capture(tester, 'shad-history');
    await tester.drag(row, const Offset(-300, 0));
    await tester.pumpAndSettle();
    await tester.tap(
      find.byKey(
        const Key('delete-download-00000000-0000-0000-0000-000000000101'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ShadDialog), findsOneWidget);
    await capture(tester, 'shad-confirmation');
    await tester.tap(find.text('保留任务'));
    await tester.pumpAndSettle();
    expect(history.deleteCalls, isEmpty);
  });

  testWidgets('native Shad sheet validates, handles keyboard, and saves once', (
    tester,
  ) async {
    var saves = 0;
    await tester.pumpWidget(
      ShadApp(
        theme: AppTheme.shadLight,
        locale: const Locale('zh'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ShadButton(
                onPressed: () => showShadSheet<void>(
                  context: context,
                  isDismissible: false,
                  builder: (_) => ShadSheet(
                    draggable: false,
                    closeIcon: const SizedBox.shrink(),
                    isScrollControlled: true,
                    child: AdminEditSheet(
                      title: 'Shad 编辑表单',
                      fields: [
                        ShadInputFormField(
                          label: const Text('名称'),
                          validator: (value) => value.isEmpty ? '必填' : null,
                        ),
                      ],
                      onSave: () async {
                        saves++;
                      },
                    ),
                  ),
                ),
                child: const Text('打开编辑'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('打开编辑'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('保存'));
    await tester.pumpAndSettle();
    expect(find.text('必填'), findsOneWidget);
    await tester.enterText(find.byType(ShadInputFormField), '演示配置');
    await capture(tester, 'shad-sheet-keyboard');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('保存'));
    await tester.tap(find.text('保存'));
    await tester.pumpAndSettle();
    expect(saves, 1);
    expect(find.byType(ShadSheet), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
