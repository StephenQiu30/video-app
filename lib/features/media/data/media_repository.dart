import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';

final mediaRepositoryProvider = Provider<MediaRepository>(
  (ref) => GeneratedMediaRepository(ref.watch(authenticatedRequestProvider)),
);

abstract interface class MediaRepository {
  Future<Uint8List> fetchThumbnail(String resourcePath);

  Future<Uri> issueDownloadUrl(String jobId);
}

final class GeneratedMediaRepository implements MediaRepository {
  const GeneratedMediaRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<Uint8List> fetchThumbnail(String resourcePath) {
    final target = _thumbnailTarget(resourcePath);
    return _request.execute((client) async {
      final response = switch (target.kind) {
        _ThumbnailKind.download =>
          client.getDownloadsApi().getDownloadThumbnail(jobId: target.id),
        _ThumbnailKind.inspection =>
          client.getInspectionsApi().getInspectionThumbnail(
            inspectionId: target.id,
          ),
      };
      final data = (await response).data;
      if (data == null || data.isEmpty) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return data;
    });
  }

  @override
  Future<Uri> issueDownloadUrl(String jobId) {
    return _request.execute((client) async {
      final response = await client.getDownloadsApi().issueDownloadUrl(
        jobId: jobId,
      );
      final value = response.data?.url;
      final uri = value == null ? null : Uri.tryParse(value);
      if (uri == null || (uri.scheme != 'http' && uri.scheme != 'https')) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return uri;
    });
  }
}

enum _ThumbnailKind { download, inspection }

final class _ThumbnailTarget {
  const _ThumbnailTarget(this.kind, this.id);

  final _ThumbnailKind kind;
  final String id;
}

_ThumbnailTarget _thumbnailTarget(String path) {
  final match = RegExp(
    r'^/api/(downloads|inspections)/([0-9a-fA-F-]{36})/thumbnail$',
  ).firstMatch(path);
  if (match == null) {
    throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
  }
  return _ThumbnailTarget(
    match.group(1) == 'downloads'
        ? _ThumbnailKind.download
        : _ThumbnailKind.inspection,
    match.group(2)!,
  );
}
