import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:go_router/go_router.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../support/analysis_fakes.dart';
import '../../support/auth_fakes.dart';
import '../../support/data_fakes.dart';
import '../../support/intake_fakes.dart';
import '../../support/theme_fakes.dart';
import '../../support/upload_fakes.dart';
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
    expect(find.textContaining('账号或访问凭据'), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsOneWidget);
    expect(find.text('首页'), findsOneWidget);
    expect(find.text('历史'), findsOneWidget);
    expect(find.text('文档'), findsOneWidget);
    expect(find.text('状态'), findsOneWidget);
    expect(find.text('我的'), findsOneWidget);
    expect(find.byKey(const Key('app-tab-1')), findsOneWidget);
    expect(find.byKey(const Key('app-tab-3')), findsOneWidget);
    expect(find.byKey(const Key('app-tab-4')), findsOneWidget);

    final wordmarkRect = tester.getRect(wordmark);
    final titleRect = tester.getRect(find.text('把素材，\n带回本地。'));
    expect(
      titleRect.top - wordmarkRect.bottom,
      lessThanOrEqualTo(40),
      reason: '移动端 Navbar 与主标题之间应保持紧凑的首屏节奏。',
    );

    final privacyRect = tester.getRect(find.textContaining('账号或访问凭据'));
    final navigationRect = tester.getRect(
      find.byKey(const Key('app-bottom-navigation')),
    );
    expect(
      privacyRect.bottom,
      lessThanOrEqualTo(navigationRect.top - 12),
      reason: '390×844 首屏应完整露出两条信任提示，不需要先滚动。',
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('switches intake modes and opens the native file picker', (
    tester,
  ) async {
    final picker = FakeLocalContentPicker();
    await setMobileViewport(tester);
    await pumpFramegrabApp(tester, localContentPicker: picker);

    await tester.tap(find.text('本地视频'));
    await tester.pumpAndSettle();

    expect(find.text('导入本地视频'), findsOneWidget);
    expect(find.text('选择视频文件'), findsOneWidget);
    expect(find.byKey(const Key('media-url-input')), findsNothing);
    expect(find.textContaining('有权处理的公开链接'), findsNothing);
    expect(find.textContaining('账号或访问凭据'), findsNothing);

    await tester.tap(find.text('选择视频文件'));
    await tester.pumpAndSettle();
    expect(picker.requestedKinds, [ContentUploadKind.video]);
    expect(find.byKey(const Key('content-upload-error')), findsNothing);

    await tester.tap(find.text('剧本文档').first);
    await tester.pumpAndSettle();
    expect(find.text('导入剧本文档'), findsOneWidget);
    expect(find.text('选择剧本文件'), findsOneWidget);
    await tester.tap(find.text('选择剧本文件'));
    await tester.pumpAndSettle();
    expect(picker.requestedKinds, [
      ContentUploadKind.video,
      ContentUploadKind.screenplay,
    ]);
  });

  testWidgets('validates local video before starting an upload', (
    tester,
  ) async {
    final picker = FakeLocalContentPicker(
      file: const LocalContentFile(
        name: 'clip.webm',
        path: '/tmp/clip.webm',
        size: 128,
      ),
    );
    final upload = FakeContentUploadRepository();
    await pumpFramegrabApp(
      tester,
      localContentPicker: picker,
      uploadRepository: upload,
    );

    await tester.tap(find.text('本地视频'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('选择视频文件'));
    await tester.pumpAndSettle();

    expect(find.text('当前只支持上传 MP4 视频。'), findsOneWidget);
    expect(upload.uploadedKinds, isEmpty);
  });

  testWidgets('uploads a local MP4 and opens its download detail', (
    tester,
  ) async {
    final picker = FakeLocalContentPicker(
      file: const LocalContentFile(
        name: 'clip.mp4',
        path: '/tmp/clip.mp4',
        size: 128,
      ),
    );
    final upload = FakeContentUploadRepository();
    await pumpFramegrabApp(
      tester,
      downloadHistoryRepository: FakeDownloadHistoryRepository(),
      localContentPicker: picker,
      uploadRepository: upload,
    );

    await tester.tap(find.text('本地视频'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('选择视频文件'));
    await tester.pumpAndSettle();

    expect(upload.uploadedKinds, [ContentUploadKind.video]);
    expect(find.byKey(const Key('download-detail-content')), findsOneWidget);
  });

  testWidgets('uploads a screenplay and refreshes the document list', (
    tester,
  ) async {
    final picker = FakeLocalContentPicker(
      file: const LocalContentFile(
        name: 'story.fountain',
        path: '/tmp/story.fountain',
        size: 128,
      ),
    );
    final upload = FakeContentUploadRepository();
    await pumpFramegrabApp(
      tester,
      documentRepository: FakeDocumentRepository(data: documentFixture()),
      localContentPicker: picker,
      uploadRepository: upload,
    );

    await tester.tap(find.text('剧本文档').first);
    await tester.pumpAndSettle();
    final selectFile = find.byKey(const Key('select-screenplay-file'));
    await tester.ensureVisible(selectFile);
    await tester.pump();
    await tester.tap(selectFile);
    await tester.pumpAndSettle();

    expect(upload.uploadedKinds, [ContentUploadKind.screenplay]);
    expect(find.text('真实剧本'), findsOneWidget);
  });

  testWidgets('shows validation feedback without invoking inspection', (
    tester,
  ) async {
    final repository = FakeDownloadIntakeRepository();
    await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

    await tester.enterText(find.byKey(const Key('media-url-input')), '');
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pump();

    expect(find.text('请输入公开链接或完整分享文案。'), findsOneWidget);
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
    expect(find.text('真实解析视频'), findsWidgets);
    expect(find.text('1080p MP4'), findsOneWidget);
    expect(find.text('720p MP4'), findsOneWidget);
    expect(find.byKey(const Key('create-download-button')), findsOneWidget);
  });

  testWidgets(
    'passes the original share message to the generated client flow',
    (tester) async {
      final repository = FakeDownloadIntakeRepository();
      await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

      await tester.enterText(
        find.byKey(const Key('media-url-input')),
        '复制链接 https://media.example/video?id=42。 打开帧取',
      );
      await tester.tap(find.byKey(const Key('inspect-media-button')));
      await tester.pumpAndSettle();

      expect(repository.publicUrls, [
        '复制链接 https://media.example/video?id=42。 打开帧取',
      ]);
    },
  );

  testWidgets('preserves the complete Hongguo share message for the server', (
    tester,
  ) async {
    final repository = FakeDownloadIntakeRepository();
    await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

    const shareMessage =
        '漫剧《死对头校花竟是我网恋女友》 - 免费好剧，尽在红果\n'
        '点击链接打开👉https://novelquickapp.com/s/QVcr7YNEMwI/\n'
        '复制本条消息后，打开「红果短剧App」后免费看全集~';
    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      shareMessage,
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pumpAndSettle();

    expect(repository.publicUrls, [shareMessage]);
  });

  testWidgets('submits the URL embedded in a copied Douyin share message', (
    tester,
  ) async {
    final repository = FakeDownloadIntakeRepository();
    await pumpFramegrabApp(tester, downloadIntakeRepository: repository);

    const shareMessage =
        '0.53 复制打开抖音，看看【喵了个喵-的图文作品】你笑面如花 '
        '真想与你情定香格里拉.# 我与天坛 '
        'https://v.douyin.com/Z8wTCSQ-1_g/ M@j.cn EHv:/ 04/10 :3pm';
    await tester.enterText(
      find.byKey(const Key('media-url-input')),
      shareMessage,
    );
    await tester.tap(find.byKey(const Key('inspect-media-button')));
    await tester.pumpAndSettle();

    expect(repository.publicUrls, [shareMessage]);
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

    expect(find.text('还没有下载记录'), findsOneWidget);
    expect(find.textContaining('从首页解析链接'), findsOneWidget);
    expect(find.text('去首页创建任务'), findsOneWidget);

    final title = tester.getSemantics(
      find.byKey(const Key('page-title-heading')),
    );
    final description = tester.getSemantics(
      find.byKey(const Key('page-description')),
    );
    expect(title.label, '下载记录');
    expect(title.flagsCollection.isHeader, isTrue);
    expect(description.label, contains('继续查看、获取或分析'));
    expect(description.flagsCollection.isHeader, isFalse);

    await tester.tap(find.byKey(const Key('app-tab-2')));
    await tester.pumpAndSettle();
    expect(find.text('还没有剧本文档'), findsOneWidget);
    expect(find.textContaining('从首页上传剧本文档'), findsOneWidget);
    final uploadFromHome = find.widgetWithText(FilledButton, '去首页上传剧本');
    expect(uploadFromHome, findsOneWidget);
    expect(
      find.descendant(of: uploadFromHome, matching: find.byType(Icon)),
      findsNothing,
      reason: '主按钮文案已经明确，不应再放置无额外语义的箭头图标。',
    );

    await tester.tap(uploadFromHome);
    await tester.pumpAndSettle();
    expect(find.text('导入剧本文档'), findsOneWidget);
    expect(find.textContaining('有权处理的公开链接'), findsNothing);
    expect(find.textContaining('账号或访问凭据'), findsNothing);
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
    expect(find.text('真实下载任务'), findsWidgets);
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

  testWidgets('centers download metrics in a full-width phone summary', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await pumpFramegrabApp(
      tester,
      downloadHistoryRepository: FakeDownloadHistoryRepository(
        data: downloadHistoryFixture(),
      ),
    );

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();

    final centers = [
      tester.getCenter(find.byKey(const Key('download-summary-total'))),
      tester.getCenter(find.byKey(const Key('download-summary-succeeded'))),
      tester.getCenter(find.byKey(const Key('download-summary-active'))),
      tester.getCenter(find.byKey(const Key('download-summary-failed'))),
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
    expect(find.text('1920×1080 · MP4 · H264'), findsWidgets);
    expect(find.text('文件可获取'), findsOneWidget);
    expect(find.text('2:04'), findsOneWidget);
    final backButton = find.byKey(const Key('navbar-back-button'));
    expect(backButton, findsOneWidget);
    expect(repository.detailCalls, ['00000000-0000-0000-0000-000000000101']);

    await tester.tap(backButton);
    await tester.pumpAndSettle();
    expect(find.text('下载记录'), findsOneWidget);
    expect(find.text('真实下载任务'), findsWidgets);
    expect(find.byKey(const Key('app-tab-1')), findsOneWidget);
  });

  testWidgets('deletes an owned download from history after confirmation', (
    tester,
  ) async {
    final repository = FakeDownloadHistoryRepository(
      data: downloadHistoryFixture(),
    );
    await pumpFramegrabApp(tester, downloadHistoryRepository: repository);

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();
    final item = find.byKey(
      const Key('download-history-item-00000000-0000-0000-0000-000000000101'),
    );
    final deleteAction = find.byKey(
      const Key('delete-download-00000000-0000-0000-0000-000000000101'),
    );
    expect(deleteAction.hitTestable(), findsNothing);

    await tester.drag(item, const Offset(-320, 0));
    await tester.pumpAndSettle();
    expect(deleteAction.hitTestable(), findsOneWidget);
    await tester.tap(deleteAction);
    await tester.pumpAndSettle();

    expect(find.text('删除任务与文件？'), findsOneWidget);
    expect(find.textContaining('此操作不可撤销'), findsOneWidget);
    await tester.tap(find.text('保留任务'));
    await tester.pumpAndSettle();
    expect(repository.deleteCalls, isEmpty);

    await tester.drag(item, const Offset(-320, 0));
    await tester.pumpAndSettle();
    await tester.tap(deleteAction);
    await tester.pumpAndSettle();
    await tester.tap(find.text('确认删除'));
    await tester.pumpAndSettle();

    expect(repository.deleteCalls, ['00000000-0000-0000-0000-000000000101']);
    expect(find.text('真实下载任务'), findsNothing);
  });

  testWidgets('deletes an owned screenplay document after confirmation', (
    tester,
  ) async {
    final repository = FakeDocumentRepository(data: documentFixture());
    await pumpFramegrabApp(tester, documentRepository: repository);

    await tester.tap(find.byKey(const Key('app-tab-2')));
    await tester.pumpAndSettle();
    final item = find.byKey(
      const Key('document-slidable-00000000-0000-0000-0000-000000000102'),
    );
    final deleteAction = find.byKey(
      const Key('delete-document-00000000-0000-0000-0000-000000000102'),
    );
    expect(deleteAction.hitTestable(), findsNothing);

    await tester.drag(item, const Offset(-320, 0));
    await tester.pumpAndSettle();
    expect(deleteAction.hitTestable(), findsOneWidget);
    await tester.tap(deleteAction);
    await tester.pumpAndSettle();

    expect(find.text('删除剧本文档？'), findsOneWidget);
    expect(find.textContaining('正在使用该文档的分析需先结束'), findsOneWidget);
    await tester.tap(find.text('确认删除'));
    await tester.pumpAndSettle();

    expect(repository.deleteCalls, ['00000000-0000-0000-0000-000000000102']);
    expect(find.text('真实剧本'), findsNothing);
  });

  testWidgets('keeps a document and explains an active analysis conflict', (
    tester,
  ) async {
    final repository = FakeDocumentRepository(
      data: documentFixture(),
      deleteError: const DataRequestFailure(
        DataRequestFailureKind.unknown,
        code: 'invalid_state',
        statusCode: 409,
      ),
    );
    await pumpFramegrabApp(tester, documentRepository: repository);

    await tester.tap(find.byKey(const Key('app-tab-2')));
    await tester.pumpAndSettle();
    final item = find.byKey(
      const Key('document-slidable-00000000-0000-0000-0000-000000000102'),
    );
    await tester.drag(item, const Offset(-320, 0));
    await tester.pumpAndSettle();
    await tester.tap(
      find.byKey(
        const Key('delete-document-00000000-0000-0000-0000-000000000102'),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('确认删除'));
    await tester.pumpAndSettle();

    expect(repository.deleteCalls, ['00000000-0000-0000-0000-000000000102']);
    expect(find.text('资源正在被分析使用，请先结束相关分析后再删除。'), findsOneWidget);
    expect(find.text('真实剧本'), findsOneWidget);
  });

  testWidgets('keeps authenticated data pages free of decorative dividers', (
    tester,
  ) async {
    await pumpFramegrabApp(
      tester,
      downloadHistoryRepository: FakeDownloadHistoryRepository(
        data: downloadHistoryFixture(),
      ),
    );

    await tester.tap(find.byKey(const Key('app-tab-1')));
    await tester.pumpAndSettle();

    expect(find.byType(Divider), findsNothing);
  });

  testWidgets('deletes a download from its detail and returns safely', (
    tester,
  ) async {
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
    final deleteButton = find.byKey(
      const Key('delete-download-detail-00000000-0000-0000-0000-000000000101'),
    );
    await tester.ensureVisible(deleteButton);
    await tester.pumpAndSettle();
    await tester.tap(deleteButton);
    await tester.pumpAndSettle();
    await tester.tap(find.text('确认删除'));
    await tester.pumpAndSettle();

    expect(repository.deleteCalls, ['00000000-0000-0000-0000-000000000101']);
    expect(find.text('下载记录'), findsOneWidget);
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

  testWidgets('limits a long download title without losing its semantics', (
    tester,
  ) async {
    const title = '一个很长很长的下载标题，用来确认详情页不会被标题完全占满，同时读屏仍然能够读取完整内容';
    final repository = FakeDownloadHistoryRepository(
      detail: downloadDetailFixture(title: title),
    );
    await pumpFramegrabApp(tester, downloadHistoryRepository: repository);

    tester
        .element(find.byKey(const Key('app-bottom-navigation')))
        .go('/downloads/00000000-0000-0000-0000-000000000101');
    await tester.pumpAndSettle();

    final heading = find.byKey(const Key('page-title-heading'));
    final titleText = tester.widget<Text>(
      find.descendant(of: heading, matching: find.byType(Text)),
    );
    expect(titleText.maxLines, 3);
    expect(titleText.overflow, TextOverflow.ellipsis);
    expect(tester.getSemantics(heading).label, title);
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
      final skillField = tester.widget<DropdownMenu<String>>(
        find.descendant(
          of: find.byKey(const Key('analysis-skill-field')),
          matching: find.byType(DropdownMenu<String>),
        ),
      );
      expect(skillField.menuHeight, 304);
      expect(skillField.expandedInsets, EdgeInsets.zero);
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
    expect(find.text('真实下载任务'), findsWidgets);
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
    expect(find.text('FrameFetch · Open Source'), findsOneWidget);
    expect(find.text('把素材，\n带回本地。'), findsOneWidget);
    expect(find.textContaining('数据与运行边界由你掌控'), findsOneWidget);
    expect(find.text('创建本地账户'), findsOneWidget);
    expect(find.text('查看源代码'), findsOneWidget);
    expect(find.text('一套可审计的完整链路'), findsOneWidget);
    expect(find.text('解析'), findsOneWidget);
    expect(find.text('选择'), findsOneWidget);
    expect(find.text('执行'), findsOneWidget);
    expect(find.text('交付'), findsOneWidget);
    expect(find.text('从公开媒体到可验证制品'), findsOneWidget);
    expect(find.text('开源，不交出数据控制权'), findsOneWidget);
    expect(find.text('在自己的基础设施上运行 FrameFetch'), findsOneWidget);
    expect(find.text('阅读部署说明'), findsOneWidget);
    expect(find.byKey(const Key('public-home-login')), findsOneWidget);
    expect(find.byKey(const Key('app-bottom-navigation')), findsNothing);
    expect(find.byKey(const Key('navbar-theme-toggle')), findsOneWidget);
    expect(find.byKey(const Key('public-home-workflow')), findsOneWidget);
    expect(find.byKey(const Key('public-home-capabilities')), findsOneWidget);
    expect(find.byKey(const Key('public-home-safeguards')), findsOneWidget);

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
