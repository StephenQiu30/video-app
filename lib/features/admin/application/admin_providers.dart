import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/data/admin_repository.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:video_server_api/video_server_api.dart';

final adminAnalyticsProvider = FutureProvider.autoDispose
    .family<DownloadAnalyticsResponse, int>(
      (ref, days) => ref.watch(adminRepositoryProvider).fetchAnalytics(days),
      retry: (_, _) => null,
    );

final adminFilesProvider = FutureProvider.autoDispose<StoredFileListResponse>(
  (ref) => ref
      .watch(adminRepositoryProvider)
      .fetchFiles(page: ref.watch(fileListQueryProvider).page),
  retry: (_, _) => null,
);

final adminUsersProvider = FutureProvider.autoDispose<ManagedUserListResponse>(
  (ref) => ref
      .watch(adminRepositoryProvider)
      .fetchUsers(
        page: ref.watch(userListQueryProvider).page,
        search: ref.watch(userListQueryProvider).search,
        role: ref.watch(userRoleFilterProvider),
        active: ref.watch(userListQueryProvider).status == null
            ? null
            : ref.watch(userListQueryProvider).status == 'active',
      ),
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

final userListQueryProvider =
    NotifierProvider.autoDispose<ListQueryController, ListQuery>(
      ListQueryController.new,
    );

final fileListQueryProvider =
    NotifierProvider.autoDispose<ListQueryController, ListQuery>(
      ListQueryController.new,
    );

final userRoleFilterProvider =
    NotifierProvider.autoDispose<UserRoleFilter, UserRole?>(UserRoleFilter.new);

final class UserRoleFilter extends Notifier<UserRole?> {
  @override
  UserRole? build() => null;
  void select(UserRole? value) {
    state = value;
    ref.read(userListQueryProvider.notifier).page(1);
  }
}
