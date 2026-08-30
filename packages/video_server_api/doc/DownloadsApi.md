# video_server_api.api.DownloadsApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDownload**](DownloadsApi.md#getdownload) | **GET** /api/downloads/{job_id} | 查询下载任务
[**getDownloadHistory**](DownloadsApi.md#getdownloadhistory) | **GET** /api/downloads/history | 查询下载历史


# **getDownload**
> DownloadResponse getDownload(jobId)

查询下载任务

查询当前登录用户拥有的下载任务。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDownloadsApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getDownload(jobId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadsApi->getDownload: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  |

### Return type

[**DownloadResponse**](DownloadResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDownloadHistory**
> DownloadHistoryResponse getDownloadHistory(page, pageSize)

查询下载历史

查询当前登录用户的下载历史。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDownloadsApi();
final int page = 56; // int |
final int pageSize = 56; // int |

try {
    final response = api.getDownloadHistory(page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadsApi->getDownloadHistory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**DownloadHistoryResponse**](DownloadHistoryResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
