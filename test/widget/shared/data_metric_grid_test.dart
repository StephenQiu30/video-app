import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/shared/presentation/data_page_view.dart';

void main() {
  testWidgets('keeps four metrics in one evenly-spaced phone row', (
    tester,
  ) async {
    tester.view
      ..devicePixelRatio = 1
      ..physicalSize = const Size(390, 844);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DataMetricGrid(
              keyPrefix: 'analytics',
              metrics: [
                DataMetricValue(key: 'total', label: '全部', value: '51'),
                DataMetricValue(key: 'done', label: '已完成', value: '43'),
                DataMetricValue(key: 'failed', label: '失败', value: '8'),
                DataMetricValue(key: 'active', label: '进行中', value: '0'),
              ],
            ),
          ),
        ),
      ),
    );

    final centers = [
      tester.getCenter(find.byKey(const Key('analytics-total'))),
      tester.getCenter(find.byKey(const Key('analytics-done'))),
      tester.getCenter(find.byKey(const Key('analytics-failed'))),
      tester.getCenter(find.byKey(const Key('analytics-active'))),
    ];
    expect(centers.map((center) => center.dy).toSet(), hasLength(1));
    final gaps = [
      centers[1].dx - centers[0].dx,
      centers[2].dx - centers[1].dx,
      centers[3].dx - centers[2].dx,
    ];
    expect(gaps[0], closeTo(gaps[1], 0.1));
    expect(gaps[1], closeTo(gaps[2], 0.1));
    expect((centers.first.dx + centers.last.dx) / 2, closeTo(195, 0.1));
  });

  testWidgets('falls back to two columns for accessibility text', (
    tester,
  ) async {
    tester.view
      ..devicePixelRatio = 1
      ..physicalSize = const Size(390, 844);
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DataMetricGrid(
            keyPrefix: 'accessible',
            metrics: [
              DataMetricValue(key: 'one', label: '一', value: '1'),
              DataMetricValue(key: 'two', label: '二', value: '2'),
              DataMetricValue(key: 'three', label: '三', value: '3'),
              DataMetricValue(key: 'four', label: '四', value: '4'),
            ],
          ),
        ),
      ),
    );

    final first = tester.getCenter(find.byKey(const Key('accessible-one')));
    final second = tester.getCenter(find.byKey(const Key('accessible-two')));
    final third = tester.getCenter(find.byKey(const Key('accessible-three')));
    expect(first.dy, closeTo(second.dy, 0.1));
    expect(third.dy, greaterThan(first.dy));
  });

  testWidgets('keeps long document metrics in one phone row', (tester) async {
    tester.view
      ..devicePixelRatio = 1
      ..physicalSize = const Size(390, 844);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DataMetricGrid(
              keyPrefix: 'document',
              metrics: [
                DataMetricValue(key: 'format', label: '格式', value: 'FOUNTAIN'),
                DataMetricValue(key: 'language', label: '语言', value: '英文'),
                DataMetricValue(key: 'scenes', label: '场景', value: '1'),
                DataMetricValue(key: 'characters', label: '字符', value: '162'),
              ],
            ),
          ),
        ),
      ),
    );

    final first = tester.getCenter(find.byKey(const Key('document-format')));
    final second = tester.getCenter(find.byKey(const Key('document-language')));
    final third = tester.getCenter(find.byKey(const Key('document-scenes')));
    final fourth = tester.getCenter(
      find.byKey(const Key('document-characters')),
    );
    expect(first.dy, closeTo(second.dy, 0.1));
    expect(first.dy, closeTo(third.dy, 0.1));
    expect(first.dy, closeTo(fourth.dy, 0.1));
    expect(find.text('FOUNTAIN'), findsOneWidget);
  });
}
