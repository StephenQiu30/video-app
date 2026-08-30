import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/download/presentation/content_intake_controls.dart';

import 'test_app.dart';

void main() {
  final scenarios = [
    (
      locale: const Locale('zh'),
      intakeLabels: const ['链接解析', '本地视频', '剧本文档'],
      intakeTitles: const ['导入本地视频', '导入剧本文档'],
      navigationLabels: const ['首页', '历史', '文档', '状态', '我的'],
      navigationTitles: const [
        '把素材，\n带回本地。',
        '下载记录尚未开放',
        '剧本文档尚未开放',
        '平台状态尚未开放',
        '我的',
      ],
    ),
    (
      locale: const Locale('en'),
      intakeLabels: const ['Link', 'Local video', 'Screenplay'],
      intakeTitles: const ['Import a local video', 'Import a screenplay'],
      navigationLabels: const ['Home', 'History', 'Documents', 'Status', 'Me'],
      navigationTitles: const [
        'Bring content\nback to your device.',
        'Download history is not available yet',
        'Screenplay documents are not available yet',
        'Provider status is not available yet',
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
}
