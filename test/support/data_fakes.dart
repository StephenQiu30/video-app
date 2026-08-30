import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:framegrab/features/history/data/download_history_repository.dart';
import 'package:framegrab/features/providers/data/provider_status_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final class FakeDownloadHistoryRepository implements DownloadHistoryRepository {
  FakeDownloadHistoryRepository({DownloadHistoryResponse? data, this.error})
    : data = data ?? emptyDownloadHistory();

  DownloadHistoryResponse data;
  Object? error;
  int calls = 0;
  final List<String> detailCalls = [];

  @override
  Future<DownloadResponse> cancel(String jobId) async {
    if (error case final failure?) throw failure;
    return downloadDetailFixture(jobId: jobId);
  }

  @override
  Future<DownloadResponse> fetchDetail(String jobId) async {
    detailCalls.add(jobId);
    if (error case final failure?) throw failure;
    return downloadDetailFixture(jobId: jobId);
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
  FakeDocumentRepository({DocumentPageResponse? data, this.error})
    : data = data ?? emptyDocuments();

  DocumentPageResponse data;
  Object? error;
  int calls = 0;

  @override
  Future<DocumentPageResponse> fetchFirstPage() async {
    calls += 1;
    if (error case final failure?) throw failure;
    return data;
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
      ..title = '真实下载任务'
      ..extractorKey = 'youtube'
      ..durationSeconds = 124
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
