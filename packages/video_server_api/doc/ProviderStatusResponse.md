# video_server_api.model.ProviderStatusResponse

## Load the model package
```dart
import 'package:video_server_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** |  |
**displayName** | **String** |  |
**registered** | **bool** |  |
**extractorExists** | **bool** |  |
**capabilities** | [**BuiltList&lt;ProviderCapability&gt;**](ProviderCapability.md) |  |
**accessModes** | [**BuiltList&lt;ProviderAccessMode&gt;**](ProviderAccessMode.md) |  |
**status** | [**ProviderSupportStatus**](ProviderSupportStatus.md) |  |
**lastCheckedAt** | [**DateTime**](DateTime.md) |  |
**lastCheckSucceeded** | **bool** |  |
**downloadSupported** | **bool** |  |
**downloadAvailable** | **bool** |  |
**lastMediaVerifiedAt** | [**DateTime**](DateTime.md) |  |
**lastVerifiedAt** | [**DateTime**](DateTime.md) |  |
**userAction** | **String** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
