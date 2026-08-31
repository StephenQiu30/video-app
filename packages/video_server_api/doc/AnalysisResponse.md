# video_server_api.model.AnalysisResponse

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  |
**runId** | **String** |  |
**runNo** | **int** |  |
**runTrigger** | **String** |  |
**version** | **int** |  |
**skillId** | **String** |  |
**outputLanguage** | **String** |  |
**inputKind** | [**AnalysisInputKind**](AnalysisInputKind.md) |  |
**resultContract** | [**AnalysisResultContract**](AnalysisResultContract.md) |  |
**status** | [**AnalysisStatus**](AnalysisStatus.md) |  |
**stage** | [**AnalysisStage**](AnalysisStage.md) |  |
**progress** | **int** |  |
**attempt** | **int** |  |
**errorCode** | [**AnalysisErrorCode**](AnalysisErrorCode.md) |  |
**createdAt** | [**DateTime**](DateTime.md) |  |
**updatedAt** | [**DateTime**](DateTime.md) |  |
**finishedAt** | [**DateTime**](DateTime.md) |  |
**result** | [**AnalysisResponseResult**](AnalysisResponseResult.md) |  |
**reportMarkdown** | **String** |  |
**currentReportId** | **String** |  |
**report** | [**AnalysisReportResponse**](AnalysisReportResponse.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
