# video_server_api.model.DocumentResponse

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  |
**title** | **String** |  |
**originalFilename** | **String** |  |
**sourceFormat** | [**DocumentSourceFormat**](DocumentSourceFormat.md) |  |
**declaredSizeBytes** | **int** |  |
**status** | [**ImportStatus**](ImportStatus.md) |  |
**attempt** | **int** |  |
**errorCode** | [**ImportErrorCode**](ImportErrorCode.md) |  |
**version** | **int** |  |
**detectedLanguage** | **String** |  |
**sceneCount** | **int** |  |
**characterCount** | **int** |  |
**qualityWarnings** | **BuiltList&lt;String&gt;** |  |
**createdAt** | [**DateTime**](DateTime.md) |  |
**updatedAt** | [**DateTime**](DateTime.md) |  |
**finishedAt** | [**DateTime**](DateTime.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
