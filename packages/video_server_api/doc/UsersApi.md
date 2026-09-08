# video_server_api.api.UsersApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**updateCurrentUser**](UsersApi.md#updatecurrentuser) | **PATCH** /api/users/me | 更新当前用户资料


# **updateCurrentUser**
> UserResponse updateCurrentUser(updateProfileRequest)

更新当前用户资料

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getUsersApi();
final UpdateProfileRequest updateProfileRequest = ; // UpdateProfileRequest |

try {
    final response = api.updateCurrentUser(updateProfileRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling UsersApi->updateCurrentUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateProfileRequest** | [**UpdateProfileRequest**](UpdateProfileRequest.md)|  |

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
