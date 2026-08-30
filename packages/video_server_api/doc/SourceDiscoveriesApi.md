# video_server_api.api.SourceDiscoveriesApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSourceDiscovery**](SourceDiscoveriesApi.md#createsourcediscovery) | **POST** /api/source-discoveries | 发现微信公众号文章中的视频
[**getSourceDiscovery**](SourceDiscoveriesApi.md#getsourcediscovery) | **GET** /api/source-discoveries/{discovery_id} | 查询文章视频发现结果


# **createSourceDiscovery**
> SourceDiscoveryResponse createSourceDiscovery(idempotencyKey, sourceDiscoveryRequest)

发现微信公众号文章中的视频

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getSourceDiscoveriesApi();
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。
final SourceDiscoveryRequest sourceDiscoveryRequest = ; // SourceDiscoveryRequest |

try {
    final response = api.createSourceDiscovery(idempotencyKey, sourceDiscoveryRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SourceDiscoveriesApi->createSourceDiscovery: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |
 **sourceDiscoveryRequest** | [**SourceDiscoveryRequest**](SourceDiscoveryRequest.md)|  |

### Return type

[**SourceDiscoveryResponse**](SourceDiscoveryResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSourceDiscovery**
> SourceDiscoveryResponse getSourceDiscovery(discoveryId)

查询文章视频发现结果

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getSourceDiscoveriesApi();
final String discoveryId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getSourceDiscovery(discoveryId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SourceDiscoveriesApi->getSourceDiscovery: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **discoveryId** | **String**|  |

### Return type

[**SourceDiscoveryResponse**](SourceDiscoveryResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
