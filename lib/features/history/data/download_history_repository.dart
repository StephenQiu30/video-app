import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final downloadHistoryRepositoryProvider = Provider<DownloadHistoryRepository>(
  (ref) => GeneratedDownloadHistoryRepository(
    ref.watch(authenticatedRequestProvider),
  ),
);

abstract interface class DownloadHistoryRepository {
  Future<DownloadHistoryResponse> fetchFirstPage();

  Future<DownloadResponse> fetchDetail(String jobId);
}

final class GeneratedDownloadHistoryRepository
    implements DownloadHistoryRepository {
  const GeneratedDownloadHistoryRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<DownloadResponse> fetchDetail(String jobId) {
    return _request.execute((client) async {
      final response = await client.getDownloadsApi().getDownload(jobId: jobId);
      final data = response.data;
      if (data == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return data;
    });
  }

  @override
  Future<DownloadHistoryResponse> fetchFirstPage() {
    return _request.execute((client) async {
      final response = await client.getDownloadsApi().getDownloadHistory(
        page: 1,
        pageSize: 20,
      );
      final data = response.data;
      if (data == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return data;
    });
  }
}
