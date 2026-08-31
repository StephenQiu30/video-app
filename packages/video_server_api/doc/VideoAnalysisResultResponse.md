# video_server_api.model.VideoAnalysisResultResponse

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
**summary** | [**EvidenceSummaryResponse**](EvidenceSummaryResponse.md) |  |
**media** | [**AnalysisMediaResponse**](AnalysisMediaResponse.md) |  |
**shotCount** | **int** |  |
**shots** | [**BuiltList&lt;ShotResponse&gt;**](ShotResponse.md) |  |
**scenes** | [**BuiltList&lt;VideoSceneResponse&gt;**](VideoSceneResponse.md) |  |
**highlights** | [**BuiltList&lt;HighlightResponse&gt;**](HighlightResponse.md) |  |
**assets** | [**BuiltList&lt;VisualAssetResponse&gt;**](VisualAssetResponse.md) |  |
**productionAdvice** | [**ProductionAdviceResponse**](ProductionAdviceResponse.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
