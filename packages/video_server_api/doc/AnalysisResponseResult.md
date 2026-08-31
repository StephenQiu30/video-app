# video_server_api.model.AnalysisResponseResult

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
**scenes** | [**BuiltList&lt;ScreenplaySceneResponse&gt;**](ScreenplaySceneResponse.md) |  |
**highlights** | [**BuiltList&lt;HighlightResponse&gt;**](HighlightResponse.md) |  |
**assets** | [**BuiltList&lt;VisualAssetResponse&gt;**](VisualAssetResponse.md) |  |
**productionAdvice** | [**ProductionAdviceResponse**](ProductionAdviceResponse.md) |  |
**lead** | **String** |  |
**sections** | [**BuiltList&lt;VideoArticleSectionResponse&gt;**](VideoArticleSectionResponse.md) |  |
**keyPoints** | **BuiltList&lt;String&gt;** |  |
**closing** | **String** |  |
**limitations** | **BuiltList&lt;String&gt;** |  |
**logline** | **String** |  |
**synopsis** | **String** |  |
**structure** | [**ScreenplayStructureResponse**](ScreenplayStructureResponse.md) |  |
**characters** | [**BuiltList&lt;ScreenplayCharacterResponse&gt;**](ScreenplayCharacterResponse.md) |  |
**dialogueFindings** | [**BuiltList&lt;ScreenplayEvidenceItemResponse&gt;**](ScreenplayEvidenceItemResponse.md) |  |
**strengths** | [**BuiltList&lt;ScreenplayEvidenceItemResponse&gt;**](ScreenplayEvidenceItemResponse.md) |  |
**priorityRevisions** | [**BuiltList&lt;ScreenplayEvidenceItemResponse&gt;**](ScreenplayEvidenceItemResponse.md) |  |
**sourceLanguage** | **String** |  |
**targetLanguage** | **String** |  |
**sourceSceneCount** | **int** |  |
**outputSceneCount** | **int** |  |
**glossary** | [**BuiltList&lt;ScreenplayGlossaryTermResponse&gt;**](ScreenplayGlossaryTermResponse.md) |  |
**changeSummary** | **BuiltList&lt;String&gt;** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
