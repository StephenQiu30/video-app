# video_server_api.api.DownloadsApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelDownload**](DownloadsApi.md#canceldownload) | **POST** /api/downloads/{job_id}/cancel | 取消下载任务
[**createDownload**](DownloadsApi.md#createdownload) | **POST** /api/downloads | 创建下载任务
[**deleteDownload**](DownloadsApi.md#deletedownload) | **DELETE** /api/downloads/{job_id} | 删除下载任务及其私有文件
[**getDownload**](DownloadsApi.md#getdownload) | **GET** /api/downloads/{job_id} | 查询下载任务
[**getDownloadHistory**](DownloadsApi.md#getdownloadhistory) | **GET** /api/downloads/history | 查询下载历史
[**getDownloadThumbnail**](DownloadsApi.md#getdownloadthumbnail) | **GET** /api/downloads/{job_id}/thumbnail | 读取下载任务封面
[**issueDownloadUrl**](DownloadsApi.md#issuedownloadurl) | **POST** /api/downloads/{job_id}/download-url | 签发文件下载地址
[**retryDownload**](DownloadsApi.md#retrydownload) | **POST** /api/downloads/{job_id}/retry | 重试下载任务


# **cancelDownload**
> DownloadResponse cancelDownload(jobId)

取消下载任务

请求取消尚未结束的下载任务。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDownloadsApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.cancelDownload(jobId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadsApi->cancelDownload: $e\n');
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

# **createDownload**
> DownloadResponse createDownload(idempotencyKey, downloadRequest)

创建下载任务

根据解析结果和语义格式创建异步下载任务。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDownloadsApi();
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。
final DownloadRequest downloadRequest = ; // DownloadRequest |

try {
    final response = api.createDownload(idempotencyKey, downloadRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadsApi->createDownload: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |
 **downloadRequest** | [**DownloadRequest**](DownloadRequest.md)|  |

### Return type

[**DownloadResponse**](DownloadResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDownload**
> deleteDownload(jobId)

删除下载任务及其私有文件

删除当前用户的任务、下载制品、本地上传源文件与私有封面。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDownloadsApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    api.deleteDownload(jobId);
} on DioException catch (e) {
    print('Exception when calling DownloadsApi->deleteDownload: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  |

### Return type

void (empty response body)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **getDownloadThumbnail**
> Uint8List getDownloadThumbnail(jobId)

读取下载任务封面

读取当前用户本地导入视频生成的私有首帧封面。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDownloadsApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getDownloadThumbnail(jobId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadsApi->getDownloadThumbnail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  |

### Return type

[**Uint8List**](Uint8List.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: image/avif, image/jpeg, image/png, image/webp, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **issueDownloadUrl**
> DownloadUrlResponse issueDownloadUrl(jobId, preview)

签发文件下载地址

为已完成的下载任务签发短时制品地址。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDownloadsApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final bool preview = true; // bool |

try {
    final response = api.issueDownloadUrl(jobId, preview);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadsApi->issueDownloadUrl: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  |
 **preview** | **bool**|  | [optional] [default to false]

### Return type

[**DownloadUrlResponse**](DownloadUrlResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **retryDownload**
> DownloadResponse retryDownload(jobId, idempotencyKey)

重试下载任务

从失败或已取消的任务创建一条新的下载任务。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getDownloadsApi();
final String jobId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。

try {
    final response = api.retryDownload(jobId, idempotencyKey);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DownloadsApi->retryDownload: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jobId** | **String**|  |
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |

### Return type

[**DownloadResponse**](DownloadResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
