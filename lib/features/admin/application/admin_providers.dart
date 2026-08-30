import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final adminAnalyticsProvider = FutureProvider.autoDispose
    .family<DownloadAnalyticsResponse, int>(
      (ref, days) => ref.watch(adminRepositoryProvider).fetchAnalytics(days),
      retry: (_, _) => null,
    );

final adminFilesProvider = FutureProvider.autoDispose<StoredFileListResponse>(
  (ref) => ref.watch(adminRepositoryProvider).fetchFiles(),
  retry: (_, _) => null,
);

final adminUsersProvider = FutureProvider.autoDispose<ManagedUserListResponse>(
  (ref) => ref.watch(adminRepositoryProvider).fetchUsers(),
  retry: (_, _) => null,
);

final adminProviderCatalogProvider =
    FutureProvider.autoDispose<ProviderCatalogListResponse>(
      (ref) => ref.watch(adminRepositoryProvider).fetchProviders(),
      retry: (_, _) => null,
    );

final adminAiProvidersProvider =
    FutureProvider.autoDispose<AiProviderProfileListResponse>(
      (ref) => ref.watch(adminRepositoryProvider).fetchAiProviders(),
      retry: (_, _) => null,
    );
