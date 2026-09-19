import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/list_filters.dart';
import 'package:framegrab/shared/presentation/list_query.dart';

void main() {
  testWidgets('uses the shared bounded Material 3 status selector', (
    tester,
  ) async {
    String? selectedStatus;
    await tester.pumpWidget(
      MaterialApp(
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

    expect(find.byType(DropdownButtonFormField<String>), findsNothing);
    final selector = tester.widget<DropdownMenu<String>>(
      find.byType(DropdownMenu<String>),
    );
    expect(selector.menuHeight, 304);
    expect(selector.selectOnly, isTrue);
    expect(selector.expandedInsets, EdgeInsets.zero);

    await tester.tap(find.byType(DropdownMenu<String>));
    await tester.pumpAndSettle();
    expect(find.text('全部状态'), findsWidgets);
    expect(find.text('已取消'), findsOneWidget);

    await tester.tap(find.text('已完成').last);
    await tester.pumpAndSettle();
    expect(selectedStatus, 'succeeded');
  });
}
