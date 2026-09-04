# video_server_api.api.AnalysesApi

## Load the API package
```dart
import 'package:video_server_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelAnalysis**](AnalysesApi.md#cancelanalysis) | **POST** /api/analyses/{analysis_id}/cancel | 取消视频分析任务
[**createAnalysis**](AnalysesApi.md#createanalysis) | **POST** /api/downloads/{download_id}/analyses | 创建视频分析任务
[**createDocumentAnalysis**](AnalysesApi.md#createdocumentanalysis) | **POST** /api/documents/{document_id}/analyses | 创建剧本分析或改写任务
[**deleteAnalysis**](AnalysesApi.md#deleteanalysis) | **DELETE** /api/analyses/{analysis_id} | 删除视频分析与报告
[**getAnalysis**](AnalysesApi.md#getanalysis) | **GET** /api/analyses/{analysis_id} | 查询视频分析任务
[**getLatestDocumentAnalysis**](AnalysesApi.md#getlatestdocumentanalysis) | **GET** /api/documents/{document_id}/analysis | 读取文档最近的剧本分析
[**getLatestDownloadAnalysis**](AnalysesApi.md#getlatestdownloadanalysis) | **GET** /api/downloads/{download_id}/analysis | 读取下载任务最近的视频分析
[**listAnalysisSkills**](AnalysesApi.md#listanalysisskills) | **GET** /api/analysis-skills | 列出输入兼容的分析 Skill
[**retryAnalysis**](AnalysesApi.md#retryanalysis) | **POST** /api/analyses/{analysis_id}/retry | 重试原视频分析任务


# **cancelAnalysis**
> AnalysisResponse cancelAnalysis(analysisId)

取消视频分析任务

请求取消尚未结束的视频分析任务。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final String analysisId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.cancelAnalysis(analysisId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->cancelAnalysis: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **analysisId** | **String**|  |

### Return type

[**AnalysisResponse**](AnalysisResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createAnalysis**
> AnalysisResponse createAnalysis(downloadId, idempotencyKey, analysisRequest)

创建视频分析任务

基于已完成的下载制品创建异步 AI 分析任务。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final String downloadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。
final AnalysisRequest analysisRequest = ; // AnalysisRequest |

try {
    final response = api.createAnalysis(downloadId, idempotencyKey, analysisRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->createAnalysis: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **downloadId** | **String**|  |
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |
 **analysisRequest** | [**AnalysisRequest**](AnalysisRequest.md)|  |

### Return type

[**AnalysisResponse**](AnalysisResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createDocumentAnalysis**
> AnalysisResponse createDocumentAnalysis(documentId, idempotencyKey, analysisRequest)

创建剧本分析或改写任务

基于已规范化的剧本文档创建异步分析或改写任务。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。
final AnalysisRequest analysisRequest = ; // AnalysisRequest |

try {
    final response = api.createDocumentAnalysis(documentId, idempotencyKey, analysisRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->createDocumentAnalysis: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  |
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |
 **analysisRequest** | [**AnalysisRequest**](AnalysisRequest.md)|  |

### Return type

[**AnalysisResponse**](AnalysisResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteAnalysis**
> deleteAnalysis(analysisId)

删除视频分析与报告

隐藏分析任务并异步清理其私有报告对象。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final String analysisId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    api.deleteAnalysis(analysisId);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->deleteAnalysis: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **analysisId** | **String**|  |

### Return type

void (empty response body)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAnalysis**
> AnalysisResponse getAnalysis(analysisId)

查询视频分析任务

查询分析进度及经过证据校验的结果。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final String analysisId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getAnalysis(analysisId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->getAnalysis: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **analysisId** | **String**|  |

### Return type

[**AnalysisResponse**](AnalysisResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLatestDocumentAnalysis**
> AnalysisResponse getLatestDocumentAnalysis(documentId)

读取文档最近的剧本分析

恢复当前用户在该剧本文档上最近创建的分析与报告。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final String documentId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getLatestDocumentAnalysis(documentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->getLatestDocumentAnalysis: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **documentId** | **String**|  |

### Return type

[**AnalysisResponse**](AnalysisResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLatestDownloadAnalysis**
> AnalysisResponse getLatestDownloadAnalysis(downloadId)

读取下载任务最近的视频分析

恢复当前用户在该下载任务上最近创建的分析与报告。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final String downloadId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |

try {
    final response = api.getLatestDownloadAnalysis(downloadId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->getLatestDownloadAnalysis: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **downloadId** | **String**|  |

### Return type

[**AnalysisResponse**](AnalysisResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAnalysisSkills**
> BuiltList<AnalysisSkillResponse> listAnalysisSkills(inputKind)

列出输入兼容的分析 Skill

按输入类型返回可选 Skill 及用户可编辑的默认提示词。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final AnalysisInputKind inputKind = ; // AnalysisInputKind |

try {
    final response = api.listAnalysisSkills(inputKind);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->listAnalysisSkills: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inputKind** | [**AnalysisInputKind**](.md)|  |

### Return type

[**BuiltList&lt;AnalysisSkillResponse&gt;**](AnalysisSkillResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **retryAnalysis**
> AnalysisResponse retryAnalysis(analysisId, idempotencyKey)

重试原视频分析任务

为同一分析任务创建下一执行代次，不改变任务资源 ID。  Retry 是上一运行的无参数重放；带请求体的请求按校验错误拒绝。

### Example
```dart
import 'package:video_server_api/api.dart';

final api = VideoServerApi().getAnalysesApi();
final String analysisId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String |
final String idempotencyKey = idempotencyKey_example; // String | 同一业务操作的安全重试必须复用相同键值。

try {
    final response = api.retryAnalysis(analysisId, idempotencyKey);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AnalysesApi->retryAnalysis: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **analysisId** | **String**|  |
 **idempotencyKey** | **String**| 同一业务操作的安全重试必须复用相同键值。 |

### Return type

[**AnalysisResponse**](AnalysisResponse.md)

### Authorization

[NativeBearerAuth](../README.md#NativeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
