import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/upload/data/content_upload_requests.dart';
import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

final contentUploadRepositoryProvider = Provider<ContentUploadRepository>(
  (ref) => GeneratedContentUploadRepository(
    ref.watch(authenticatedRequestProvider),
    MultipartUploader(),
  ),
);

abstract interface class ContentUploadRepository {
  Future<ContentUploadResult> upload({
    required CancelToken cancelToken,
    required LocalContentFile file,
    required ContentUploadKind kind,
    required void Function(ContentUploadPhase) onPhase,
    required void Function(int) onProgress,
  });
}

final class GeneratedContentUploadRepository
    implements ContentUploadRepository {
  const GeneratedContentUploadRepository(
    this._request,
    this._uploader, {
    this.uploadTimeout = const Duration(minutes: 30),
  });

  final AuthenticatedRequest _request;
  final MultipartUploader _uploader;
  final Duration uploadTimeout;

  @override
  Future<ContentUploadResult> upload({
    required CancelToken cancelToken,
    required LocalContentFile file,
    required ContentUploadKind kind,
    required void Function(ContentUploadPhase) onPhase,
    required void Function(int) onProgress,
  }) =>
      _upload(
        cancelToken: cancelToken,
        file: file,
        kind: kind,
        onPhase: onPhase,
        onProgress: onProgress,
      ).timeout(
        uploadTimeout,
        onTimeout: () {
          cancelToken.cancel('Upload time budget exceeded');
          throw const ContentUploadFailure(
            ContentUploadFailureCode.uploadFailed,
          );
        },
      );

  Future<ContentUploadResult> _upload({
    required CancelToken cancelToken,
    required LocalContentFile file,
    required ContentUploadKind kind,
    required void Function(ContentUploadPhase) onPhase,
    required void Function(int) onProgress,
  }) async {
    final requests = ContentUploadRequests(_request, cancelToken);
    String? resourceId;
    try {
      requests.checkActive();
      onPhase(ContentUploadPhase.hashing);
      final sha = await _uploader.hashFile(file, cancelToken, onProgress);
      requests.checkActive();
      onPhase(ContentUploadPhase.creating);
      resourceId = await requests.create(kind, file, sha);
      final session = await requests.session(kind, resourceId);
      onPhase(ContentUploadPhase.uploading);
      onProgress(0);
      final parts = await _uploader.upload(
        file,
        session,
        cancelToken,
        onProgress,
      );
      requests.checkActive();
      onPhase(ContentUploadPhase.completing);
      onProgress(100);
      final resultId = await requests.complete(kind, resourceId, parts);
      return ContentUploadResult(kind: kind, resourceId: resultId);
    } catch (_) {
      if (resourceId != null) await requests.cancelBestEffort(kind, resourceId);
      rethrow;
    }
  }
}
