// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
      ..add(AccessDecision.serializer)
      ..add(AiProviderAuthMode.serializer)
      ..add(AiProviderEngine.serializer)
      ..add(AiProviderProfileListResponse.serializer)
      ..add(AiProviderProfileResponse.serializer)
      ..add(AnalysisErrorCode.serializer)
      ..add(AnalysisInputKind.serializer)
      ..add(AnalysisMediaResponse.serializer)
      ..add(AnalysisReportArtifactResponse.serializer)
      ..add(AnalysisReportResponse.serializer)
      ..add(AnalysisRequest.serializer)
      ..add(AnalysisResponse.serializer)
      ..add(AnalysisResponseResult.serializer)
      ..add(AnalysisResultContract.serializer)
      ..add(AnalysisSkillResponse.serializer)
      ..add(AnalysisStage.serializer)
      ..add(AnalysisStatus.serializer)
      ..add(AudioCodecFamily.serializer)
      ..add(CompatibilityProfile.serializer)
      ..add(CompleteDocumentImportRequest.serializer)
      ..add(CompleteMediaImportRequest.serializer)
      ..add(CompletedPartRequest.serializer)
      ..add(ContainerPreference.serializer)
      ..add(DeclaredOrigin.serializer)
      ..add(DiscoveredItemInspectionSource.serializer)
      ..add(DiscoveredItemInspectionSourceKindEnum.serializer)
      ..add(DiscoveryDecisionHint.serializer)
      ..add(DiscoveryItemKind.serializer)
      ..add(DiscoveryItemStatus.serializer)
      ..add(DiscoveryStatus.serializer)
      ..add(DocumentDetailResponse.serializer)
      ..add(DocumentImportRequest.serializer)
      ..add(DocumentImportResponse.serializer)
      ..add(DocumentPageResponse.serializer)
      ..add(DocumentParseSummaryResponse.serializer)
      ..add(DocumentResponse.serializer)
      ..add(DocumentSourceFormat.serializer)
      ..add(DocumentUploadSessionResponse.serializer)
      ..add(DownloadAnalyticsDailyResponse.serializer)
      ..add(DownloadAnalyticsResponse.serializer)
      ..add(DownloadAnalyticsSourceResponse.serializer)
      ..add(DownloadAnalyticsSummaryResponse.serializer)
      ..add(DownloadErrorCode.serializer)
      ..add(DownloadHistoryItemResponse.serializer)
      ..add(DownloadHistoryResponse.serializer)
      ..add(DownloadHistorySummaryResponse.serializer)
      ..add(DownloadRequest.serializer)
      ..add(DownloadResponse.serializer)
      ..add(DownloadSourceKind.serializer)
      ..add(DownloadStage.serializer)
      ..add(DownloadStatus.serializer)
      ..add(DownloadUrlResponse.serializer)
      ..add(DynamicRange.serializer)
      ..add(EmailPasswordRequest.serializer)
      ..add(EntitlementState.serializer)
      ..add(EvidenceSummaryResponse.serializer)
      ..add(ExecutionMode.serializer)
      ..add(FormatResponse.serializer)
      ..add(FpsBucket.serializer)
      ..add(HighlightResponse.serializer)
      ..add(IdentityState.serializer)
      ..add(ImportErrorCode.serializer)
      ..add(ImportSourceFormat.serializer)
      ..add(ImportStatus.serializer)
      ..add(InspectionRequest.serializer)
      ..add(InspectionResponse.serializer)
      ..add(ManagedUserListResponse.serializer)
      ..add(ManagedUserResponse.serializer)
      ..add(MediaImportRequest.serializer)
      ..add(MediaImportResponse.serializer)
      ..add(MediaKind.serializer)
      ..add(MediaUploadSessionResponse.serializer)
      ..add(ModelSource.serializer)
      ..add(NativeLogoutRequest.serializer)
      ..add(NativeRefreshRequest.serializer)
      ..add(NativeSessionResponse.serializer)
      ..add(NativeSessionResponseTokenTypeEnum.serializer)
      ..add(ProblemDetails.serializer)
      ..add(ProductionAdviceResponse.serializer)
      ..add(ProtectionState.serializer)
      ..add(ProviderAccessMode.serializer)
      ..add(ProviderCapability.serializer)
      ..add(ProviderCatalogEntryResponse.serializer)
      ..add(ProviderCatalogListResponse.serializer)
      ..add(ProviderListResponse.serializer)
      ..add(ProviderStatusResponse.serializer)
      ..add(ProviderSupportStatus.serializer)
      ..add(PublicUrlInspectionSource.serializer)
      ..add(PublicUrlInspectionSourceKindEnum.serializer)
      ..add(RegisterRequest.serializer)
      ..add(RightsBasis.serializer)
      ..add(ScreenplayAnalysisResultResponse.serializer)
      ..add(ScreenplayAnalysisResultResponseKindEnum.serializer)
      ..add(ScreenplayCharacterResponse.serializer)
      ..add(ScreenplayEvidenceItemResponse.serializer)
      ..add(ScreenplayGlossaryTermResponse.serializer)
      ..add(ScreenplayRewriteResultResponse.serializer)
      ..add(ScreenplayRewriteResultResponseKindEnum.serializer)
      ..add(ScreenplaySceneResponse.serializer)
      ..add(ScreenplayStructureResponse.serializer)
      ..add(SemanticPlanResponse.serializer)
      ..add(ShotResponse.serializer)
      ..add(SourceDiscoveryItemResponse.serializer)
      ..add(SourceDiscoveryRequest.serializer)
      ..add(SourceDiscoveryRequestKindEnum.serializer)
      ..add(SourceDiscoveryResponse.serializer)
      ..add(SourceOrigin.serializer)
      ..add(StorageCleanupRequest.serializer)
      ..add(StorageCleanupResponse.serializer)
      ..add(StoredFileCategory.serializer)
      ..add(StoredFileListResponse.serializer)
      ..add(StoredFileResponse.serializer)
      ..add(UpdateProviderCatalogEntryRequest.serializer)
      ..add(UpdateUserAccessRequest.serializer)
      ..add(UploadPartResponse.serializer)
      ..add(UserResponse.serializer)
      ..add(UserRole.serializer)
      ..add(VideoAnalysisResultResponse.serializer)
      ..add(VideoAnalysisResultResponseKindEnum.serializer)
      ..add(VideoArticleEvidenceResponse.serializer)
      ..add(VideoArticleResultResponse.serializer)
      ..add(VideoArticleResultResponseKindEnum.serializer)
      ..add(VideoArticleSectionResponse.serializer)
      ..add(VideoCodecFamily.serializer)
      ..add(VideoSceneResponse.serializer)
      ..add(VisualAssetResponse.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AiProviderProfileResponse)]),
          () => ListBuilder<AiProviderProfileResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(AnalysisInputKind)]),
          () => ListBuilder<AnalysisInputKind>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(AnalysisReportArtifactResponse)]),
          () => ListBuilder<AnalysisReportArtifactResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CompletedPartRequest)]),
          () => ListBuilder<CompletedPartRequest>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(CompletedPartRequest)]),
          () => ListBuilder<CompletedPartRequest>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(DocumentResponse)]),
          () => ListBuilder<DocumentResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(DownloadAnalyticsDailyResponse)]),
          () => ListBuilder<DownloadAnalyticsDailyResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(DownloadAnalyticsSourceResponse)]),
          () => ListBuilder<DownloadAnalyticsSourceResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(DownloadHistoryItemResponse)]),
          () => ListBuilder<DownloadHistoryItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(FormatResponse)]),
          () => ListBuilder<FormatResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ManagedUserResponse)]),
          () => ListBuilder<ManagedUserResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ProviderCapability)]),
          () => ListBuilder<ProviderCapability>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ProviderAccessMode)]),
          () => ListBuilder<ProviderAccessMode>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProviderCatalogEntryResponse)]),
          () => ListBuilder<ProviderCatalogEntryResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProviderStatusResponse)]),
          () => ListBuilder<ProviderStatusResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplayCharacterResponse)]),
          () => ListBuilder<ScreenplayCharacterResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ScreenplaySceneResponse)]),
          () => ListBuilder<ScreenplaySceneResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(ScreenplayEvidenceItemResponse)]),
          () => ListBuilder<ScreenplayEvidenceItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(ScreenplayEvidenceItemResponse)]),
          () => ListBuilder<ScreenplayEvidenceItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(ScreenplayEvidenceItemResponse)]),
          () => ListBuilder<ScreenplayEvidenceItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(ScreenplayEvidenceItemResponse)]),
          () => ListBuilder<ScreenplayEvidenceItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(ScreenplayEvidenceItemResponse)]),
          () => ListBuilder<ScreenplayEvidenceItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(ScreenplayGlossaryTermResponse)]),
          () => ListBuilder<ScreenplayGlossaryTermResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(ShotResponse)]),
          () => ListBuilder<ShotResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(VideoSceneResponse)]),
          () => ListBuilder<VideoSceneResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(HighlightResponse)]),
          () => ListBuilder<HighlightResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VisualAssetResponse)]),
          () => ListBuilder<VisualAssetResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(SourceDiscoveryItemResponse)]),
          () => ListBuilder<SourceDiscoveryItemResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(StoredFileResponse)]),
          () => ListBuilder<StoredFileResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UploadPartResponse)]),
          () => ListBuilder<UploadPartResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UploadPartResponse)]),
          () => ListBuilder<UploadPartResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VideoArticleEvidenceResponse)]),
          () => ListBuilder<VideoArticleEvidenceResponse>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(VideoArticleSectionResponse)]),
          () => ListBuilder<VideoArticleSectionResponse>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
