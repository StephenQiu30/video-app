# video_server_api.api.InspectionsApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInspection**](InspectionsApi.md#getinspection) | **GET** /api/inspections/{inspection_id} | 查询媒体解析结果
[**getInspectionThumbnail**](InspectionsApi.md#getinspectionthumbnail) | **GET** /api/inspections/{inspection_id}/thumbnail | 读取持久化媒体封面
[**inspectMedia**](InspectionsApi.md#inspectmedia) | **POST** /api/inspections | 解析媒体信息


# **getInspection**
> InspectionResponse getInspection(inspectionId)

查询媒体解析结果

查询当前登录用户拥有的媒体解析结果。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getInspectionsApi();
final String inspectionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getInspection(inspectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling InspectionsApi->getInspection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inspectionId** | **String**|  |

### Return type

[**InspectionResponse**](InspectionResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getInspectionThumbnail**
> Uint8List getInspectionThumbnail(inspectionId)

读取持久化媒体封面

读取当前用户拥有且存储在私有对象存储中的媒体封面。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getInspectionsApi();
final String inspectionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getInspectionThumbnail(inspectionId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling InspectionsApi->getInspectionThumbnail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inspectionId** | **String**|  |

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/avif, image/jpeg, image/png, image/webp, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inspectMedia**
> InspectionResponse inspectMedia(idempotencyKey, inspectionRequest)

解析媒体信息

校验公开媒体地址并返回可供选择的语义下载格式。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getInspectionsApi();
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。
final InspectionRequest inspectionRequest = ; // InspectionRequest |

try {
    final response = api.inspectMedia(idempotencyKey, inspectionRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling InspectionsApi->inspectMedia: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |
 **inspectionRequest** | [**InspectionRequest**](InspectionRequest.md)|  |

### Return type

[**InspectionResponse**](InspectionResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
