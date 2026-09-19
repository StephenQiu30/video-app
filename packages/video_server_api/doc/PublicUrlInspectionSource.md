# video_server_api.model.PublicUrlInspectionSource

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | **String** |  |
**url** | **String** | 用户有权处理的公开、非 DRM HTTP(S) 媒体地址。 |
**accessPolicyId** | [**ProviderAccessPolicy**](ProviderAccessPolicy.md) | 显式选择平台允许的访问策略；省略时使用平台固定默认策略，不按端点存在性切换。 | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
