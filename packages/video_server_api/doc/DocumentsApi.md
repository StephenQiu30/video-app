# video_server_api.api.DocumentsApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelDocumentImport**](DocumentsApi.md#canceldocumentimport) | **POST** /api/documents/{document_id}/cancel | 取消剧本文档导入
[**completeDocumentImport**](DocumentsApi.md#completedocumentimport) | **POST** /api/documents/{document_id}/complete | 完成文档上传并触发验证
[**createDocumentImport**](DocumentsApi.md#createdocumentimport) | **POST** /api/documents | 创建剧本文档导入
[**createDocumentUploadSession**](DocumentsApi.md#createdocumentuploadsession) | **POST** /api/documents/{document_id}/upload-sessions | 创建或刷新文档上传会话
[**listDocuments**](DocumentsApi.md#listdocuments) | **GET** /api/documents | 查询剧本文档列表


# **cancelDocumentImport**
> DocumentImportResponse cancelDocumentImport(documentId)

取消剧本文档导入

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDocumentsApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.cancelDocumentImport(documentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DocumentsApi->cancelDocumentImport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  |

### Return type

[**DocumentImportResponse**](DocumentImportResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **completeDocumentImport**
> DocumentImportResponse completeDocumentImport(documentId, completeDocumentImportRequest)

完成文档上传并触发验证

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDocumentsApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final CompleteDocumentImportRequest completeDocumentImportRequest = ; // CompleteDocumentImportRequest |

try {
    final response = api.completeDocumentImport(documentId, completeDocumentImportRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DocumentsApi->completeDocumentImport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  |
 **completeDocumentImportRequest** | [**CompleteDocumentImportRequest**](CompleteDocumentImportRequest.md)|  |

### Return type

[**DocumentImportResponse**](DocumentImportResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createDocumentImport**
> DocumentImportResponse createDocumentImport(idempotencyKey, documentImportRequest)

创建剧本文档导入

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDocumentsApi();
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。
final DocumentImportRequest documentImportRequest = ; // DocumentImportRequest |

try {
    final response = api.createDocumentImport(idempotencyKey, documentImportRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DocumentsApi->createDocumentImport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |
 **documentImportRequest** | [**DocumentImportRequest**](DocumentImportRequest.md)|  |

### Return type

[**DocumentImportResponse**](DocumentImportResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createDocumentUploadSession**
> DocumentUploadSessionResponse createDocumentUploadSession(documentId)

创建或刷新文档上传会话

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDocumentsApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.createDocumentUploadSession(documentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DocumentsApi->createDocumentUploadSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  |

### Return type

[**DocumentUploadSessionResponse**](DocumentUploadSessionResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDocuments**
> DocumentPageResponse listDocuments(page, pageSize)

查询剧本文档列表

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDocumentsApi();
final int page = 56; // int |
final int pageSize = 56; // int |

try {
    final response = api.listDocuments(page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DocumentsApi->listDocuments: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**DocumentPageResponse**](DocumentPageResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
