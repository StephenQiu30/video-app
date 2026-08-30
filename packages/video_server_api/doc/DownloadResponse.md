# video_server_api.model.DownloadResponse

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  |
**inspectionId** | **String** |  |
**formatId** | **String** |  |
**sourceKind** | [**DownloadSourceKind**](DownloadSourceKind.md) |  |
**sourceLabel** | **String** |  |
**status** | [**DownloadStatus**](DownloadStatus.md) |  |
**stage** | [**DownloadStage**](DownloadStage.md) |  |
**progress** | **int** |  |
**attempt** | **int** |  |
**version** | **int** |  |
**errorCode** | [**DownloadErrorCode**](DownloadErrorCode.md) |  |
**createdAt** | [**DateTime**](DateTime.md) |  |
**updatedAt** | [**DateTime**](DateTime.md) |  |
**finishedAt** | [**DateTime**](DateTime.md) |  |
**fileAvailable** | **bool** |  |
**title** | **String** |  |
**extractorKey** | **String** |  |
**durationSeconds** | **int** |  |
**thumbnailUrl** | **String** |  |
**format** | [**SemanticPlanResponse**](SemanticPlanResponse.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
