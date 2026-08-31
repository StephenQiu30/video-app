# video_server_api.api.MediaImportsApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completeMediaImport**](MediaImportsApi.md#completemediaimport) | **POST** /api/media-imports/{resource_id}/complete | 完成视频上传并触发验证
[**createMediaImport**](MediaImportsApi.md#createmediaimport) | **POST** /api/media-imports | 创建本地视频导入
[**createMediaUploadSession**](MediaImportsApi.md#createmediauploadsession) | **POST** /api/media-imports/{resource_id}/upload-sessions | 创建或刷新视频上传会话


# **completeMediaImport**
> MediaImportResponse completeMediaImport(resourceId, completeMediaImportRequest)

完成视频上传并触发验证

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getMediaImportsApi();
final String resourceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final CompleteMediaImportRequest completeMediaImportRequest = ; // CompleteMediaImportRequest |

try {
    final response = api.completeMediaImport(resourceId, completeMediaImportRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MediaImportsApi->completeMediaImport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resourceId** | **String**|  |
 **completeMediaImportRequest** | [**CompleteMediaImportRequest**](CompleteMediaImportRequest.md)|  |

### Return type

[**MediaImportResponse**](MediaImportResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMediaImport**
> MediaImportResponse createMediaImport(idempotencyKey, mediaImportRequest)

创建本地视频导入

创建只接受 MP4 的浏览器上传资源，不接收任意存储参数。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getMediaImportsApi();
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。
final MediaImportRequest mediaImportRequest = ; // MediaImportRequest |

try {
    final response = api.createMediaImport(idempotencyKey, mediaImportRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MediaImportsApi->createMediaImport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |
 **mediaImportRequest** | [**MediaImportRequest**](MediaImportRequest.md)|  |

### Return type

[**MediaImportResponse**](MediaImportResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMediaUploadSession**
> MediaUploadSessionResponse createMediaUploadSession(resourceId)

创建或刷新视频上传会话

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getMediaImportsApi();
final String resourceId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.createMediaUploadSession(resourceId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MediaImportsApi->createMediaUploadSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **resourceId** | **String**|  |

### Return type

[**MediaUploadSessionResponse**](MediaUploadSessionResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
