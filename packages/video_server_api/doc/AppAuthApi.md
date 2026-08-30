# video_server_api.api.AppAuthApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getNativeCurrentUser**](AppAuthApi.md#getnativecurrentuser) | **GET** /api/app/v1/auth/me | 查询原生应用当前用户
[**loginNativeUser**](AppAuthApi.md#loginnativeuser) | **POST** /api/app/v1/auth/login | 登录原生应用
[**logoutNativeSession**](AppAuthApi.md#logoutnativesession) | **POST** /api/app/v1/auth/logout | 退出原生应用
[**refreshNativeSession**](AppAuthApi.md#refreshnativesession) | **POST** /api/app/v1/auth/refresh | 轮换原生应用会话
[**registerNativeUser**](AppAuthApi.md#registernativeuser) | **POST** /api/app/v1/auth/register | 注册原生应用用户


# **getNativeCurrentUser**
> UserResponse getNativeCurrentUser()

查询原生应用当前用户

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAppAuthApi();

try {
    final response = api.getNativeCurrentUser();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppAuthApi->getNativeCurrentUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginNativeUser**
> NativeSessionResponse loginNativeUser(emailPasswordRequest)

登录原生应用

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAppAuthApi();
final EmailPasswordRequest emailPasswordRequest = ; // EmailPasswordRequest |

try {
    final response = api.loginNativeUser(emailPasswordRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppAuthApi->loginNativeUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailPasswordRequest** | [**EmailPasswordRequest**](EmailPasswordRequest.md)|  |

### Return type

[**NativeSessionResponse**](NativeSessionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logoutNativeSession**
> logoutNativeSession(nativeLogoutRequest)

退出原生应用

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAppAuthApi();
final NativeLogoutRequest nativeLogoutRequest = ; // NativeLogoutRequest |

try {
    api.logoutNativeSession(nativeLogoutRequest);
} on DioException catch (e) {
    print('Exception when calling AppAuthApi->logoutNativeSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nativeLogoutRequest** | [**NativeLogoutRequest**](NativeLogoutRequest.md)|  |

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshNativeSession**
> NativeSessionResponse refreshNativeSession(nativeRefreshRequest)

轮换原生应用会话

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAppAuthApi();
final NativeRefreshRequest nativeRefreshRequest = ; // NativeRefreshRequest |

try {
    final response = api.refreshNativeSession(nativeRefreshRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppAuthApi->refreshNativeSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **nativeRefreshRequest** | [**NativeRefreshRequest**](NativeRefreshRequest.md)|  |

### Return type

[**NativeSessionResponse**](NativeSessionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerNativeUser**
> NativeSessionResponse registerNativeUser(registerRequest)

注册原生应用用户

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAppAuthApi();
final RegisterRequest registerRequest = ; // RegisterRequest |

try {
    final response = api.registerNativeUser(registerRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppAuthApi->registerNativeUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerRequest** | [**RegisterRequest**](RegisterRequest.md)|  |

### Return type

[**NativeSessionResponse**](NativeSessionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
