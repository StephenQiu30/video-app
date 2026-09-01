import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/analysis/presentation/analysis_report_preview.dart';

void main() {
  testWidgets('renders report Markdown as themed rich content', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(
          body: SingleChildScrollView(
            child: AnalysisReportPreview(
              markdown: '''
# 分析报告

## 核心结论

**重点内容**与普通正文。

- 第一项
- 第二项

| 指标 | 结果 |
| --- | --- |
| 节奏 | 稳定 |
''',
            ),
          ),
        ),
      ),
    );

    expect(find.byKey(const Key('analysis-markdown-preview')), findsOneWidget);
    expect(find.byType(MarkdownBody), findsOneWidget);
    expect(find.text('分析报告'), findsOneWidget);
    expect(find.text('核心结论'), findsOneWidget);
    expect(find.text('# 分析报告'), findsNothing);
    expect(find.text('| 指标 | 结果 |'), findsNothing);
  });

  testWidgets('adapts the report renderer to dark theme', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: const Scaffold(body: AnalysisReportPreview(markdown: '> 深色主题引用')),
      ),
    );

    final context = tester.element(
      find.byKey(const Key('analysis-markdown-preview')),
    );
    expect(Theme.of(context).brightness, Brightness.dark);
    expect(find.text('深色主题引用'), findsOneWidget);
  });
}
