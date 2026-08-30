import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';

import '../../support/auth_fakes.dart';
import 'test_app.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('renders the Web-aligned home at the 390px mobile baseline', (
    tester,
  ) async {
    await setMobileViewport(tester);
    await pumpFramegrabApp(tester);

    expect(find.text('帧取'), findsOneWidget);
    final wordmark = find.byKey(const Key('app-brand-wordmark'));
    expect(wordmark, findsOneWidget);
    expect(tester.getSemantics(wordmark).label, '帧取');
    expect(find.textContaining(RegExp(r'^\d{2} /')), findsNothing);
    expect(find.text('把素材，\n带回本地。'), findsOneWidget);
    expect(find.text('解析媒体'), findsOneWidget);
    expect(find.text('链接解析'), findsOneWidget);
    expect(find.text('本地视频'), findsOneWidget);
    expect(find.text('剧本文档'), findsOneWidget);
    expect(find.textContaining('有权处理的公开链接'), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);
    expect(find.text('首页'), findsOneWidget);
    expect(find.text('历史'), findsOneWidget);
    expect(find.text('文档'), findsOneWidget);
    expect(find.text('状态'), findsOneWidget);
    expect(find.text('我的'), findsOneWidget);
    expect(find.byKey(const Key('app-tab-1')), findsOneWidget);
    expect(find.byKey(const Key('app-tab-3')), findsOneWidget);
    expect(find.byKey(const Key('app-tab-4')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('switches intake modes and keeps remote actions fail closed', (
    tester,
  ) async {
    await setMobileViewport(tester);
    await pumpFramegrabApp(tester);

    await tester.tap(find.text('本地视频'));
    await tester.pumpAndSettle();

    expect(find.text('导入本地视频'), findsOneWidget);
    expect(find.text('选择视频文件'), findsOneWidget);
    expect(find.byKey(const Key('media-url-input')), findsNothing);

    await tester.tap(find.text('选择视频文件'));
    await tester.pumpAndSettle();
    expect(find.textContaining('上传与文件授权契约尚未冻结'), findsOneWidget);

    await tester.tap(find.text('剧本文档').first);
    await tester.pumpAndSettle();
    expect(find.text('导入剧本文档'), findsOneWidget);
    expect(find.text('选择剧本文件'), findsOneWidget);
  });

  testWidgets('shows validation feedback without invoking an intent', (
    tester,
  ) async {
    var called = false;
    await pumpFramegrabApp(
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
    await pumpFramegrabApp(tester);

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      'https://media.example/video',
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pump();

    expect(find.textContaining('媒体检查与下载契约尚未冻结'), findsOneWidget);
  });

  testWidgets('passes only the normalized URL to an injected intent', (
    tester,
  ) async {
    String? received;
    await pumpFramegrabApp(
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
    await pumpFramegrabApp(tester);

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();

    expect(find.text('下载记录尚未开放'), findsOneWidget);
    expect(find.textContaining('真实任务、视频预览和分析状态'), findsOneWidget);

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

    await tester.tap(find.byKey(const Key('app-tab-2')));
    await tester.pumpAndSettle();
    expect(find.text('剧本文档尚未开放'), findsOneWidget);
    expect(find.textContaining('规范化预览'), findsOneWidget);
  });

  testWidgets('keeps the link input when navigating between destinations', (
    tester,
  ) async {
    await pumpFramegrabApp(tester);

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      'https://media.example/kept',
    );
    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('app-tab-0')));
    await tester.pumpAndSettle();

    final input = tester.widget<TextField>(
      find.byKey(const Key('media-url-input')),
    );
    expect(input.controller?.text, 'https://media.example/kept');
  });

  testWidgets('opens Me from the bottom bar and switches appearance', (
    tester,
  ) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await pumpFramegrabApp(tester);

    await tester.tap(find.byKey(const Key('app-tab-4')));
    await tester.pumpAndSettle();
    expect(find.text('外观'), findsOneWidget);

    await tester.tap(find.byKey(const Key('dark-theme-switch')));
    await tester.pumpAndSettle();

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);
  });

  testWidgets('opens independent login and registration routes', (
    tester,
  ) async {
    await setMobileViewport(tester);
    await pumpFramegrabApp(
      tester,
      authGateway: FakeAuthGateway(),
      credentialStore: MemoryCredentialStore(),
    );

    expect(find.text('欢迎回来'), findsOneWidget);
    expect(find.byKey(const Key('login-email-field')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
    expect(find.text('把素材，\n带回本地。'), findsNothing);

    await tester.tap(find.byKey(const Key('go-register-button')));
    await tester.pumpAndSettle();
    expect(find.text('创建你的帧取账户'), findsOneWidget);
    expect(find.byKey(const Key('register-username-field')), findsOneWidget);
  });

  testWidgets('validates login fields before making a request', (tester) async {
    await pumpFramegrabApp(
      tester,
      authGateway: FakeAuthGateway(),
      credentialStore: MemoryCredentialStore(),
    );
    await tester.tap(find.byKey(const Key('login-submit-button')));
    await tester.pump();

    expect(find.text('请输入有效的邮箱地址。'), findsOneWidget);
    expect(find.text('密码至少需要 8 个字符。'), findsOneWidget);
  });

  testWidgets('registers, exposes the account, and signs out', (tester) async {
    final gateway = FakeAuthGateway();
    final store = MemoryCredentialStore();
    await pumpFramegrabApp(
      tester,
      authGateway: gateway,
      credentialStore: store,
    );
    await tester.tap(find.byKey(const Key('go-register-button')));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const Key('register-username-field')),
      'member',
    );
    await tester.enterText(
      find.byKey(const Key('register-email-field')),
      'member@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('register-password-field')),
      'strong-pass-123',
    );
    await tester.enterText(
      find.byKey(const Key('register-confirm-field')),
      'strong-pass-123',
    );
    await tester.tap(find.byKey(const Key('register-submit-button')));
    await tester.pumpAndSettle();

    expect(find.text('把素材，\n带回本地。'), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);
    expect(store.value, 'refresh-register');
    await tester.tap(find.byKey(const Key('app-tab-4')));
    await tester.pumpAndSettle();
    expect(find.text('member@example.com'), findsOneWidget);

    await tester.tap(find.byKey(const Key('logout-button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('login-email-field')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
    expect(store.value, isNull);
    expect(gateway.logoutCalls, 1);
  });

  testWidgets('shows a readable server failure on login', (tester) async {
    await pumpFramegrabApp(
      tester,
      authGateway: FakeAuthGateway(failure: AuthFailureKind.invalidCredentials),
      credentialStore: MemoryCredentialStore(),
    );
    await tester.enterText(
      find.byKey(const Key('login-email-field')),
      'member@example.com',
    );
    await tester.enterText(
      find.byKey(const Key('login-password-field')),
      'strong-pass-123',
    );
    await tester.tap(find.byKey(const Key('login-submit-button')));
    await tester.pumpAndSettle();

    expect(find.text('邮箱或密码不正确。'), findsOneWidget);
  });
}
