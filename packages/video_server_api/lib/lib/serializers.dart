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
import 'package:video_server_api/lib/model/analysis_error_code.dart';
import 'package:video_server_api/lib/model/analysis_input_kind.dart';
import 'package:video_server_api/lib/model/analysis_media_response.dart';
import 'package:video_server_api/lib/model/analysis_report_artifact_response.dart';
import 'package:video_server_api/lib/model/analysis_report_response.dart';
import 'package:video_server_api/lib/model/analysis_request.dart';
import 'package:video_server_api/lib/model/analysis_response.dart';
import 'package:video_server_api/lib/model/analysis_response_result.dart';
import 'package:video_server_api/lib/model/analysis_result_contract.dart';
import 'package:video_server_api/lib/model/analysis_skill_response.dart';
import 'package:video_server_api/lib/model/analysis_stage.dart';
import 'package:video_server_api/lib/model/analysis_status.dart';
import 'package:video_server_api/lib/model/audio_codec_family.dart';
import 'package:video_server_api/lib/model/compatibility_profile.dart';
import 'package:video_server_api/lib/model/complete_document_import_request.dart';
import 'package:video_server_api/lib/model/complete_media_import_request.dart';
import 'package:video_server_api/lib/model/completed_part_request.dart';
import 'package:video_server_api/lib/model/container_preference.dart';
import 'package:video_server_api/lib/model/declared_origin.dart';
import 'package:video_server_api/lib/model/discovered_item_inspection_source.dart';
import 'package:video_server_api/lib/model/discovery_decision_hint.dart';
import 'package:video_server_api/lib/model/discovery_item_kind.dart';
import 'package:video_server_api/lib/model/discovery_item_status.dart';
import 'package:video_server_api/lib/model/discovery_status.dart';
import 'package:video_server_api/lib/model/document_detail_response.dart';
import 'package:video_server_api/lib/model/document_import_request.dart';
import 'package:video_server_api/lib/model/document_import_response.dart';
import 'package:video_server_api/lib/model/document_page_response.dart';
import 'package:video_server_api/lib/model/document_parse_summary_response.dart';
import 'package:video_server_api/lib/model/document_response.dart';
import 'package:video_server_api/lib/model/document_source_format.dart';
import 'package:video_server_api/lib/model/document_upload_session_response.dart';
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
import 'package:video_server_api/lib/model/evidence_summary_response.dart';
import 'package:video_server_api/lib/model/execution_mode.dart';
import 'package:video_server_api/lib/model/format_response.dart';
import 'package:video_server_api/lib/model/fps_bucket.dart';
import 'package:video_server_api/lib/model/highlight_response.dart';
import 'package:video_server_api/lib/model/identity_state.dart';
import 'package:video_server_api/lib/model/import_error_code.dart';
import 'package:video_server_api/lib/model/import_source_format.dart';
import 'package:video_server_api/lib/model/import_status.dart';
import 'package:video_server_api/lib/model/inspection_request.dart';
import 'package:video_server_api/lib/model/inspection_response.dart';
import 'package:video_server_api/lib/model/managed_user_list_response.dart';
import 'package:video_server_api/lib/model/managed_user_response.dart';
import 'package:video_server_api/lib/model/media_import_request.dart';
import 'package:video_server_api/lib/model/media_import_response.dart';
import 'package:video_server_api/lib/model/media_kind.dart';
import 'package:video_server_api/lib/model/media_upload_session_response.dart';
import 'package:video_server_api/lib/model/model_source.dart';
import 'package:video_server_api/lib/model/native_logout_request.dart';
import 'package:video_server_api/lib/model/native_refresh_request.dart';
import 'package:video_server_api/lib/model/native_session_response.dart';
import 'package:video_server_api/lib/model/problem_details.dart';
import 'package:video_server_api/lib/model/production_advice_response.dart';
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
import 'package:video_server_api/lib/model/screenplay_analysis_result_response.dart';
import 'package:video_server_api/lib/model/screenplay_character_response.dart';
import 'package:video_server_api/lib/model/screenplay_evidence_item_response.dart';
import 'package:video_server_api/lib/model/screenplay_glossary_term_response.dart';
import 'package:video_server_api/lib/model/screenplay_rewrite_result_response.dart';
import 'package:video_server_api/lib/model/screenplay_scene_response.dart';
import 'package:video_server_api/lib/model/screenplay_structure_response.dart';
import 'package:video_server_api/lib/model/semantic_plan_response.dart';
import 'package:video_server_api/lib/model/shot_response.dart';
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
import 'package:video_server_api/lib/model/upload_part_response.dart';
import 'package:video_server_api/lib/model/user_response.dart';
import 'package:video_server_api/lib/model/user_role.dart';
import 'package:video_server_api/lib/model/video_analysis_result_response.dart';
import 'package:video_server_api/lib/model/video_article_evidence_response.dart';
import 'package:video_server_api/lib/model/video_article_result_response.dart';
import 'package:video_server_api/lib/model/video_article_section_response.dart';
import 'package:video_server_api/lib/model/video_codec_family.dart';
import 'package:video_server_api/lib/model/video_scene_response.dart';
import 'package:video_server_api/lib/model/visual_asset_response.dart';

part 'serializers.g.dart';

@SerializersFor([
  AccessDecision,
  AiProviderAuthMode,
  AiProviderEngine,
  AiProviderProfileListResponse,
  AiProviderProfileResponse,
  AnalysisErrorCode,
  AnalysisInputKind,
  AnalysisMediaResponse,
  AnalysisReportArtifactResponse,
  AnalysisReportResponse,
  AnalysisRequest,
  AnalysisResponse,
  AnalysisResponseResult,
  AnalysisResultContract,
  AnalysisSkillResponse,
  AnalysisStage,
  AnalysisStatus,
  AudioCodecFamily,
  CompatibilityProfile,
  CompleteDocumentImportRequest,
  CompleteMediaImportRequest,
  CompletedPartRequest,
  ContainerPreference,
  DeclaredOrigin,
  DiscoveredItemInspectionSource,
  DiscoveryDecisionHint,
  DiscoveryItemKind,
  DiscoveryItemStatus,
  DiscoveryStatus,
  DocumentDetailResponse,
  DocumentImportRequest,
  DocumentImportResponse,
  DocumentPageResponse,
  DocumentParseSummaryResponse,
  DocumentResponse,
  DocumentSourceFormat,
  DocumentUploadSessionResponse,
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
  EvidenceSummaryResponse,
  ExecutionMode,
  FormatResponse,
  FpsBucket,
  HighlightResponse,
  IdentityState,
  ImportErrorCode,
  ImportSourceFormat,
  ImportStatus,
  InspectionRequest,
  InspectionResponse,
  ManagedUserListResponse,
  ManagedUserResponse,
  MediaImportRequest,
  MediaImportResponse,
  MediaKind,
  MediaUploadSessionResponse,
  ModelSource,
  NativeLogoutRequest,
  NativeRefreshRequest,
  NativeSessionResponse,
  ProblemDetails,
  ProductionAdviceResponse,
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
  ScreenplayAnalysisResultResponse,
  ScreenplayCharacterResponse,
  ScreenplayEvidenceItemResponse,
  ScreenplayGlossaryTermResponse,
  ScreenplayRewriteResultResponse,
  ScreenplaySceneResponse,
  ScreenplayStructureResponse,
  SemanticPlanResponse,
  ShotResponse,
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
  UploadPartResponse,
  UserResponse,
  UserRole,
  VideoAnalysisResultResponse,
  VideoArticleEvidenceResponse,
  VideoArticleResultResponse,
  VideoArticleSectionResponse,
  VideoCodecFamily,
  VideoSceneResponse,
  VisualAssetResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(AnalysisSkillResponse)]),
        () => ListBuilder<AnalysisSkillResponse>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
