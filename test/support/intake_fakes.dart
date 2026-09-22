import 'package:framegrab/features/download/data/download_intake_repository.dart';
import 'package:framegrab/features/download/data/download_intent_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final class FakeDownloadIntakeRepository implements DownloadIntakeRepository {
  FakeDownloadIntakeRepository({
    DownloadResponse? download,
    SourceDiscoveryResponse? discovery,
    this.error,
    InspectionResponse? inspection,
  }) : download = download ?? intakeDownloadFixture(),
       discovery = discovery ?? sourceDiscoveryFixture(),
       inspection = inspection ?? inspectionFixture();

  DownloadResponse download;
  SourceDiscoveryResponse discovery;
  Object? error;
  InspectionResponse inspection;
  final List<String> publicUrls = [];
  final List<ProviderAccessPolicy?> accessPolicies = [];
  final List<String> discoveryUrls = [];
  final List<String> selectedItems = [];
  final List<String> createdFormats = [];
  final List<String> idempotencyKeys = [];

  @override
  Future<DownloadResponse> createDownload({
    required String formatId,
    required String idempotencyKey,
    required String inspectionId,
  }) async {
    idempotencyKeys.add(idempotencyKey);
    createdFormats.add(formatId);
    if (error case final failure?) throw failure;
    return download;
  }

  @override
  Future<SourceDiscoveryResponse> discoverArticle({
    required String idempotencyKey,
    required String url,
  }) async {
    idempotencyKeys.add(idempotencyKey);
    discoveryUrls.add(url);
    if (error case final failure?) throw failure;
    return discovery;
  }

  @override
  Future<InspectionResponse> inspectDiscoveredItem({
    required String discoveryId,
    required String idempotencyKey,
    required String itemRef,
  }) async {
    idempotencyKeys.add(idempotencyKey);
    selectedItems.add(itemRef);
    if (error case final failure?) throw failure;
    return inspection;
  }

  @override
  Future<InspectionResponse> inspectPublicUrl({
    required String idempotencyKey,
    required String url,
    ProviderAccessPolicy? accessPolicy,
  }) async {
    idempotencyKeys.add(idempotencyKey);
    publicUrls.add(url);
    accessPolicies.add(accessPolicy);
    if (error case final failure?) throw failure;
    return inspection;
  }
}

final class FakeDownloadIntentRepository implements DownloadIntentRepository {
  FakeDownloadIntentRepository(this.intake);

  final FakeDownloadIntakeRepository intake;
  IntentStatus status = IntentStatus.ready;
  Object? createError;
  Object? findError;
  Object? getError;
  Object? inspectionError;
  Object? refreshError;
  Object? cancelError;
  Future<IntentResponse>? pendingCreate;
  Future<IntentResponse>? pendingGet;
  final Map<String?, IntentHistoryResponse> historyPages = {};
  final List<String?> historyBefore = [];
  final List<String> inputs = [];
  final List<String> keys = [];
  final List<String> reads = [];
  int refreshCount = 0;
  int historyReads = 0;
  int cancelCount = 0;

  @override
  Future<IntentResponse> create({
    required String input,
    required String idempotencyKey,
  }) async {
    inputs.add(input);
    keys.add(idempotencyKey);
    if (createError case final failure?) throw failure;
    if (pendingCreate case final pending?) return pending;
    return intentFixture(status: status);
  }

  @override
  Future<IntentResponse> find(String idempotencyKey) async {
    reads.add('key:$idempotencyKey');
    if (findError case final failure?) throw failure;
    return intentFixture(status: status);
  }

  @override
  Future<IntentResponse> get(String id) async {
    reads.add(id);
    if (getError case final failure?) throw failure;
    if (pendingGet case final pending?) return pending;
    return intentFixture(status: status);
  }

  @override
  Future<IntentHistoryResponse> history({String? before}) async {
    historyReads++;
    historyBefore.add(before);
    return historyPages[before] ??
        IntentHistoryResponse((builder) => builder..items.replace([]));
  }

  @override
  Future<IntentResponse> refresh(String id) async {
    refreshCount++;
    if (refreshError case final failure?) throw failure;
    return intentFixture(status: status, version: 3);
  }

  @override
  Future<IntentResponse> cancel(String id) async {
    cancelCount++;
    if (cancelError case final failure?) throw failure;
    return intentFixture(status: IntentStatus.cancelled, version: 3);
  }

  @override
  Future<InspectionResponse> inspection(String id) async {
    if (inspectionError case final failure?) throw failure;
    return intake.inspection;
  }
}

IntentResponse intentFixture({
  IntentStatus status = IntentStatus.ready,
  int version = 2,
  String? reasonCode,
}) => IntentResponse(
  (builder) => builder
    ..id = '00000000-0000-4000-8000-000000000301'
    ..version = version
    ..status = status
    ..reasonCode = reasonCode
    ..deadline = DateTime.utc(2099, 8, 30, 13)
    ..inspectionId = '00000000-0000-0000-0000-000000000301',
);

InspectionResponse inspectionFixture({
  AccessDecision decision = AccessDecision.downloadable,
  bool includeFormats = true,
}) {
  final formats = includeFormats
      ? [
          _format('00000000-0000-0000-0000-000000000302', 1080),
          _format('00000000-0000-0000-0000-000000000303', 720),
        ]
      : <FormatResponse>[];
  return InspectionResponse(
    (builder) => builder
      ..id = '00000000-0000-0000-0000-000000000301'
      ..extractorKey = 'youtube'
      ..providerMediaId = 'media-301'
      ..title = '真实解析视频'
      ..durationSeconds = 125
      ..mediaKind = MediaKind.video
      ..assetCount = 1
      ..thumbnailUrl =
          '/api/inspections/00000000-0000-0000-0000-000000000301/thumbnail'
      ..expiresAt = DateTime.utc(2099, 8, 30, 13)
      ..formats.replace(formats)
      ..sourceOrigin = SourceOrigin.publicUrl
      ..executionMode = ExecutionMode.providerRunner
      ..accessDecision = decision
      ..entitlementState = EntitlementState.publicFree
      ..identityState = IdentityState.verified
      ..protectionState = ProtectionState.clear
      ..rightsBasis = RightsBasis.publicAccess
      ..userAction = decision == AccessDecision.downloadable
          ? null
          : '请使用平台允许的方式处理该内容。',
  );
}

SourceDiscoveryResponse sourceDiscoveryFixture() => SourceDiscoveryResponse(
  (builder) => builder
    ..id = '00000000-0000-0000-0000-000000000311'
    ..providerKey = 'wechat_official_account'
    ..title = '公众号文章视频'
    ..status = DiscoveryStatus.ready
    ..expiresAt = DateTime.utc(2026, 8, 30, 13)
    ..items.replace([
      SourceDiscoveryItemResponse(
        (item) => item
          ..itemRef = '00000000-0000-0000-0000-000000000312'
          ..kind = DiscoveryItemKind.officialAccountNative
          ..title = '候选视频一'
          ..durationMs = 62000
          ..decisionHint = DiscoveryDecisionHint.candidate
          ..status = DiscoveryItemStatus.ready,
      ),
      SourceDiscoveryItemResponse(
        (item) => item
          ..itemRef = '00000000-0000-0000-0000-000000000313'
          ..kind = DiscoveryItemKind.tencentVideo
          ..title = '候选视频二'
          ..durationMs = 48000
          ..decisionHint = DiscoveryDecisionHint.candidate
          ..status = DiscoveryItemStatus.ready,
      ),
    ]),
);

DownloadResponse intakeDownloadFixture() {
  final now = DateTime.utc(2026, 8, 30, 12, 30);
  return DownloadResponse(
    (builder) => builder
      ..id = '00000000-0000-0000-0000-000000000321'
      ..inspectionId = '00000000-0000-0000-0000-000000000301'
      ..formatId = '00000000-0000-0000-0000-000000000302'
      ..sourceKind = DownloadSourceKind.remoteProvider
      ..sourceLabel = 'YouTube'
      ..status = DownloadStatus.queued
      ..progress = 0
      ..attempt = 1
      ..version = 1
      ..createdAt = now
      ..updatedAt = now
      ..fileAvailable = false
      ..title = '真实解析视频'
      ..extractorKey = 'youtube'
      ..durationSeconds = 125
      ..mediaKind = MediaKind.video
      ..assetCount = 1,
  );
}

FormatResponse _format(String id, int height) => FormatResponse(
  (builder) => builder
    ..id = id
    ..displayName = '${height}p MP4'
    ..plan.update(
      (plan) => plan
        ..height = height
        ..width = height == 1080 ? 1920 : 1280
        ..fpsBucket = FpsBucket.fps30
        ..dynamicRange = DynamicRange.sdr
        ..videoCodecFamily = VideoCodecFamily.h264
        ..audioCodecFamily = AudioCodecFamily.aac
        ..containerPreference = ContainerPreference.mp4
        ..compatibilityProfile = CompatibilityProfile.balanced,
    ),
);
