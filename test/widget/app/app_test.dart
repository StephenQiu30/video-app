import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:go_router/go_router.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../support/analysis_fakes.dart';
import '../../support/auth_fakes.dart';
import '../../support/data_fakes.dart';
import '../../support/intake_fakes.dart';
import '../../support/theme_fakes.dart';
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

  testWidgets('shows validation feedback without invoking inspection', (
    tester,
  ) async {
    final repository = FakeDownloadIntakeRepository();
    await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

    await tester.enterText(find.byKey(const Key('media-url-input')), '无效地址');
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pump();

    expect(find.text('请输入有效的公开 HTTP(S) 视频地址。'), findsOneWidget);
    expect(repository.publicUrls, isEmpty);
  });

  testWidgets('renders the live inspection and selectable formats', (
    tester,
  ) async {
    final repository = FakeDownloadIntakeRepository();
    await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      'https://media.example/video',
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pumpAndSettle();

    expect(repository.publicUrls, ['https://media.example/video']);
    expect(find.byKey(const Key('inspection-workspace')), findsOneWidget);
    expect(find.text('真实解析视频'), findsOneWidget);
    expect(find.text('1080p MP4'), findsOneWidget);
    expect(find.text('720p MP4'), findsOneWidget);
    expect(find.byKey(const Key('create-download-button')), findsOneWidget);
  });

  testWidgets('passes only the normalized URL to the generated client flow', (
    tester,
  ) async {
    final repository = FakeDownloadIntakeRepository();
    await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      '复制链接 https://media.example/video?id=42。 打开帧取',
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pumpAndSettle();

    expect(repository.publicUrls, ['https://media.example/video?id=42']);
  });

  testWidgets('submits the URL embedded in a copied Douyin share message', (
    tester,
  ) async {
    final repository = FakeDownloadIntakeRepository();
    await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      '0.53 复制打开抖音，看看【喵了个喵-的图文作品】你笑面如花 '
      '真想与你情定香格里拉.# 我与天坛 '
      'https://v.douyin.com/Z8wTCSQ-1_g/ M@j.cn EHv:/ 04/10 :3pm',
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pumpAndSettle();

    expect(repository.publicUrls, ['https://v.douyin.com/Z8wTCSQ-1_g/']);
  });

  testWidgets('discovers and opens an article candidate', (tester) async {
    final repository = FakeDownloadIntakeRepository();
    await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      'https://mp.weixin.qq.com/s/article',
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('source-discovery-workspace')), findsOneWidget);
    expect(find.text('候选视频一'), findsOneWidget);
    final candidate = find.byKey(
      const Key('source-candidate-00000000-0000-0000-0000-000000000312'),
    );
    _scrollHomeTo(tester, 260);
    await tester.pump();
    await tester.tap(candidate);
    await tester.pumpAndSettle();

    expect(repository.selectedItems, ['00000000-0000-0000-0000-000000000312']);
    expect(find.byKey(const Key('inspection-workspace')), findsOneWidget);
  });

  testWidgets('creates the selected format and opens the task detail', (
    tester,
  ) async {
    final repository = FakeDownloadIntakeRepository();
    final history = FakeDownloadHistoryRepository(
      data: downloadHistoryFixture(),
    );
    await pumpFramegrabApp(
      tester,
      downloadHistoryRepository: history,
      downloadIntakeRepository: repository,
    );

    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      'https://media.example/video',
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pumpAndSettle();
    final format = find.byKey(
      const Key('format-option-00000000-0000-0000-0000-000000000303'),
    );
    _scrollHomeTo(tester, 880);
    await tester.pump();
    await tester.tap(format);
    final create = find.byKey(const Key('create-download-button'));
    await tester.tap(create);
    await tester.pumpAndSettle();

    expect(repository.createdFormats, ['00000000-0000-0000-0000-000000000303']);
    expect(find.byKey(const Key('download-detail-content')), findsOneWidget);
    final backButton = find.byKey(const Key('navbar-back-button'));
    expect(backButton, findsOneWidget);

    await tester.tap(backButton);
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('inspection-workspace')), findsOneWidget);
    final input = tester.widget<TextField>(
      find.byKey(const Key('media-url-input')),
    );
    expect(input.controller?.text, 'https://media.example/video');
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
    final backButton = find.byKey(const Key('navbar-back-button'));
    expect(backButton, findsOneWidget);
    expect(repository.detailCalls, ['00000000-0000-0000-0000-000000000101']);

    await tester.tap(backButton);
    await tester.pumpAndSettle();
    expect(find.text('下载记录'), findsOneWidget);
    expect(find.text('真实下载任务'), findsOneWidget);
    expect(find.byKey(const Key('app-tab-1')), findsOneWidget);
  });

  testWidgets('offers a safe back action for a directly opened task detail', (
    tester,
  ) async {
    final repository = FakeDownloadHistoryRepository(
      data: downloadHistoryFixture(),
    );
    await pumpFramegrabApp(tester, downloadHistoryRepository: repository);

    tester
        .element(find.byKey(const Key('app-bottom-navigation')))
        .go('/downloads/00000000-0000-0000-0000-000000000101');
    await tester.pumpAndSettle();

    final backButton = find.byKey(const Key('navbar-back-button'));
    expect(backButton, findsOneWidget);
    final size = tester.getSize(backButton);
    expect(size.width, greaterThanOrEqualTo(44));
    expect(size.height, greaterThanOrEqualTo(44));
    expect(tester.getSemantics(backButton).label, isNotEmpty);

    await tester.tap(backButton);
    await tester.pumpAndSettle();

    expect(find.text('把素材，\n带回本地。'), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);
  });

  testWidgets(
    'starts AI analysis from a completed download and shows results',
    (tester) async {
      final analysis = FakeAnalysisRepository(
        createResult: analysisJobFixture(status: AnalysisStatus.succeeded),
      );
      await pumpFramegrabApp(
        tester,
        analysisRepository: analysis,
        downloadHistoryRepository: FakeDownloadHistoryRepository(
          data: downloadHistoryFixture(),
        ),
      );
      await tester.tap(find.byKey(const Key('navbar-theme-toggle')));
      await tester.pumpAndSettle();
      tester
          .element(find.byKey(const Key('app-bottom-navigation')))
          .go('/downloads/00000000-0000-0000-0000-000000000101');
      await tester.pumpAndSettle();

      expect(find.text('AI 智能分析'), findsOneWidget);
      expect(
        Theme.of(
          find.byKey(const Key('analysis-panel')).evaluate().single,
        ).brightness,
        Brightness.dark,
      );
      expect(find.byKey(const Key('analysis-configurator')), findsOneWidget);
      expect(find.text('导演拉片'), findsOneWidget);
      final start = find.byKey(const Key('start-analysis-button'));
      _scrollDetailToEnd(tester);
      await tester.pump();
      await tester.tap(start);
      await tester.pumpAndSettle();

      expect(analysis.createKeys, hasLength(1));
      expect(find.byKey(const Key('video-analysis-result')), findsOneWidget);
      expect(find.text('舞台表演视觉分析'), findsOneWidget);
      expect(find.text('镜头围绕主体动作与舞台调度形成连续节奏。'), findsOneWidget);
      expect(find.byKey(const Key('download-video-file')), findsOneWidget);
    },
  );

  testWidgets('restores and renders a completed video article analysis', (
    tester,
  ) async {
    final analysis = FakeAnalysisRepository(
      latest: analysisJobFixture(
        status: AnalysisStatus.succeeded,
        resultKind: 'video_article',
      ),
    );
    await pumpFramegrabApp(
      tester,
      analysisRepository: analysis,
      downloadHistoryRepository: FakeDownloadHistoryRepository(
        data: downloadHistoryFixture(),
      ),
    );
    tester
        .element(find.byKey(const Key('app-bottom-navigation')))
        .go('/downloads/00000000-0000-0000-0000-000000000101');
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('video-article-result')), findsOneWidget);
    expect(find.text('舞台表演如何建立开场吸引力'), findsOneWidget);
    expect(find.text('从定格动作开始'), findsOneWidget);
    expect(find.textContaining('仅基于可见画面分析'), findsOneWidget);
  });

  testWidgets('keeps the downloaded file available when AI analysis fails', (
    tester,
  ) async {
    final analysis = FakeAnalysisRepository(
      latest: analysisJobFixture(status: AnalysisStatus.failed),
    );
    await pumpFramegrabApp(
      tester,
      analysisRepository: analysis,
      downloadHistoryRepository: FakeDownloadHistoryRepository(
        data: downloadHistoryFixture(),
      ),
    );
    tester
        .element(find.byKey(const Key('app-bottom-navigation')))
        .go('/downloads/00000000-0000-0000-0000-000000000101');
    await tester.pumpAndSettle();

    expect(find.text('分析失败'), findsOneWidget);
    expect(find.text('AI 分析执行失败，请稍后重试。'), findsOneWidget);
    expect(find.byKey(const Key('retry-analysis-button')), findsOneWidget);
    expect(find.byKey(const Key('download-video-file')), findsOneWidget);

    final retry = find.byKey(const Key('retry-analysis-button'));
    _scrollDetailToEnd(tester);
    await tester.pump();
    await tester.tap(retry);
    await tester.pump();
    expect(analysis.retryKeys, hasLength(1));
    expect(find.text('等待分析'), findsOneWidget);
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
    final preferenceStore = MemoryThemePreferenceStore();
    await pumpFramegrabApp(tester, themePreferenceStore: preferenceStore);

    expect(find.byKey(const Key('navbar-theme-toggle')), findsOneWidget);
    await tester.tap(find.byKey(const Key('navbar-theme-toggle')));
    await tester.pumpAndSettle();

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);
    expect(preferenceStore.value, ThemeMode.dark);

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

    expect(find.byKey(const Key('public-home-screen')), findsOneWidget);
    expect(find.text('开源、自托管的\n视频工作流。'), findsOneWidget);
    expect(find.byKey(const Key('public-home-login')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
    expect(find.text('把素材，\n带回本地。'), findsNothing);
    expect(find.byKey(const Key('navbar-theme-toggle')), findsOneWidget);

    await tester.tap(find.byKey(const Key('public-home-login')));
    await tester.pumpAndSettle();
    expect(find.text('欢迎回来'), findsOneWidget);
    expect(find.byKey(const Key('login-email-field')), findsOneWidget);
    expect(find.byKey(const Key('navbar-theme-toggle')), findsOneWidget);

    await tester.tap(find.byKey(const Key('go-register-button')));
    await tester.pumpAndSettle();
    expect(find.text('创建你的帧取账户'), findsOneWidget);
    expect(find.byKey(const Key('register-username-field')), findsOneWidget);
  });

  testWidgets('keeps protected deep links behind native authentication', (
    tester,
  ) async {
    await pumpFramegrabApp(
      tester,
      authGateway: FakeAuthGateway(),
      credentialStore: MemoryCredentialStore(),
    );

    tester
        .element(find.byKey(const Key('public-home-screen')))
        .go('/downloads/00000000-0000-0000-0000-000000000101');
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('login-email-field')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
  });

  testWidgets('validates login fields before making a request', (tester) async {
    await pumpFramegrabApp(
      tester,
      authGateway: FakeAuthGateway(),
      credentialStore: MemoryCredentialStore(),
    );
    await tester.tap(find.byKey(const Key('public-home-login')));
    await tester.pumpAndSettle();
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
    await tester.tap(find.byKey(const Key('public-home-login')));
    await tester.pumpAndSettle();
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
    expect(find.byKey(const Key('public-home-screen')), findsOneWidget);
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
    await tester.tap(find.byKey(const Key('public-home-login')));
    await tester.pumpAndSettle();
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

Finder _homeScrollable() => find
    .descendant(
      of: find.byType(CustomScrollView),
      matching: find.byType(Scrollable),
    )
    .first;

Finder _detailScrollable() => find
    .descendant(of: find.byType(ListView), matching: find.byType(Scrollable))
    .first;

void _scrollDetailToEnd(WidgetTester tester) {
  final position = tester.state<ScrollableState>(_detailScrollable()).position;
  position.jumpTo(position.maxScrollExtent);
}

void _scrollHomeTo(WidgetTester tester, double offset) {
  final position = tester.state<ScrollableState>(_homeScrollable()).position;
  position.jumpTo(offset.clamp(0, position.maxScrollExtent));
}
