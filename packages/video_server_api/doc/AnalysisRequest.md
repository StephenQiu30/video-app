# video_server_api.model.AnalysisRequest

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**skillId** | **String** | 分析 Skill 的稳定标识，由分析 Skill 清单接口提供。 |
**outputLanguage** | **String** | 分析结果使用的 BCP 47 语言标签。 |
**customPrompt** | **String** | 用户可编辑的分析要求，仅影响观察重点和表达，不能覆盖工具、安全边界或结果结构。 | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
