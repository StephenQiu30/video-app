import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:framegrab/features/providers/data/provider_status_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final class FakeDownloadHistoryRepository implements DownloadHistoryRepository {
  FakeDownloadHistoryRepository({
    DownloadHistoryResponse? data,
    this.deleteError,
    this.detail,
    this.error,
  }) : data = data ?? emptyDownloadHistory();

  DownloadHistoryResponse data;
  Object? deleteError;
  DownloadResponse? detail;
  Object? error;
  int calls = 0;
  final List<String> detailCalls = [];
  final List<String> deleteCalls = [];

  @override
  Future<DownloadResponse> cancel(String jobId) async {
    if (error case final failure?) throw failure;
    return downloadDetailFixture(jobId: jobId);
  }

  @override
  Future<DownloadResponse> fetchDetail(String jobId) async {
    detailCalls.add(jobId);
    if (error case final failure?) throw failure;
    return detail ?? downloadDetailFixture(jobId: jobId);
  }

  @override
  Future<void> delete(String jobId) async {
    deleteCalls.add(jobId);
    if (deleteError case final failure?) throw failure;
    if (error case final failure?) throw failure;
    final remaining = data.items.where((item) => item.id != jobId).toList();
    data = data.rebuild((builder) {
      builder.items.replace(remaining);
      builder
        ..total = remaining.length
        ..summary.update((summary) {
          summary
            ..total = remaining.length
            ..succeeded = remaining
                .where((item) => item.status == DownloadStatus.succeeded)
                .length
            ..active = remaining
                .where(
                  (item) =>
                      item.status == DownloadStatus.queued ||
                      item.status == DownloadStatus.running ||
                      item.status == DownloadStatus.retryWait,
                )
                .length
            ..failed = remaining
                .where((item) => item.status == DownloadStatus.failed)
                .length;
        });
    });
  }

  @override
  Future<DownloadHistoryResponse> fetchFirstPage() async {
    calls += 1;
    if (error case final failure?) throw failure;
    return data;
  }

  @override
  Future<DownloadResponse> retry(String jobId) async {
    if (error case final failure?) throw failure;
    return downloadDetailFixture(jobId: jobId);
  }
}

final class FakeDocumentRepository implements DocumentRepository {
  FakeDocumentRepository({
    DocumentPageResponse? data,
    this.deleteError,
    this.detail,
    this.error,
  }) : data = data ?? emptyDocuments();

  DocumentPageResponse data;
  Object? deleteError;
  DocumentDetailResponse? detail;
  Object? error;
  int calls = 0;
  final List<String> detailCalls = [];
  final List<String> deleteCalls = [];

  @override
  Future<void> delete(String documentId) async {
    deleteCalls.add(documentId);
    if (deleteError case final failure?) throw failure;
    if (error case final failure?) throw failure;
    final remaining = data.items
        .where((item) => item.id != documentId)
        .toList();
    data = data.rebuild(
      (builder) => builder
        ..items.replace(remaining)
        ..total = remaining.length,
    );
  }

  @override
  Future<DocumentPageResponse> fetchFirstPage() async {
    calls += 1;
    if (error case final failure?) throw failure;
    return data;
  }

  @override
  Future<DocumentDetailResponse> fetchDetail(String documentId) async {
    detailCalls.add(documentId);
    if (error case final failure?) throw failure;
    return detail ?? documentDetailFixture(documentId: documentId);
  }
}

final class FakeProviderStatusRepository implements ProviderStatusRepository {
  FakeProviderStatusRepository({ProviderListResponse? data, this.error})
    : data = data ?? emptyProviders();

  ProviderListResponse data;
  Object? error;
  int calls = 0;

  @override
  Future<ProviderListResponse> fetch() async {
    calls += 1;
    if (error case final failure?) throw failure;
    return data;
  }
}

DownloadHistoryResponse emptyDownloadHistory() => DownloadHistoryResponse(
  (builder) => builder
    ..items.replace(const [])
    ..page = 1
    ..pageSize = 20
    ..total = 0
    ..summary.replace(
      DownloadHistorySummaryResponse(
        (summary) => summary
          ..total = 0
          ..succeeded = 0
          ..active = 0
          ..failed = 0,
      ),
    ),
);

DocumentPageResponse emptyDocuments() => DocumentPageResponse(
  (builder) => builder
    ..items.replace(const [])
    ..page = 1
    ..pageSize = 20
    ..total = 0,
);

ProviderListResponse emptyProviders() =>
    ProviderListResponse((builder) => builder.items.replace(const []));

DownloadHistoryResponse downloadHistoryFixture() {
  final now = DateTime.utc(2026, 8, 30, 12, 30);
  final item = DownloadHistoryItemResponse(
    (builder) => builder
      ..id = '00000000-0000-0000-0000-000000000101'
      ..title = '真实下载任务'
      ..formatName = '1080p MP4'
      ..status = DownloadStatus.succeeded
      ..progress = 100
      ..createdAt = now
      ..updatedAt = now
      ..finishedAt = now
      ..fileAvailable = true
      ..sourceKind = DownloadSourceKind.remoteProvider
      ..sourceLabel = 'YouTube',
  );
  return DownloadHistoryResponse(
    (builder) => builder
      ..items.replace([item])
      ..page = 1
      ..pageSize = 20
      ..total = 1
      ..summary.replace(
        DownloadHistorySummaryResponse(
          (summary) => summary
            ..total = 1
            ..succeeded = 1
            ..active = 0
            ..failed = 0,
        ),
      ),
  );
}

DownloadResponse downloadDetailFixture({
  String jobId = '00000000-0000-0000-0000-000000000101',
  String title = '真实下载任务',
}) {
  final now = DateTime.utc(2026, 8, 30, 12, 30);
  return DownloadResponse(
    (builder) => builder
      ..id = jobId
      ..inspectionId = '00000000-0000-0000-0000-000000000201'
      ..formatId = '00000000-0000-0000-0000-000000000202'
      ..sourceKind = DownloadSourceKind.remoteProvider
      ..sourceLabel = 'YouTube'
      ..status = DownloadStatus.succeeded
      ..progress = 100
      ..attempt = 1
      ..version = 2
      ..createdAt = now.subtract(const Duration(minutes: 2))
      ..updatedAt = now
      ..finishedAt = now
      ..fileAvailable = true
      ..title = title
      ..extractorKey = 'youtube'
      ..durationSeconds = 124
      ..mediaKind = MediaKind.video
      ..assetCount = 1
      ..format.update(
        (format) => format
          ..height = 1080
          ..width = 1920
          ..fpsBucket = FpsBucket.fps30
          ..dynamicRange = DynamicRange.sdr
          ..videoCodecFamily = VideoCodecFamily.h264
          ..audioCodecFamily = AudioCodecFamily.aac
          ..containerPreference = ContainerPreference.mp4
          ..compatibilityProfile = CompatibilityProfile.balanced,
      ),
  );
}

DocumentPageResponse documentFixture() {
  final now = DateTime.utc(2026, 8, 30, 12, 30);
  final item = DocumentResponse(
    (builder) => builder
      ..id = '00000000-0000-0000-0000-000000000102'
      ..title = '真实剧本'
      ..originalFilename = 'framegrab.docx'
      ..sourceFormat = DocumentSourceFormat.docx
      ..declaredSizeBytes = 2048
      ..status = ImportStatus.ready
      ..attempt = 1
      ..version = 1
      ..detectedLanguage = 'zh'
      ..sceneCount = 12
      ..characterCount = 4
      ..qualityWarnings.replace(const [])
      ..createdAt = now
      ..updatedAt = now
      ..finishedAt = now,
  );
  return DocumentPageResponse(
    (builder) => builder
      ..items.replace([item])
      ..page = 1
      ..pageSize = 20
      ..total = 1,
  );
}

DocumentDetailResponse documentDetailFixture({
  String documentId = '00000000-0000-0000-0000-000000000102',
  ImportStatus status = ImportStatus.ready,
}) {
  final now = DateTime.utc(2026, 8, 30, 12, 30);
  final ready = status == ImportStatus.ready;
  return DocumentDetailResponse((builder) {
    builder
      ..id = documentId
      ..title = '真实剧本'
      ..originalFilename = 'framegrab.docx'
      ..sourceFormat = DocumentSourceFormat.docx
      ..declaredSizeBytes = 2048
      ..status = status
      ..attempt = 1
      ..version = 1
      ..detectedLanguage = ready ? 'zh' : null
      ..sceneCount = ready ? 12 : null
      ..characterCount = ready ? 4 : null
      ..qualityWarnings.replace(
        ready ? const ['manual_review_required'] : const [],
      )
      ..createdAt = now
      ..updatedAt = now
      ..finishedAt = ready ? now : null
      ..preview = ready ? '# 第一场\n\n编辑室内，剪辑师正在核对剧本。' : null
      ..previewTruncated = false;
    if (ready) {
      builder.parseSummary.update(
        (summary) => summary
          ..pageCount = 2
          ..paragraphCount = 8
          ..headingCount = 1
          ..listItemCount = 0
          ..tableCount = 0
          ..dialogueBlockCount = 1,
      );
    }
  });
}

ProviderListResponse providerFixture() {
  final item = ProviderStatusResponse(
    (builder) => builder
      ..key = 'youtube'
      ..displayName = 'YouTube'
      ..registered = true
      ..extractorExists = true
      ..capabilities.replace([ProviderCapability.singleVideo])
      ..accessModes.replace([ProviderAccessMode.anonymous])
      ..status = ProviderSupportStatus.verified
      ..lastCheckedAt = DateTime.utc(2026, 8, 30, 12, 30)
      ..lastCheckSucceeded = true
      ..downloadSupported = true
      ..downloadAvailable = true
      ..lastMediaVerifiedAt = DateTime.utc(2026, 8, 30, 12, 30)
      ..lastVerifiedAt = DateTime.utc(2026, 8, 30, 12, 30),
  );
  return ProviderListResponse((builder) => builder.items.replace([item]));
}
