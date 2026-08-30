# video_server_api.api.DocumentsApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listDocuments**](DocumentsApi.md#listdocuments) | **GET** /api/documents | 查询剧本文档列表


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
