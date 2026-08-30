# video_server_api.api.InspectionsApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getInspectionThumbnail**](InspectionsApi.md#getinspectionthumbnail) | **GET** /api/inspections/{inspection_id}/thumbnail | 读取持久化媒体封面


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
