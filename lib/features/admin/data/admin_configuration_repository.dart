import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final adminConfigurationRepositoryProvider = Provider(
  (ref) =>
      AdminConfigurationRepository(ref.watch(authenticatedRequestProvider)),
);

final class AdminConfigurationRepository {
  const AdminConfigurationRepository(this.request);
  final AuthenticatedRequest request;
  Future<void> createCatalog(CreateProviderCatalogEntryRequest body) =>
      request.execute((client) async {
        await client.getAdminApi().createProviderCatalogEntry(
          createProviderCatalogEntryRequest: body,
        );
      });
  Future<void> updateCatalog(
    String key,
    UpdateProviderCatalogEntryRequest body,
  ) => request.execute((client) async {
    await client.getAdminApi().updateProviderCatalogEntry(
      providerKey: key,
      updateProviderCatalogEntryRequest: body,
    );
  });
  Future<void> deleteCatalog(String key) => request.execute((client) async {
    await client.getAdminApi().deleteProviderCatalogEntry(providerKey: key);
  });
  Future<void> createAi(CreateAiProviderProfileRequest body) =>
      request.execute((client) async {
        await client.getAdminApi().createAiProviderProfile(
          createAiProviderProfileRequest: body,
        );
      });
  Future<void> updateAi(String key, UpdateAiProviderProfileRequest body) =>
      request.execute((client) async {
        await client.getAdminApi().updateAiProviderProfile(
          providerKey: key,
          updateAiProviderProfileRequest: body,
        );
      });
  Future<void> deleteAi(String key) => request.execute((client) async {
    await client.getAdminApi().deleteAiProviderProfile(providerKey: key);
  });
}
