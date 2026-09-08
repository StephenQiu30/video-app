import 'dart:async';

import 'package:dio/dio.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:framegrab/features/upload/data/content_upload_api_support.dart';
import 'package:framegrab/features/upload/data/multipart_uploader.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:video_server_api/video_server_api.dart';

/// Keeps every stage and any authenticated retry on the initiating session.
final class ContentUploadRequests {
  ContentUploadRequests(this.request, this.token)
    : generation = request.sessionGeneration;

  final AuthenticatedRequest request;
  final CancelToken token;
  final int generation;

  void checkActive() {
    if (request.sessionGeneration != generation && !token.isCancelled) {
      token.cancel('Upload session changed');
    }
    if (token.isCancelled) throw token.cancelError!;
  }

  Future<String> create(
    ContentUploadKind kind,
    LocalContentFile file,
    String sha,
  ) {
    final key = uploadIdempotencyKey(kind, file, sha);
    return _required((client) async {
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
          cancelToken: token,
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
        cancelToken: token,
        documentImportRequest: body,
      )).data;
      return data?.id;
    });
  }

  Future<MultipartSession> session(
    ContentUploadKind kind,
    String id,
  ) => _required((client) async {
    if (kind == ContentUploadKind.video) {
      final data = (await client.getMediaImportsApi().createMediaUploadSession(
        resourceId: id,
        cancelToken: token,
      )).data;
      return data == null ? null : mediaSession(data);
    }
    final data = (await client.getDocumentsApi().createDocumentUploadSession(
      documentId: id,
      cancelToken: token,
    )).data;
    return data == null ? null : documentSession(data);
  });

  Future<String> complete(
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
        cancelToken: token,
        completeMediaImportRequest: body,
      )).data?.downloadId;
    }
    final body = CompleteDocumentImportRequest(
      (builder) => builder.parts.replace(requests),
    );
    return (await client.getDocumentsApi().completeDocumentImport(
      documentId: id,
      cancelToken: token,
      completeDocumentImportRequest: body,
    )).data?.id;
  });

  Future<void> cancelBestEffort(ContentUploadKind kind, String id) async {
    final cleanupToken = CancelToken();
    final timer = Timer(const Duration(seconds: 5), cleanupToken.cancel);
    try {
      await request
          .execute((client) async {
            if (request.sessionGeneration != generation ||
                cleanupToken.isCancelled) {
              return;
            }
            if (kind == ContentUploadKind.video) {
              await client.getDownloadsApi().cancelDownload(
                jobId: id,
                cancelToken: cleanupToken,
              );
            } else {
              await client.getDocumentsApi().cancelDocumentImport(
                documentId: id,
                cancelToken: cleanupToken,
              );
            }
          })
          .timeout(const Duration(seconds: 5));
    } catch (_) {
      // Server-side expiry recovers an import when cancellation is unavailable.
    } finally {
      timer.cancel();
      cleanupToken.cancel();
    }
  }

  Future<T> _required<T>(
    Future<T?> Function(VideoServerApi client) operation,
  ) async {
    checkActive();
    final result = await request.execute((client) async {
      checkActive();
      return operation(client);
    });
    checkActive();
    if (result == null) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return result;
  }
}
