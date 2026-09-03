import 'package:framegrab/features/download/data/download_intake_repository.dart';
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
  }) async {
    idempotencyKeys.add(idempotencyKey);
    publicUrls.add(url);
    if (error case final failure?) throw failure;
    return inspection;
  }
}

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
      ..expiresAt = DateTime.utc(2026, 8, 30, 13)
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
