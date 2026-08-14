import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/app/app.dart';
import 'package:framegrab/features/download/application/inspect_media_intent.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('renders the Web-aligned home at the 390px mobile baseline', (
    tester,
  ) async {
    await _setMobileViewport(tester);
    await _pumpApp(tester);

    expect(find.text('帧取'), findsOneWidget);
    expect(find.textContaining(RegExp(r'^\d{2} /')), findsNothing);
    expect(find.text('把视频，\n带回本地。'), findsOneWidget);
    expect(find.text('解析媒体'), findsOneWidget);
    expect(find.textContaining('有权处理的公开链接'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('下载记录'), findsOneWidget);
    expect(find.text('平台状态'), findsOneWidget);
    expect(find.text('我的'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('shows validation feedback without invoking an intent', (
    tester,
  ) async {
    var called = false;
    await _pumpApp(
      tester,
      inspect: (_) async {
        called = true;
      },
    );

    await tester.enterText(find.byKey(const Key('media-url-input')), '无效地址');
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pump();

    expect(find.text('请输入有效的公开 HTTP(S) 视频地址。'), findsOneWidget);
    expect(called, isFalse);
  });

  testWidgets('explains the native contract boundary for a valid URL', (
    tester,
  ) async {
    await _pumpApp(tester);

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      'https://media.example/video',
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pump();

    expect(find.textContaining('原生认证与服务契约尚未冻结'), findsOneWidget);
  });

  testWidgets('passes only the normalized URL to an injected intent', (
    tester,
  ) async {
    String? received;
    await _pumpApp(
      tester,
      inspect: (value) async {
        received = value;
      },
    );

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      '复制链接 https://media.example/video?id=42。 打开帧取',
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pumpAndSettle();

    expect(received, 'https://media.example/video?id=42');
    expect(find.textContaining('原生认证与服务契约尚未冻结'), findsNothing);
  });

  testWidgets('switches bottom destinations without inventing remote data', (
    tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('下载记录'));
    await tester.pumpAndSettle();

    expect(find.text('下载记录尚未开放'), findsOneWidget);
    expect(find.textContaining('真实任务与恢复状态'), findsOneWidget);

    final title = tester.getSemantics(
      find.byKey(const Key('page-title-heading')),
    );
    final description = tester.getSemantics(
      find.byKey(const Key('page-description')),
    );
    expect(title.label, '下载记录');
    expect(title.flagsCollection.isHeader, isTrue);
    expect(description.label, contains('搜索、筛选并恢复'));
    expect(description.flagsCollection.isHeader, isFalse);
  });

  testWidgets('opens Me from the bottom bar and switches appearance', (
    tester,
  ) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await _pumpApp(tester);

    await tester.tap(find.text('我的'));
    await tester.pumpAndSettle();
    expect(find.text('外观'), findsOneWidget);

    await tester.tap(find.byKey(const Key('dark-theme-switch')));
    await tester.pumpAndSettle();

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);
  });
}

Future<void> _pumpApp(
  WidgetTester tester, {
  InspectMediaIntent? inspect,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        if (inspect != null)
          inspectMediaIntentProvider.overrideWithValue(inspect),
      ],
      child: const FramegrabApp(locale: Locale('zh')),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _setMobileViewport(WidgetTester tester) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = const Size(390, 844);
  addTearDown(tester.view.reset);
}
