import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final adminRepositoryProvider = Provider<AdminRepository>(
  (ref) => GeneratedAdminRepository(ref.watch(authenticatedRequestProvider)),
);

abstract interface class AdminRepository {
  Future<DownloadAnalyticsResponse> fetchAnalytics(int days);
  Future<StoredFileListResponse> fetchFiles();
  Future<ManagedUserListResponse> fetchUsers();
  Future<ProviderCatalogListResponse> fetchProviders();
  Future<AiProviderProfileListResponse> fetchAiProviders();
  Future<StorageCleanupResponse> cleanupFiles(int olderThanDays);
  Future<void> updateUser(ManagedUserResponse user, UserRole role, bool active);
  Future<void> updateProviderVisibility(
    ProviderCatalogEntryResponse provider,
    bool visible,
  );
  Future<void> activateAiProvider(String providerKey);
}

final class GeneratedAdminRepository implements AdminRepository {
  const GeneratedAdminRepository(this._request);

  final AuthenticatedRequest _request;

  @override
  Future<DownloadAnalyticsResponse> fetchAnalytics(int days) => _required(
    (api) => api.getDownloadAnalytics(days: days).then((value) => value.data),
  );

  @override
  Future<StoredFileListResponse> fetchFiles() => _required(
    (api) =>
        api.listStoredFiles(page: 1, pageSize: 20).then((value) => value.data),
  );

  @override
  Future<ManagedUserListResponse> fetchUsers() => _required(
    (api) => api.listUsers(page: 1, pageSize: 20).then((value) => value.data),
  );

  @override
  Future<ProviderCatalogListResponse> fetchProviders() => _required(
    (api) => api.listProviderCatalogEntries().then((value) => value.data),
  );

  @override
  Future<AiProviderProfileListResponse> fetchAiProviders() => _required(
    (api) => api.listAiProviderProfiles().then((value) => value.data),
  );

  @override
  Future<StorageCleanupResponse> cleanupFiles(int olderThanDays) => _required(
    (api) => api
        .cleanupStoredFiles(
          storageCleanupRequest: StorageCleanupRequest(
            (builder) => builder..olderThanDays = olderThanDays,
          ),
        )
        .then((value) => value.data),
  );

  @override
  Future<void> updateUser(
    ManagedUserResponse user,
    UserRole role,
    bool active,
  ) => _request.execute((client) async {
    await client.getAdminApi().updateUserAccess(
      userId: user.id,
      updateUserAccessRequest: UpdateUserAccessRequest(
        (builder) => builder
          ..role = role
          ..isActive = active,
      ),
    );
  });

  @override
  Future<void> updateProviderVisibility(
    ProviderCatalogEntryResponse provider,
    bool visible,
  ) => _request.execute((client) async {
    await client.getAdminApi().updateProviderCatalogEntry(
      providerKey: provider.key,
      updateProviderCatalogEntryRequest: UpdateProviderCatalogEntryRequest(
        (builder) => builder..isVisible = visible,
      ),
    );
  });

  @override
  Future<void> activateAiProvider(String providerKey) =>
      _request.execute((client) async {
        await client.getAdminApi().activateAiProviderProfile(
          providerKey: providerKey,
        );
      });

  Future<T> _required<T>(Future<T?> Function(AdminApi api) operation) =>
      _request.execute((client) async {
        final data = await operation(client.getAdminApi());
        if (data == null) {
          throw const DataRequestFailure(
            DataRequestFailureKind.invalidResponse,
          );
        }
        return data;
      });
}
