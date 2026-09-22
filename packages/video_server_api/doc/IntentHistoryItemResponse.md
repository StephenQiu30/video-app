# video_server_api.model.IntentHistoryItemResponse

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  |
**version** | **int** |  |
**status** | [**IntentStatus**](IntentStatus.md) |  |
**reasonCode** | **String** |  |
**nextAction** | **String** |  | [optional] [default to 'none']
**retryAt** | [**DateTime**](DateTime.md) |  |
**deadline** | [**DateTime**](DateTime.md) |  |
**inspectionId** | **String** |  |
**jobId** | **String** |  |
**createdAt** | [**DateTime**](DateTime.md) |  |
**title** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
