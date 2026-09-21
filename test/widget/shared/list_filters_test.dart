import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/list_filters.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../support/shad_test_app.dart';

void main() {
  testWidgets('uses the shared bounded Shad status selector', (tester) async {
    String? selectedStatus;
    await pumpShadWidget(
      tester,
      ShadTestApp(
        locale: const Locale('zh'),
        theme: AppTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: ListFilters(
            query: const ListQuery(),
            searchLabel: '搜索下载记录',
            statuses: const {
              'queued': '排队中',
              'running': '下载中',
              'retryWait': '等待重试',
              'succeeded': '已完成',
              'failed': '失败',
              'cancelled': '已取消',
            },
            onSearch: (_) {},
            onStatus: (value) => selectedStatus = value,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(DropdownButtonFormField<String>), findsNothing);
    final selector = tester.widget<ShadSelect<String>>(
      find.byType(ShadSelect<String>),
    );
    expect(selector.maxHeight, 304);

    await tester.tap(find.byType(ShadSelect<String>));
    await tester.pumpAndSettle();
    expect(find.text('全部状态'), findsWidgets);
    expect(find.text('已取消'), findsOneWidget);

    await tester.tap(find.text('已完成').last);
    await tester.pumpAndSettle();
    expect(selectedStatus, 'succeeded');
  });
}
