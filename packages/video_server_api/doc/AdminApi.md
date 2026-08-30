# video_server_api.api.AdminApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activateAiProviderProfile**](AdminApi.md#activateaiproviderprofile) | **POST** /api/admin/ai-providers/{provider_key}/activate | 启用 AI 分析 Provider
[**cleanupStoredFiles**](AdminApi.md#cleanupstoredfiles) | **POST** /api/admin/files/cleanup | 手动清理指定天数前的文件
[**getDownloadAnalytics**](AdminApi.md#getdownloadanalytics) | **GET** /api/admin/downloads/analytics | 查询下载分析
[**listAiProviderProfiles**](AdminApi.md#listaiproviderprofiles) | **GET** /api/admin/ai-providers | 查询 AI 分析 Provider
[**listProviderCatalogEntries**](AdminApi.md#listprovidercatalogentries) | **GET** /api/admin/providers | 查询平台目录
[**listStoredFiles**](AdminApi.md#liststoredfiles) | **GET** /api/admin/files | 分页查询持久文件
[**listUsers**](AdminApi.md#listusers) | **GET** /api/admin/users | 查询用户列表
[**updateProviderCatalogEntry**](AdminApi.md#updateprovidercatalogentry) | **PATCH** /api/admin/providers/{provider_key} | 更新平台目录条目
[**updateUserAccess**](AdminApi.md#updateuseraccess) | **PATCH** /api/admin/users/{user_id} | 更新用户角色与账号状态


# **activateAiProviderProfile**
> AiProviderProfileResponse activateAiProviderProfile(providerKey)

启用 AI 分析 Provider

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();
final String providerKey = providerKey_example; // String |

try {
    final response = api.activateAiProviderProfile(providerKey);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->activateAiProviderProfile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerKey** | **String**|  |

### Return type

[**AiProviderProfileResponse**](AiProviderProfileResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cleanupStoredFiles**
> StorageCleanupResponse cleanupStoredFiles(storageCleanupRequest)

手动清理指定天数前的文件

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();
final StorageCleanupRequest storageCleanupRequest = ; // StorageCleanupRequest |

try {
    final response = api.cleanupStoredFiles(storageCleanupRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->cleanupStoredFiles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storageCleanupRequest** | [**StorageCleanupRequest**](StorageCleanupRequest.md)|  |

### Return type

[**StorageCleanupResponse**](StorageCleanupResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDownloadAnalytics**
> DownloadAnalyticsResponse getDownloadAnalytics(days)

查询下载分析

按 UTC 自然日查询管理员可见的全局下载聚合。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();
final int days = 56; // int |

try {
    final response = api.getDownloadAnalytics(days);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->getDownloadAnalytics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **days** | **int**|  | [optional] [default to 30]

### Return type

[**DownloadAnalyticsResponse**](DownloadAnalyticsResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAiProviderProfiles**
> AiProviderProfileListResponse listAiProviderProfiles()

查询 AI 分析 Provider

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();

try {
    final response = api.listAiProviderProfiles();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listAiProviderProfiles: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiProviderProfileListResponse**](AiProviderProfileListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProviderCatalogEntries**
> ProviderCatalogListResponse listProviderCatalogEntries()

查询平台目录

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();

try {
    final response = api.listProviderCatalogEntries();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listProviderCatalogEntries: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ProviderCatalogListResponse**](ProviderCatalogListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStoredFiles**
> StoredFileListResponse listStoredFiles(page, pageSize)

分页查询持久文件

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();
final int page = 56; // int |
final int pageSize = 56; // int |

try {
    final response = api.listStoredFiles(page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listStoredFiles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**StoredFileListResponse**](StoredFileListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listUsers**
> ManagedUserListResponse listUsers(page, pageSize)

查询用户列表

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();
final int page = 56; // int |
final int pageSize = 56; // int |

try {
    final response = api.listUsers(page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->listUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**ManagedUserListResponse**](ManagedUserListResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateProviderCatalogEntry**
> ProviderCatalogEntryResponse updateProviderCatalogEntry(providerKey, updateProviderCatalogEntryRequest)

更新平台目录条目

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();
final String providerKey = providerKey_example; // String |
final UpdateProviderCatalogEntryRequest updateProviderCatalogEntryRequest = ; // UpdateProviderCatalogEntryRequest |

try {
    final response = api.updateProviderCatalogEntry(providerKey, updateProviderCatalogEntryRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->updateProviderCatalogEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerKey** | **String**|  |
 **updateProviderCatalogEntryRequest** | [**UpdateProviderCatalogEntryRequest**](UpdateProviderCatalogEntryRequest.md)|  |

### Return type

[**ProviderCatalogEntryResponse**](ProviderCatalogEntryResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserAccess**
> ManagedUserResponse updateUserAccess(userId, updateUserAccessRequest)

更新用户角色与账号状态

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAdminApi();
final String userId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final UpdateUserAccessRequest updateUserAccessRequest = ; // UpdateUserAccessRequest |

try {
    final response = api.updateUserAccess(userId, updateUserAccessRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminApi->updateUserAccess: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  |
 **updateUserAccessRequest** | [**UpdateUserAccessRequest**](UpdateUserAccessRequest.md)|  |

### Return type

[**ManagedUserResponse**](ManagedUserResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
