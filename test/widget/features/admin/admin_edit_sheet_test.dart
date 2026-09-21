import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../support/shad_test_app.dart';

void main() {
  testWidgets('invalid form never saves and pending save cannot be repeated', (
    tester,
  ) async {
    final pending = Completer<void>();
    var calls = 0;
    await pumpShadWidget(
      tester,
      ShadTestApp(
        locale: const Locale('zh'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: AdminEditSheet(
            title: '配置',
            fields: [
              ShadInputFormField(
                label: const Text('名称'),
                validator: (v) => v.isEmpty ? '必填' : null,
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
    await tester.pump();
    await tester.tap(find.text('保存'));
    await tester.pump();
    expect(calls, 0);
    expect(find.text('必填'), findsOneWidget);
    await tester.enterText(find.byType(ShadInputFormField), 'test');
    await tester.tap(find.text('保存'));
    await tester.pump();
    expect(calls, 1);
    expect(
      tester
          .widgetList<ShadButton>(find.byType(ShadButton))
          .every((button) => !button.enabled && button.onPressed == null),
      isTrue,
    );
    expect(calls, 1);
    pending.completeError(StateError('offline'));
    await tester.pumpAndSettle();
    expect(find.text('管理操作未完成，请刷新后重试。'), findsOneWidget);
    expect(
      tester
          .widgetList<ShadButton>(find.byType(ShadButton))
          .every((button) => button.enabled && button.onPressed != null),
      isTrue,
    );
  });
}
