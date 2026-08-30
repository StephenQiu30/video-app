import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:one_of/one_of.dart';
import 'package:video_server_api/video_server_api.dart';

final downloadIntakeRepositoryProvider = Provider<DownloadIntakeRepository>(
  (ref) => GeneratedDownloadIntakeRepository(
    ref.watch(authenticatedRequestProvider),
  ),
);

abstract interface class DownloadIntakeRepository {
  Future<SourceDiscoveryResponse> discoverArticle({
    required String idempotencyKey,
    required String url,
  });

  Future<InspectionResponse> inspectPublicUrl({
    required String idempotencyKey,
    required String url,
  });

  Future<InspectionResponse> inspectDiscoveredItem({
    required String discoveryId,
    required String idempotencyKey,
    required String itemRef,
  });

  Future<DownloadResponse> createDownload({
    required String formatId,
    required String idempotencyKey,
    required String inspectionId,
  });
}

final class GeneratedDownloadIntakeRepository
    implements DownloadIntakeRepository {
  const GeneratedDownloadIntakeRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<SourceDiscoveryResponse> discoverArticle({
    required String idempotencyKey,
    required String url,
  }) => _required((client) {
    final body = SourceDiscoveryRequest(
      (builder) => builder
        ..kind = SourceDiscoveryRequestKindEnum.wechatOfficialAccountArticle
        ..url = url,
    );
    return client.getSourceDiscoveriesApi().createSourceDiscovery(
      idempotencyKey: idempotencyKey,
      sourceDiscoveryRequest: body,
    );
  });

  @override
  Future<InspectionResponse> inspectPublicUrl({
    required String idempotencyKey,
    required String url,
  }) {
    final source = PublicUrlInspectionSource(
      (builder) => builder
        ..kind = PublicUrlInspectionSourceKindEnum.publicUrl
        ..url = url,
    );
    return _inspect(source, 1, idempotencyKey);
  }

  @override
  Future<InspectionResponse> inspectDiscoveredItem({
    required String discoveryId,
    required String idempotencyKey,
    required String itemRef,
  }) {
    final source = DiscoveredItemInspectionSource(
      (builder) => builder
        ..kind = DiscoveredItemInspectionSourceKindEnum.discoveredItem
        ..discoveryId = discoveryId
        ..itemRef = itemRef,
    );
    return _inspect(source, 0, idempotencyKey);
  }

  @override
  Future<DownloadResponse> createDownload({
    required String formatId,
    required String idempotencyKey,
    required String inspectionId,
  }) => _required((client) {
    final body = DownloadRequest(
      (builder) => builder
        ..inspectionId = inspectionId
        ..formatId = formatId,
    );
    return client.getDownloadsApi().createDownload(
      idempotencyKey: idempotencyKey,
      downloadRequest: body,
    );
  });

  Future<InspectionResponse> _inspect(
    Object source,
    int typeIndex,
    String idempotencyKey,
  ) => _required((client) {
    final body = InspectionRequest(
      (builder) => builder.source_.oneOf = OneOfDynamic(
        typeIndex: typeIndex,
        types: const [
          DiscoveredItemInspectionSource,
          PublicUrlInspectionSource,
        ],
        value: source,
      ),
    );
    return client.getInspectionsApi().inspectMedia(
      idempotencyKey: idempotencyKey,
      inspectionRequest: body,
    );
  });

  Future<T> _required<T>(
    Future<Response<T>> Function(VideoServerApi client) operation,
  ) => _request.execute((client) async {
    final response = await operation(client);
    final data = response.data;
    if (data == null) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return data;
  });
}
