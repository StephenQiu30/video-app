import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../support/auth_fakes.dart';
import '../../support/data_fakes.dart';
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

  testWidgets('shows real empty states for the signed-in account', (
    tester,
  ) async {
    await pumpFramegrabApp(tester);

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();

    expect(find.text('暂无下载记录'), findsOneWidget);
    expect(find.textContaining('真实账户'), findsOneWidget);

    final title = tester.getSemantics(
      find.byKey(const Key('page-title-heading')),
    );
    final description = tester.getSemantics(
      find.byKey(const Key('page-description')),
    );
    expect(title.label, '下载记录');
    expect(title.flagsCollection.isHeader, isTrue);
    expect(description.label, contains('当前账户的下载任务'));
    expect(description.flagsCollection.isHeader, isFalse);

    await tester.tap(find.byKey(const Key('app-tab-2')));
    await tester.pumpAndSettle();
    expect(find.text('暂无剧本文档'), findsOneWidget);
    expect(find.textContaining('真实账户'), findsOneWidget);
  });

  testWidgets('renders typed live records from all three repositories', (
    tester,
  ) async {
    final providerRepository = FakeProviderStatusRepository(
      data: providerFixture(),
    );
    await pumpFramegrabApp(
      tester,
      downloadHistoryRepository: FakeDownloadHistoryRepository(
        data: downloadHistoryFixture(),
      ),
      documentRepository: FakeDocumentRepository(data: documentFixture()),
      providerStatusRepository: providerRepository,
    );

    expect(providerRepository.calls, 1);

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();
    expect(find.text('真实下载任务'), findsOneWidget);
    expect(find.text('已完成'), findsWidgets);

    await tester.tap(find.byKey(const Key('app-tab-2')));
    await tester.pumpAndSettle();
    expect(find.text('真实剧本'), findsOneWidget);
    expect(find.text('framegrab.docx'), findsOneWidget);

    await tester.tap(find.byKey(const Key('app-tab-3')));
    await tester.pumpAndSettle();
    expect(find.text('YouTube'), findsOneWidget);
    expect(find.textContaining('单视频', findRichText: true), findsOneWidget);
    expect(find.textContaining('匿名访问', findRichText: true), findsOneWidget);

    await tester.tap(find.byKey(const Key('app-tab-0')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('app-tab-3')));
    await tester.pumpAndSettle();
    expect(providerRepository.calls, 1);
  });

  testWidgets('opens a live download detail from history', (tester) async {
    final repository = FakeDownloadHistoryRepository(
      data: downloadHistoryFixture(),
    );
    await pumpFramegrabApp(tester, downloadHistoryRepository: repository);

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();
    await tester.tap(
      find.byKey(
        const Key('download-history-item-00000000-0000-0000-0000-000000000101'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('download-detail-content')), findsOneWidget);
    expect(find.text('1920×1080 · MP4 · H264'), findsOneWidget);
    expect(find.text('文件可获取'), findsOneWidget);
    expect(find.text('2:04'), findsOneWidget);
    expect(find.byType(BackButton), findsOneWidget);
    expect(repository.detailCalls, ['00000000-0000-0000-0000-000000000101']);
  });

  testWidgets('shows a retryable error instead of placeholder data', (
    tester,
  ) async {
    final repository = FakeDownloadHistoryRepository(
      error: StateError('offline'),
    );
    await pumpFramegrabApp(tester, downloadHistoryRepository: repository);

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();
    expect(find.text('暂时无法读取数据'), findsOneWidget);
    expect(find.text('重新加载'), findsOneWidget);
    expect(find.text('下载记录尚未开放'), findsNothing);

    repository
      ..error = null
      ..data = downloadHistoryFixture();
    await tester.tap(find.text('重新加载'));
    await tester.pumpAndSettle();
    expect(find.text('真实下载任务'), findsOneWidget);
    expect(repository.calls, 2);
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

  testWidgets('switches appearance from the navbar without a Me duplicate', (
    tester,
  ) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
    addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
    await pumpFramegrabApp(tester);

    expect(find.byKey(const Key('navbar-theme-toggle')), findsOneWidget);
    await tester.tap(find.byKey(const Key('navbar-theme-toggle')));
    await tester.pumpAndSettle();

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);

    await tester.tap(find.byKey(const Key('app-tab-4')));
    await tester.pumpAndSettle();
    expect(find.text('外观'), findsNothing);
    expect(find.byKey(const Key('dark-theme-switch')), findsNothing);
  });

  testWidgets('shows the mobile admin entry only for an admin session', (
    tester,
  ) async {
    await pumpFramegrabApp(tester);
    await tester.tap(find.byKey(const Key('app-tab-4')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('admin-center-entry')), findsNothing);
    tester.element(find.byKey(const Key('app-bottom-navigation'))).go('/admin');
    await tester.pumpAndSettle();
    expect(find.text('管理中心'), findsNothing);
    expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await pumpFramegrabApp(
      tester,
      authGateway: FakeAuthGateway(
        session: testSession(role: UserRole.admin, suffix: 'admin'),
      ),
    );
    await tester.tap(find.byKey(const Key('app-tab-4')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('admin-center-entry')), findsOneWidget);
    final adminEntry = tester.getRect(
      find.byKey(const Key('admin-center-entry')),
    );
    final logoutAction = tester.getRect(find.byKey(const Key('logout-button')));
    expect(logoutAction.top, greaterThan(adminEntry.bottom));
    expect(logoutAction.left, adminEntry.left);
    await tester.tap(find.byKey(const Key('admin-center-entry')));
    await tester.pumpAndSettle();
    expect(find.text('管理中心'), findsOneWidget);
    expect(find.text('下载分析'), findsOneWidget);
    expect(find.text('文件管理'), findsOneWidget);
    expect(find.text('用户管理'), findsOneWidget);
    expect(find.text('平台目录'), findsOneWidget);
    expect(find.text('AI 服务'), findsOneWidget);
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
