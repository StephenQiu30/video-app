import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/theme/app_theme.dart';
import 'package:framegrab/features/analysis/data/analysis_report_file_actions.dart';
import 'package:framegrab/features/analysis/presentation/analysis_report_preview.dart';
import 'package:framegrab/l10n/app_localizations.dart';

void main() {
  testWidgets('opens immediately, then renders the report after navigation', (
    tester,
  ) async {
    final actions = _FakeReportFileActions();
    await tester.pumpWidget(_app(actions));

    await tester.tap(find.byKey(const Key('open-analysis-report')));
    await tester.pump(const Duration(milliseconds: 50));

    expect(
      find.byKey(const Key('analysis-report-screen'), skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('analysis-report-loading'), skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('analysis-markdown-preview'), skipOffstage: false),
      findsNothing,
    );

    await tester.pumpAndSettle();
    expect(find.byKey(const Key('analysis-report-loading')), findsNothing);
    expect(find.byKey(const Key('analysis-markdown-preview')), findsOneWidget);
    expect(find.text('核心结论'), findsOneWidget);
  });

  testWidgets('downloads and exports the Markdown source', (tester) async {
    final actions = _FakeReportFileActions();
    await tester.pumpWidget(_app(actions));

    await tester.tap(find.byKey(const Key('open-analysis-report')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('download-analysis-report')));
    await tester.pump();
    expect(actions.downloads, [('测试标题', '# 核心结论\n\n正文')]);

    await tester.tap(find.byKey(const Key('export-analysis-report')));
    await tester.pump();
    expect(actions.exports, [('测试标题', '# 核心结论\n\n正文')]);
  });

  testWidgets('uses the Web monochrome primary action for report downloads', (
    tester,
  ) async {
    await tester.pumpWidget(_app(_FakeReportFileActions()));

    await tester.tap(find.byKey(const Key('open-analysis-report')));
    await tester.pumpAndSettle();

    final button = tester.widget<FilledButton>(
      find.byKey(const Key('download-analysis-report')),
    );
    expect(button.style?.backgroundColor?.resolve({}), isNull);
    expect(
      Theme.of(
        tester.element(find.byKey(const Key('download-analysis-report'))),
      ).colorScheme.primary,
      const Color(0xFF111111),
    );
  });
}

Widget _app(AnalysisReportFileActions actions) => ProviderScope(
  child: MaterialApp(
    theme: AppTheme.light,
    locale: const Locale('zh'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: AnalysisReportLauncher(
        title: '测试标题',
        markdown: '# 核心结论\n\n正文',
        fileActions: actions,
      ),
    ),
  ),
);

final class _FakeReportFileActions implements AnalysisReportFileActions {
  final downloads = <(String, String)>[];
  final exports = <(String, String)>[];

  @override
  Future<void> download({
    required String markdown,
    required String title,
  }) async {
    downloads.add((title, markdown));
  }

  @override
  Future<void> export({
    required String markdown,
    required Rect shareOrigin,
    required String title,
  }) async {
    exports.add((title, markdown));
  }
}
