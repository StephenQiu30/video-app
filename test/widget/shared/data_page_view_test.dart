import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';

import '../../support/shad_test_app.dart';

void main() {
  testWidgets('uses the global compact page inset below navigation', (
    tester,
  ) async {
    await pumpShadWidget(
      tester,
      ShadTestApp(
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
    await tester.pump();

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

  testWidgets('keeps metrics and state messages left aligned', (tester) async {
    await pumpShadWidget(
      tester,
      const ShadTestApp(
        home: Scaffold(
          body: Column(
            children: [
              DataMetricGrid(
                keyPrefix: 'summary',
                metrics: [
                  DataMetricValue(key: 'total', label: '全部', value: '81'),
                ],
              ),
              DataStateMessage(title: '暂时无法读取数据', description: '请检查网络连接后重试。'),
            ],
          ),
        ),
      ),
    );

    expect(tester.widget<Text>(find.text('81')).textAlign, TextAlign.start);
    expect(tester.widget<Text>(find.text('全部')).textAlign, TextAlign.start);
    expect(
      tester.widget<Text>(find.text('请检查网络连接后重试。')).textAlign,
      TextAlign.start,
    );
    final stateColumn = tester.widget<Column>(
      find
          .ancestor(of: find.text('暂时无法读取数据'), matching: find.byType(Column))
          .first,
    );
    expect(stateColumn.crossAxisAlignment, CrossAxisAlignment.start);
  });
}
