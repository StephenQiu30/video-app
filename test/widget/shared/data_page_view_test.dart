import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';

void main() {
  testWidgets('uses the global compact page inset below navigation', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DataPageView(
            title: '标题',
            description: '说明',
            refreshLabel: '刷新',
            onRefresh: () async {},
            children: const [Text('内容')],
          ),
        ),
      ),
    );

    final list = tester.widget<ListView>(find.byType(ListView));
    expect(
      list.padding,
      const EdgeInsets.fromLTRB(
        AppSpacing.pageHorizontal,
        AppSpacing.pageTop,
        AppSpacing.pageHorizontal,
        AppSpacing.pageBottom,
      ),
    );
  });
}
