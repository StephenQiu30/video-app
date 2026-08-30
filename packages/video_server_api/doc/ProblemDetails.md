# video_server_api.model.ProblemDetails

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | 稳定的服务错误类型 URI。 |
**title** | **String** | 面向调用方的简短错误标题。 |
**status** | **int** | HTTP 状态码。 |
**detail** | **String** | 不包含敏感信息的错误说明。 |
**code** | **String** | 供客户端分支处理的稳定错误码。 |
**instance** | **String** | 产生错误的请求路径。 |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
