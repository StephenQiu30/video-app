//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:video_server_api/lib/date_serializer.dart';
import 'package:video_server_api/lib/model/date.dart';

import 'package:video_server_api/lib/model/access_decision.dart';
import 'package:video_server_api/lib/model/ai_provider_auth_mode.dart';
import 'package:video_server_api/lib/model/ai_provider_engine.dart';
import 'package:video_server_api/lib/model/ai_provider_profile_list_response.dart';
import 'package:video_server_api/lib/model/ai_provider_profile_response.dart';
import 'package:video_server_api/lib/model/audio_codec_family.dart';
import 'package:video_server_api/lib/model/compatibility_profile.dart';
import 'package:video_server_api/lib/model/container_preference.dart';
import 'package:video_server_api/lib/model/discovered_item_inspection_source.dart';
import 'package:video_server_api/lib/model/discovery_decision_hint.dart';
import 'package:video_server_api/lib/model/discovery_item_kind.dart';
import 'package:video_server_api/lib/model/discovery_item_status.dart';
import 'package:video_server_api/lib/model/discovery_status.dart';
import 'package:video_server_api/lib/model/document_page_response.dart';
import 'package:video_server_api/lib/model/document_response.dart';
import 'package:video_server_api/lib/model/document_source_format.dart';
import 'package:video_server_api/lib/model/download_analytics_daily_response.dart';
import 'package:video_server_api/lib/model/download_analytics_response.dart';
import 'package:video_server_api/lib/model/download_analytics_source_response.dart';
import 'package:video_server_api/lib/model/download_analytics_summary_response.dart';
import 'package:video_server_api/lib/model/download_error_code.dart';
import 'package:video_server_api/lib/model/download_history_item_response.dart';
import 'package:video_server_api/lib/model/download_history_response.dart';
import 'package:video_server_api/lib/model/download_history_summary_response.dart';
import 'package:video_server_api/lib/model/download_request.dart';
import 'package:video_server_api/lib/model/download_response.dart';
import 'package:video_server_api/lib/model/download_source_kind.dart';
import 'package:video_server_api/lib/model/download_stage.dart';
import 'package:video_server_api/lib/model/download_status.dart';
import 'package:video_server_api/lib/model/download_url_response.dart';
import 'package:video_server_api/lib/model/dynamic_range.dart';
import 'package:video_server_api/lib/model/email_password_request.dart';
import 'package:video_server_api/lib/model/entitlement_state.dart';
import 'package:video_server_api/lib/model/execution_mode.dart';
import 'package:video_server_api/lib/model/format_response.dart';
import 'package:video_server_api/lib/model/fps_bucket.dart';
import 'package:video_server_api/lib/model/identity_state.dart';
import 'package:video_server_api/lib/model/import_error_code.dart';
import 'package:video_server_api/lib/model/import_status.dart';
import 'package:video_server_api/lib/model/inspection_request.dart';
import 'package:video_server_api/lib/model/inspection_response.dart';
import 'package:video_server_api/lib/model/managed_user_list_response.dart';
import 'package:video_server_api/lib/model/managed_user_response.dart';
import 'package:video_server_api/lib/model/model_source.dart';
import 'package:video_server_api/lib/model/native_logout_request.dart';
import 'package:video_server_api/lib/model/native_refresh_request.dart';
import 'package:video_server_api/lib/model/native_session_response.dart';
import 'package:video_server_api/lib/model/problem_details.dart';
import 'package:video_server_api/lib/model/protection_state.dart';
import 'package:video_server_api/lib/model/provider_access_mode.dart';
import 'package:video_server_api/lib/model/provider_capability.dart';
import 'package:video_server_api/lib/model/provider_catalog_entry_response.dart';
import 'package:video_server_api/lib/model/provider_catalog_list_response.dart';
import 'package:video_server_api/lib/model/provider_list_response.dart';
import 'package:video_server_api/lib/model/provider_status_response.dart';
import 'package:video_server_api/lib/model/provider_support_status.dart';
import 'package:video_server_api/lib/model/public_url_inspection_source.dart';
import 'package:video_server_api/lib/model/register_request.dart';
import 'package:video_server_api/lib/model/rights_basis.dart';
import 'package:video_server_api/lib/model/semantic_plan_response.dart';
import 'package:video_server_api/lib/model/source_discovery_item_response.dart';
import 'package:video_server_api/lib/model/source_discovery_request.dart';
import 'package:video_server_api/lib/model/source_discovery_response.dart';
import 'package:video_server_api/lib/model/source_origin.dart';
import 'package:video_server_api/lib/model/storage_cleanup_request.dart';
import 'package:video_server_api/lib/model/storage_cleanup_response.dart';
import 'package:video_server_api/lib/model/stored_file_category.dart';
import 'package:video_server_api/lib/model/stored_file_list_response.dart';
import 'package:video_server_api/lib/model/stored_file_response.dart';
import 'package:video_server_api/lib/model/update_provider_catalog_entry_request.dart';
import 'package:video_server_api/lib/model/update_user_access_request.dart';
import 'package:video_server_api/lib/model/user_response.dart';
import 'package:video_server_api/lib/model/user_role.dart';
import 'package:video_server_api/lib/model/video_codec_family.dart';

part 'serializers.g.dart';

@SerializersFor([
  AccessDecision,
  AiProviderAuthMode,
  AiProviderEngine,
  AiProviderProfileListResponse,
  AiProviderProfileResponse,
  AudioCodecFamily,
  CompatibilityProfile,
  ContainerPreference,
  DiscoveredItemInspectionSource,
  DiscoveryDecisionHint,
  DiscoveryItemKind,
  DiscoveryItemStatus,
  DiscoveryStatus,
  DocumentPageResponse,
  DocumentResponse,
  DocumentSourceFormat,
  DownloadAnalyticsDailyResponse,
  DownloadAnalyticsResponse,
  DownloadAnalyticsSourceResponse,
  DownloadAnalyticsSummaryResponse,
  DownloadErrorCode,
  DownloadHistoryItemResponse,
  DownloadHistoryResponse,
  DownloadHistorySummaryResponse,
  DownloadRequest,
  DownloadResponse,
  DownloadSourceKind,
  DownloadStage,
  DownloadStatus,
  DownloadUrlResponse,
  DynamicRange,
  EmailPasswordRequest,
  EntitlementState,
  ExecutionMode,
  FormatResponse,
  FpsBucket,
  IdentityState,
  ImportErrorCode,
  ImportStatus,
  InspectionRequest,
  InspectionResponse,
  ManagedUserListResponse,
  ManagedUserResponse,
  ModelSource,
  NativeLogoutRequest,
  NativeRefreshRequest,
  NativeSessionResponse,
  ProblemDetails,
  ProtectionState,
  ProviderAccessMode,
  ProviderCapability,
  ProviderCatalogEntryResponse,
  ProviderCatalogListResponse,
  ProviderListResponse,
  ProviderStatusResponse,
  ProviderSupportStatus,
  PublicUrlInspectionSource,
  RegisterRequest,
  RightsBasis,
  SemanticPlanResponse,
  SourceDiscoveryItemResponse,
  SourceDiscoveryRequest,
  SourceDiscoveryResponse,
  SourceOrigin,
  StorageCleanupRequest,
  StorageCleanupResponse,
  StoredFileCategory,
  StoredFileListResponse,
  StoredFileResponse,
  UpdateProviderCatalogEntryRequest,
  UpdateUserAccessRequest,
  UserResponse,
  UserRole,
  VideoCodecFamily,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
