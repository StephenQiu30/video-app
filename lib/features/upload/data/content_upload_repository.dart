import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/upload/data/content_upload_api_support.dart';
import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:video_server_api/video_server_api.dart';

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
  const GeneratedContentUploadRepository(this._request, this._uploader);

  final AuthenticatedRequest _request;
  final MultipartUploader _uploader;

  @override
  Future<ContentUploadResult> upload({
    required CancelToken cancelToken,
    required LocalContentFile file,
    required ContentUploadKind kind,
    required void Function(ContentUploadPhase) onPhase,
    required void Function(int) onProgress,
  }) async {
    String? resourceId;
    try {
      onPhase(ContentUploadPhase.hashing);
      final sha = await _uploader.hashFile(file, cancelToken, onProgress);
      onPhase(ContentUploadPhase.creating);
      resourceId = await _create(kind, file, sha);
      final session = await _session(kind, resourceId);
      onPhase(ContentUploadPhase.uploading);
      onProgress(0);
      final parts = await _uploader.upload(
        file,
        session,
        cancelToken,
        onProgress,
      );
      onPhase(ContentUploadPhase.completing);
      onProgress(100);
      final resultId = await _complete(kind, resourceId, parts);
      return ContentUploadResult(kind: kind, resourceId: resultId);
    } catch (_) {
      if (resourceId != null) await _cancelBestEffort(kind, resourceId);
      rethrow;
    }
  }

  Future<String> _create(
    ContentUploadKind kind,
    LocalContentFile file,
    String sha,
  ) => _required((client) async {
    final key = uploadIdempotencyKey(kind, file, sha);
    if (kind == ContentUploadKind.video) {
      final body = MediaImportRequest(
        (builder) => builder
          ..fileName = file.name
          ..declaredSizeBytes = file.size
          ..declaredSha256 = sha
          ..rightsAccepted = true,
      );
      final data = (await client.getMediaImportsApi().createMediaImport(
        idempotencyKey: key,
        mediaImportRequest: body,
      )).data;
      return data?.id;
    }
    final body = DocumentImportRequest(
      (builder) => builder
        ..fileName = file.name
        ..sourceFormat = documentFormat(file.name)
        ..declaredSizeBytes = file.size
        ..declaredSha256 = sha
        ..rightsAccepted = true,
    );
    final data = (await client.getDocumentsApi().createDocumentImport(
      idempotencyKey: key,
      documentImportRequest: body,
    )).data;
    return data?.id;
  });

  Future<MultipartSession> _session(
    ContentUploadKind kind,
    String id,
  ) => _required((client) async {
    if (kind == ContentUploadKind.video) {
      final data = (await client.getMediaImportsApi().createMediaUploadSession(
        resourceId: id,
      )).data;
      return data == null ? null : mediaSession(data);
    }
    final data = (await client.getDocumentsApi().createDocumentUploadSession(
      documentId: id,
    )).data;
    return data == null ? null : documentSession(data);
  });

  Future<String> _complete(
    ContentUploadKind kind,
    String id,
    List<CompletedUploadPart> parts,
  ) => _required((client) async {
    final requests = parts.map(
      (part) => CompletedPartRequest(
        (builder) => builder
          ..partNumber = part.number
          ..etag = part.etag,
      ),
    );
    if (kind == ContentUploadKind.video) {
      final body = CompleteMediaImportRequest(
        (builder) => builder.parts.replace(requests),
      );
      return (await client.getMediaImportsApi().completeMediaImport(
        resourceId: id,
        completeMediaImportRequest: body,
      )).data?.downloadId;
    }
    final body = CompleteDocumentImportRequest(
      (builder) => builder.parts.replace(requests),
    );
    return (await client.getDocumentsApi().completeDocumentImport(
      documentId: id,
      completeDocumentImportRequest: body,
    )).data?.id;
  });

  Future<void> _cancelBestEffort(ContentUploadKind kind, String id) async {
    try {
      await _request.execute((client) async {
        if (kind == ContentUploadKind.video) {
          await client.getDownloadsApi().cancelDownload(jobId: id);
        } else {
          await client.getDocumentsApi().cancelDocumentImport(documentId: id);
        }
      });
    } catch (_) {}
  }

  Future<T> _required<T>(
    Future<T?> Function(VideoServerApi client) operation,
  ) => _request.execute((client) async {
    final value = await operation(client);
    if (value == null) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return value;
  });
}
