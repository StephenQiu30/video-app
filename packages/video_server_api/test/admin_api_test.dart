import 'package:test/test.dart';
import 'package:video_server_api/video_server_api.dart';

/// tests for AdminApi
void main() {
  final instance = VideoServerApi().getAdminApi();

  group(AdminApi, () {
    // 启用 AI 分析 Provider
    //
    //Future<AiProviderProfileResponse> activateAiProviderProfile(String providerKey) async
    test('test activateAiProviderProfile', () async {
      // TODO
    });

    // 手动清理指定天数前的文件
    //
    //Future<StorageCleanupResponse> cleanupStoredFiles(StorageCleanupRequest storageCleanupRequest) async
    test('test cleanupStoredFiles', () async {
      // TODO
    });

    // 查询下载分析
    //
    // 按 UTC 自然日查询管理员可见的全局下载聚合。
    //
    //Future<DownloadAnalyticsResponse> getDownloadAnalytics({ int days }) async
    test('test getDownloadAnalytics', () async {
      // TODO
    });

    // 查询 AI 分析 Provider
    //
    //Future<AiProviderProfileListResponse> listAiProviderProfiles() async
    test('test listAiProviderProfiles', () async {
      // TODO
    });

    // 查询平台目录
    //
    //Future<ProviderCatalogListResponse> listProviderCatalogEntries() async
    test('test listProviderCatalogEntries', () async {
      // TODO
    });

    // 分页查询持久文件
    //
    //Future<StoredFileListResponse> listStoredFiles({ int page, int pageSize }) async
    test('test listStoredFiles', () async {
      // TODO
    });

    // 查询用户列表
    //
    //Future<ManagedUserListResponse> listUsers({ int page, int pageSize, String search, UserRole role, bool isActive }) async
    test('test listUsers', () async {
      // TODO
    });

    // 更新平台目录条目
    //
    //Future<ProviderCatalogEntryResponse> updateProviderCatalogEntry(String providerKey, UpdateProviderCatalogEntryRequest updateProviderCatalogEntryRequest) async
    test('test updateProviderCatalogEntry', () async {
      // TODO
    });

    // 更新用户角色与账号状态
    //
    //Future<ManagedUserResponse> updateUserAccess(String userId, UpdateUserAccessRequest updateUserAccessRequest) async
    test('test updateUserAccess', () async {
      // TODO
    });
  });
}
