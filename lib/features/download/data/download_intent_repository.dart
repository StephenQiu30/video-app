import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final downloadIntentRepositoryProvider = Provider<DownloadIntentRepository>(
  (ref) => GeneratedDownloadIntentRepository(
    ref.watch(authenticatedRequestProvider),
  ),
);

abstract interface class DownloadIntentRepository {
  Future<IntentResponse> create({
    required String input,
    required String idempotencyKey,
  });
  Future<IntentResponse> find(String idempotencyKey);
  Future<IntentResponse> get(String id);
  Future<IntentHistoryResponse> history({String? before});
  Future<IntentResponse> refresh(String id);
  Future<IntentResponse> cancel(String id);
  Future<InspectionResponse> inspection(String id);
}

final class GeneratedDownloadIntentRepository
    implements DownloadIntentRepository {
  const GeneratedDownloadIntentRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<IntentResponse> create({
    required String input,
    required String idempotencyKey,
  }) => _required(
    (client) => client
        .getDownloadIntentsApi()
        .createDownloadIntent(
          idempotencyKey: idempotencyKey,
          intentRequest: IntentRequest((builder) => builder..input = input),
        )
        .then((response) => response.data?.data),
  );

  @override
  Future<IntentResponse> find(String idempotencyKey) => _required(
    (client) => client
        .getDownloadIntentsApi()
        .findDownloadIntent(idempotencyKey: idempotencyKey)
        .then((response) => response.data?.data),
  );

  @override
  Future<IntentResponse> get(String id) => _required(
    (client) => client
        .getDownloadIntentsApi()
        .getDownloadIntent(intentId: id)
        .then((response) => response.data?.data),
  );

  @override
  Future<IntentHistoryResponse> history({String? before}) => _required(
    (client) => client
        .getDownloadIntentsApi()
        .listDownloadIntents(before: before)
        .then((response) => response.data?.data),
  );

  @override
  Future<IntentResponse> refresh(String id) => _required(
    (client) => client
        .getDownloadIntentsApi()
        .refreshDownloadIntent(intentId: id)
        .then((response) => response.data?.data),
  );

  @override
  Future<IntentResponse> cancel(String id) => _required(
    (client) => client
        .getDownloadIntentsApi()
        .cancelDownloadIntent(intentId: id)
        .then((response) => response.data?.data),
  );

  @override
  Future<InspectionResponse> inspection(String id) => _required(
    (client) => client
        .getInspectionsApi()
        .getInspection(inspectionId: id)
        .then((response) => response.data?.data),
  );

  Future<T> _required<T>(
    Future<T?> Function(VideoServerApi client) operation,
  ) => _request.execute((client) async {
    final data = await operation(client);
    if (data == null) {
      throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
    }
    return data;
  });
}
