import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/l10n/app_localizations.dart';

void main() {
  testWidgets('invalid form never saves and pending save cannot be repeated', (
    tester,
  ) async {
    final pending = Completer<void>();
    var calls = 0;
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('zh'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: AdminEditSheet(
            title: '配置',
            fields: [
              TextFormField(
                decoration: const InputDecoration(labelText: '名称'),
                validator: (v) => (v ?? '').isEmpty ? '必填' : null,
              ),
            ],
            onSave: () {
              calls++;
              return pending.future;
            },
          ),
        ),
      ),
    );
    await tester.tap(find.text('保存'));
    await tester.pump();
    expect(calls, 0);
    expect(find.text('必填'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'test');
    await tester.tap(find.text('保存'));
    await tester.pump();
    expect(calls, 1);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    expect(
      tester.widget<TextButton>(find.byType(TextButton)).onPressed,
      isNull,
    );
    pending.completeError(StateError('offline'));
    await tester.pumpAndSettle();
    expect(find.text('管理操作未完成，请刷新后重试。'), findsOneWidget);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNotNull,
    );
  });
}
