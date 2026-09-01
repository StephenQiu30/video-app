import 'dart:math';

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

  Future<void> delete(String jobId);

  Future<DownloadResponse> cancel(String jobId);

  Future<DownloadResponse> retry(String jobId);
}

final class GeneratedDownloadHistoryRepository
    implements DownloadHistoryRepository {
  const GeneratedDownloadHistoryRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<void> delete(String jobId) {
    return _request.execute((client) async {
      await client.getDownloadsApi().deleteDownload(jobId: jobId);
    });
  }

  @override
  Future<DownloadResponse> cancel(String jobId) {
    return _required(
      (api) => api.cancelDownload(jobId: jobId).then((value) => value.data),
    );
  }

  @override
  Future<DownloadResponse> fetchDetail(String jobId) {
    return _required(
      (api) => api.getDownload(jobId: jobId).then((value) => value.data),
    );
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

  @override
  Future<DownloadResponse> retry(String jobId) {
    final nonce = Random.secure().nextInt(0x7fffffff).toRadixString(16);
    final key =
        'app-retry-${DateTime.now().toUtc().microsecondsSinceEpoch}-$nonce';
    return _required(
      (api) => api
          .retryDownload(jobId: jobId, idempotencyKey: key)
          .then((value) => value.data),
    );
  }

  Future<T> _required<T>(Future<T?> Function(DownloadsApi api) operation) =>
      _request.execute((client) async {
        final data = await operation(client.getDownloadsApi());
        if (data == null) {
          throw const DataRequestFailure(
            DataRequestFailureKind.invalidResponse,
          );
        }
        return data;
      });
}
