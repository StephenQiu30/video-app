import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final providerStatusRepositoryProvider = Provider<ProviderStatusRepository>(
  (ref) => GeneratedProviderStatusRepository(
    ref.watch(authenticatedRequestProvider),
  ),
);

abstract interface class ProviderStatusRepository {
  Future<ProviderListResponse> fetch();
}

final class GeneratedProviderStatusRepository
    implements ProviderStatusRepository {
  const GeneratedProviderStatusRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<ProviderListResponse> fetch() {
    return _request.execute((client) async {
      final response = await client.getProvidersApi().listProviders();
      final data = response.data;
      if (data == null) {
        throw const DataRequestFailure(DataRequestFailureKind.invalidResponse);
      }
      return data;
    });
  }
}
