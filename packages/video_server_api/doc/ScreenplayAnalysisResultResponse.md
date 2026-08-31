# video_server_api.model.ScreenplayAnalysisResultResponse

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**kind** | **String** |  |
**language** | **String** |  |
**title** | **String** |  |
**logline** | **String** |  |
**synopsis** | **String** |  |
**structure** | [**ScreenplayStructureResponse**](ScreenplayStructureResponse.md) |  |
**characters** | [**BuiltList&lt;ScreenplayCharacterResponse&gt;**](ScreenplayCharacterResponse.md) |  |
**scenes** | [**BuiltList&lt;ScreenplaySceneResponse&gt;**](ScreenplaySceneResponse.md) |  |
**dialogueFindings** | [**BuiltList&lt;ScreenplayEvidenceItemResponse&gt;**](ScreenplayEvidenceItemResponse.md) |  |
**strengths** | [**BuiltList&lt;ScreenplayEvidenceItemResponse&gt;**](ScreenplayEvidenceItemResponse.md) |  |
**priorityRevisions** | [**BuiltList&lt;ScreenplayEvidenceItemResponse&gt;**](ScreenplayEvidenceItemResponse.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
