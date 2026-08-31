import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/download/presentation/content_intake_controls.dart';
import 'package:go_router/go_router.dart';

import '../../support/analysis_fakes.dart';
import '../../support/auth_fakes.dart';
import '../../support/data_fakes.dart';
import 'test_app.dart';

void main() {
  final scenarios = [
    (
      locale: const Locale('zh'),
      intakeLabels: const ['链接解析', '本地视频', '剧本文档'],
      intakeTitles: const ['导入本地视频', '导入剧本文档'],
      navigationLabels: const ['首页', '历史', '文档', '状态', '我的'],
      navigationTitles: const ['把素材，\n带回本地。', '下载记录', '剧本文档', '平台状态', '我的'],
    ),
    (
      locale: const Locale('en'),
      intakeLabels: const ['Link', 'Local video', 'Screenplay'],
      intakeTitles: const ['Import a local video', 'Import a screenplay'],
      navigationLabels: const ['Home', 'History', 'Documents', 'Status', 'Me'],
      navigationTitles: const [
        'Bring content\nback to your device.',
        'Download history',
        'Screenplays',
        'Provider status',
        'Me',
      ],
    ),
  ];

  for (final scenario in scenarios) {
    testWidgets(
      'keeps intake and navigation usable with accessibility text in ${scenario.locale.languageCode}',
      (tester) async {
        await setMobileViewport(tester);
        setAccessibilityTextScale(tester);
        await pumpFramegrabApp(tester, locale: scenario.locale);
        final semanticsHandle = tester.ensureSemantics();

        expect(tester.takeException(), isNull);
        final selector = find.byType(ContentIntakeSelector);
        final selectorRect = tester.getRect(selector);
        final intakeRects = [
          for (final mode in ContentIntakeMode.values)
            tester.getRect(find.byKey(Key('content-intake-${mode.name}'))),
        ];
        expect(intakeRects[0].top, lessThan(intakeRects[1].top));
        expect(intakeRects[1].top, lessThan(intakeRects[2].top));
        for (final rect in intakeRects) {
          expect(rect.width, closeTo(selectorRect.width, 0.01));
        }

        void expectIntakeState(ContentIntakeMode selectedMode) {
          for (final (index, mode) in ContentIntakeMode.values.indexed) {
            final semantics = tester.getSemantics(
              find.byKey(Key('content-intake-${mode.name}')),
            );
            expect(semantics.label, contains(scenario.intakeLabels[index]));
            expect(semantics.flagsCollection.isButton, isTrue);
            expect(
              semantics.flagsCollection.isSelected,
              mode == selectedMode ? ui.Tristate.isTrue : ui.Tristate.isFalse,
            );
          }
        }

        expectIntakeState(ContentIntakeMode.link);

        expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);

        Finder destinationSemantics(int index) =>
            find.byKey(Key('app-tab-$index'));

        void expectDestinationState(int selectedIndex) {
          for (final (index, label) in scenario.navigationLabels.indexed) {
            final destination = destinationSemantics(index);
            expect(destination, findsOneWidget);
            final semantics = tester.getSemantics(destination);
            expect(semantics.label, contains(label));
            expect(
              semantics.flagsCollection.isSelected,
              index == selectedIndex ? ui.Tristate.isTrue : ui.Tristate.isFalse,
            );
            expect(semantics.role, ui.SemanticsRole.tab);
          }
        }

        expectDestinationState(0);

        for (final (index, label) in scenario.intakeLabels.skip(1).indexed) {
          final target = find.text(label).first;
          await tester.ensureVisible(target);
          await tester.pumpAndSettle();
          await tester.tap(target);
          await tester.pumpAndSettle();
          expect(find.text(scenario.intakeTitles[index]), findsOneWidget);
          expectIntakeState(ContentIntakeMode.values[index + 1]);
          expect(tester.takeException(), isNull);
        }

        final linkTarget = find.text(scenario.intakeLabels.first);
        await tester.ensureVisible(linkTarget);
        await tester.pumpAndSettle();
        await tester.tap(linkTarget);
        await tester.pumpAndSettle();
        expectIntakeState(ContentIntakeMode.link);
        await tester.enterText(
          find.byKey(const Key('media-url-input')),
          'https://media.example/kept',
        );

        for (final (index, _) in scenario.navigationLabels.indexed) {
          await tester.tap(destinationSemantics(index));
          await tester.pumpAndSettle();
          expect(find.text(scenario.navigationTitles[index]), findsWidgets);
          expectDestinationState(index);
          expect(tester.takeException(), isNull);
        }

        await tester.tap(destinationSemantics(0));
        await tester.pumpAndSettle();

        final input = tester.widget<TextField>(
          find.byKey(const Key('media-url-input')),
        );
        expect(input.controller?.text, 'https://media.example/kept');
        expect(tester.takeException(), isNull);
        semanticsHandle.dispose();
      },
    );
  }

  testWidgets('keeps the public home usable with accessibility text', (
    tester,
  ) async {
    await setMobileViewport(tester);
    setAccessibilityTextScale(tester);
    await pumpFramegrabApp(
      tester,
      authGateway: FakeAuthGateway(),
      credentialStore: MemoryCredentialStore(),
    );

    expect(find.byKey(const Key('public-home-screen')), findsOneWidget);
    expect(find.byKey(const Key('public-home-login')), findsOneWidget);
    expect(find.byKey(const Key('public-home-register')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('keeps the AI analysis entry usable with accessibility text', (
    tester,
  ) async {
    await setMobileViewport(tester);
    setAccessibilityTextScale(tester);
    await pumpFramegrabApp(
      tester,
      analysisRepository: FakeAnalysisRepository(),
      downloadHistoryRepository: FakeDownloadHistoryRepository(
        data: downloadHistoryFixture(),
      ),
    );
    final semanticsHandle = tester.ensureSemantics();

    tester
        .element(find.byKey(const Key('app-bottom-navigation')))
        .go('/downloads/00000000-0000-0000-0000-000000000101');
    await tester.pumpAndSettle();

    expect(find.text('AI 智能分析'), findsOneWidget);
    final scrollable = find
        .descendant(
          of: find.byType(ListView),
          matching: find.byType(Scrollable),
        )
        .first;
    final position = tester.state<ScrollableState>(scrollable).position;
    position.jumpTo(position.maxScrollExtent);
    await tester.pump();

    final start = find.byKey(const Key('start-analysis-button'));
    expect(start, findsOneWidget);
    expect(tester.getRect(start).height, greaterThanOrEqualTo(44));
    expect(tester.getSemantics(start).label, contains('开始 AI 分析'));
    expect(tester.takeException(), isNull);
    semanticsHandle.dispose();
  });
}
