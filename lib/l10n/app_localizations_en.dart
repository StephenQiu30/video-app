// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Framegrab';

  @override
  String get openNavigation => 'Open navigation menu';

  @override
  String get navigationDescription =>
      'Open content intake, download history, screenplay documents, provider status, and account settings.';

  @override
  String get homeNavigation => 'Home';

  @override
  String get downloadHistoryNavigation => 'Download history';

  @override
  String get historyTab => 'History';

  @override
  String get screenplayDocumentsNavigation => 'Screenplays';

  @override
  String get documentsTab => 'Documents';

  @override
  String get providerStatusNavigation => 'Provider status';

  @override
  String get statusTab => 'Status';

  @override
  String get accountNavigation => 'Me';

  @override
  String get downloadHistoryDescription =>
      'View downloads for the current account, including progress, failures, and file availability.';

  @override
  String get screenplayDocumentsDescription =>
      'Review screenplay import state, extracted size, normalized previews, and analysis or rewrite results.';

  @override
  String get providerStatusDescription =>
      'View provider integration, access modes, latest checks, real download evidence, and complete analysis evidence without exposing accounts, cookies, egress, or probes.';

  @override
  String get loadingData => 'Loading live data…';

  @override
  String get loadFailedTitle => 'Data is temporarily unavailable';

  @override
  String get loadFailedDescription =>
      'Check your connection and retry. Placeholder content will not replace live data.';

  @override
  String get retryAction => 'Reload';

  @override
  String get refreshAction => 'Refresh data';

  @override
  String get totalLabel => 'Total';

  @override
  String get availableLabel => 'Available';

  @override
  String get succeededLabel => 'Completed';

  @override
  String get activeLabel => 'Active';

  @override
  String get failedLabel => 'Failed';

  @override
  String get yesLabel => 'Yes';

  @override
  String get noLabel => 'No';

  @override
  String get downloadHistoryEmptyTitle => 'No downloads yet';

  @override
  String get downloadHistoryEmptyDescription =>
      'Tasks you create or import will appear here. This result comes from your live account.';

  @override
  String get downloadStatusQueued => 'Queued';

  @override
  String get downloadStatusRunning => 'Downloading';

  @override
  String get downloadStatusRetryWait => 'Waiting to retry';

  @override
  String get downloadStatusSucceeded => 'Completed';

  @override
  String get downloadStatusFailed => 'Failed';

  @override
  String get downloadStatusCancelled => 'Cancelled';

  @override
  String get downloadStatusUnknown => 'Unknown status';

  @override
  String get progressLabel => 'Progress';

  @override
  String get updatedAtLabel => 'Updated';

  @override
  String get showingFirstPage => 'Showing the 20 most recent items';

  @override
  String get failureCancelled => 'The task was cancelled';

  @override
  String get failureTimeout => 'Processing timed out';

  @override
  String get failureProviderAccess =>
      'The provider requires access or restricts this content';

  @override
  String get failureProviderTemporary =>
      'The provider is temporarily unavailable';

  @override
  String get failureStorage => 'Storage is temporarily unavailable';

  @override
  String get failureGeneric => 'Processing did not complete';

  @override
  String get documentEmptyTitle => 'No screenplay documents yet';

  @override
  String get documentEmptyDescription =>
      'Screenplays you import will appear here. This result comes from your live account.';

  @override
  String get documentStatusUploading => 'Uploading';

  @override
  String get documentStatusVerifying => 'Verifying';

  @override
  String get documentStatusReady => 'Ready';

  @override
  String get documentStatusFailed => 'Failed';

  @override
  String get documentStatusCancelled => 'Cancelled';

  @override
  String get documentStatusExpired => 'Expired';

  @override
  String get documentStatusUnknown => 'Unknown status';

  @override
  String get fileSizeLabel => 'File size';

  @override
  String get sceneCountLabel => 'Scenes';

  @override
  String get characterCountLabel => 'Characters';

  @override
  String get languageLabel => 'Language';

  @override
  String get providerEmptyTitle => 'No provider status';

  @override
  String get providerEmptyDescription =>
      'The service currently exposes no provider capability records. Refresh later.';

  @override
  String get downloadAvailableLabel => 'Download available';

  @override
  String get capabilitiesLabel => 'Capabilities';

  @override
  String get accessModesLabel => 'Access';

  @override
  String get lastVerifiedLabel => 'Last verified';

  @override
  String get userActionLabel => 'Suggested action';

  @override
  String get providerStatusUnknown => 'Pending verification';

  @override
  String get providerStatusVerified => 'Verified';

  @override
  String get providerStatusDegraded => 'Degraded';

  @override
  String get providerStatusAccessRequired => 'Access required';

  @override
  String get providerStatusRateLimited => 'Rate limited';

  @override
  String get providerStatusBlocked => 'Blocked';

  @override
  String get providerStatusDisabled => 'Disabled';

  @override
  String get providerStatusUnsupported => 'Unsupported';

  @override
  String get capabilitySingleVideo => 'Single video';

  @override
  String get capabilityShortVideo => 'Short video';

  @override
  String get capabilityClipOrVod => 'Clip or VOD';

  @override
  String get capabilityAudioVideoSplit => 'Separate audio/video';

  @override
  String get capabilitySubtitles => 'Subtitles';

  @override
  String get capabilityImageOrCarousel => 'Images or carousel';

  @override
  String get capabilityLive => 'Live';

  @override
  String get capabilityPlaylist => 'Playlist';

  @override
  String get accessModeAnonymous => 'Anonymous';

  @override
  String get accessModeOperatorManaged => 'Service-managed';

  @override
  String get notYetVerified => 'Not yet verified';

  @override
  String get accountDescription => 'Manage your profile and signed-in session.';

  @override
  String get appearanceSection => 'Appearance';

  @override
  String get accountSection => 'Account';

  @override
  String get darkThemeLabel => 'Dark appearance';

  @override
  String get themeToggleDescription => 'Switch between dark and light themes';

  @override
  String get switchToDarkTheme => 'Switch to dark theme';

  @override
  String get switchToLightTheme => 'Switch to light theme';

  @override
  String get downloadDetailNavigation => 'Task details';

  @override
  String get downloadDetailDescription =>
      'Review the task state, file availability, and processing details.';

  @override
  String get sourceLabel => 'Source';

  @override
  String get formatLabel => 'Format';

  @override
  String get stageLabel => 'Stage';

  @override
  String get attemptLabel => 'Attempt';

  @override
  String get fileAvailabilityLabel => 'File';

  @override
  String get createdAtLabel => 'Created';

  @override
  String get finishedAtLabel => 'Finished';

  @override
  String get durationLabel => 'Duration';

  @override
  String get fileAvailable => 'File available';

  @override
  String get fileCleared => 'File removed';

  @override
  String get downloadStageRevalidating => 'Revalidating';

  @override
  String get downloadStageDownloading => 'Downloading';

  @override
  String get downloadStageRemuxing => 'Remuxing';

  @override
  String get downloadStageVerifying => 'Verifying';

  @override
  String get downloadStageUploading => 'Saving';

  @override
  String get downloadStageUnknown => 'Unknown stage';

  @override
  String get formatUnavailable => 'Format information unavailable';

  @override
  String get loginAction => 'Sign in';

  @override
  String get registerAction => 'Register';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get loginDescription =>
      'Use your Framegrab account to continue managing downloads, documents, and analysis.';

  @override
  String get createAccountTitle => 'Create your Framegrab account';

  @override
  String get registerDescription =>
      'Register to restore sessions across devices and securely access your tasks.';

  @override
  String get emailLabel => 'Email';

  @override
  String get usernameLabel => 'Username';

  @override
  String get passwordLabel => 'Password';

  @override
  String get confirmPasswordLabel => 'Confirm password';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get loginSubmit => 'Sign in';

  @override
  String get loginSubmitting => 'Signing in…';

  @override
  String get registerSubmit => 'Create account';

  @override
  String get registerSubmitting => 'Creating…';

  @override
  String get goRegister => 'Create account';

  @override
  String get goLogin => 'Back to sign in';

  @override
  String get noAccountPrompt => 'New to Framegrab?';

  @override
  String get hasAccountPrompt => 'Already have an account?';

  @override
  String get invalidEmail => 'Enter a valid email address.';

  @override
  String get invalidUsername => 'Username must contain 2–32 characters.';

  @override
  String get invalidPassword => 'Password must contain at least 8 characters.';

  @override
  String get passwordMismatch => 'The passwords do not match.';

  @override
  String get invalidCredentialsError => 'The email or password is incorrect.';

  @override
  String get emailRegisteredError =>
      'That email is already registered. Sign in instead.';

  @override
  String get usernameRegisteredError => 'That username is already in use.';

  @override
  String get unauthenticatedError => 'Your session expired. Sign in again.';

  @override
  String get rateLimitedError => 'Too many attempts. Try again later.';

  @override
  String get serviceUnavailableError =>
      'The service is unavailable. Check your connection and retry.';

  @override
  String get unknownAuthError =>
      'The operation did not complete. Try again later.';

  @override
  String get sessionRestoring => 'Restoring your session…';

  @override
  String get signedOutTitle => 'Sign in to continue';

  @override
  String get signedOutDescription =>
      'Sign in or register to view your profile and access tasks tied to your account.';

  @override
  String get signedInAs => 'Current account';

  @override
  String get logoutAction => 'Sign out';

  @override
  String get loggingOut => 'Signing out…';

  @override
  String get downloadHomeTitle => 'Bring content\nback to your device.';

  @override
  String get downloadHomeDescription =>
      'Inspect a public video link, or import a local video or screenplay you are authorized to process.';

  @override
  String get linkIntakeMode => 'Link';

  @override
  String get videoIntakeMode => 'Local video';

  @override
  String get screenplayIntakeMode => 'Screenplay';

  @override
  String get linkIntakeSupport =>
      'Supports public videos, single WeChat Channels posts, and WeChat Official Account articles. Multiple discovered videos require an explicit choice.';

  @override
  String get videoIntakeTitle => 'Import a local video';

  @override
  String get videoIntakeDescription =>
      'Choose a clear video file you own or are authorized to process. The service validates it in isolation before adding it to history and AI analysis.';

  @override
  String get selectVideoFile => 'Choose video file';

  @override
  String get screenplayIntakeTitle => 'Import a screenplay';

  @override
  String get screenplayIntakeDescription =>
      'Choose a TXT, DOCX, or PDF screenplay for normalized preview, analysis, and rewriting on the service.';

  @override
  String get selectScreenplayFile => 'Choose screenplay file';

  @override
  String get mediaUrlHint => 'Paste a public video or article link';

  @override
  String get mediaUrlLabel => 'Public content address';

  @override
  String get clearMediaUrl => 'Clear link';

  @override
  String get inspectMedia => 'Inspect media';

  @override
  String get inspectingMedia => 'Inspecting…';

  @override
  String get mediaUrlError => 'Enter a valid public HTTP(S) video address.';

  @override
  String get nativeUploadContractPending =>
      'The page structure and native sign-in are ready. Upload and file authorization contracts are not frozen, so real files cannot be submitted yet.';

  @override
  String get operationFailed =>
      'The operation did not complete. Try again later.';

  @override
  String get inspectionResultTitle => 'Inspection result';

  @override
  String get formatSelectionTitle => 'Choose a download format';

  @override
  String get formatSelectionDescription =>
      'These formats come from this live inspection. Track the created task in download history.';

  @override
  String get createDownloadAction => 'Create download task';

  @override
  String get creatingDownload => 'Creating…';

  @override
  String get sourceCandidatesTitle => 'Choose a video from the article';

  @override
  String get sourceCandidatesDescription =>
      'This article contains multiple media sources. Select the video you want to process.';

  @override
  String get sourceCandidatesEmpty =>
      'No processable video was found in this article.';

  @override
  String get candidateUnavailable => 'This source cannot be processed';

  @override
  String get mediaUnavailableTitle => 'This media cannot be downloaded';

  @override
  String get mediaUnavailableDescription =>
      'The server did not approve a download task. Follow the guidance or submit another public link.';

  @override
  String get noFormatsAvailable =>
      'Inspection succeeded, but no format is available for creating a download task.';

  @override
  String get inspectionFailedError =>
      'The media provider did not return a valid inspection. Confirm this is a supported public single-video link.';

  @override
  String get inspectionTimeoutError =>
      'Media inspection timed out. Submit it again later.';

  @override
  String get providerTemporaryError =>
      'The media provider cannot complete verification right now. Try again later.';

  @override
  String get providerSessionError =>
      'This provider currently requires a server-authorized session, so this media cannot be inspected.';

  @override
  String get providerRegionError =>
      'This media is unavailable from the current service region.';

  @override
  String get providerRestrictedError =>
      'This media is private or access-restricted and cannot be processed.';

  @override
  String get providerDrmError =>
      'This media is DRM protected and is outside the supported service boundary.';

  @override
  String get providerLinkError =>
      'The sharing link has expired or no longer resolves to a video. Copy a fresh public link.';

  @override
  String get providerUnsupportedError =>
      'The submitted link does not contain one supported public video.';

  @override
  String get durationLimitError =>
      'This media exceeds the service duration limit.';

  @override
  String get articleRestrictedError =>
      'The article requires verification, following, or payment, so its media sources cannot be read safely.';

  @override
  String get articleDiscoveryError =>
      'Media sources could not be read from this article. Confirm that the article is public and the link is valid.';

  @override
  String get legalMediaStatus =>
      'Submit only public links you are authorized to process';

  @override
  String get privacyStatus =>
      'Do not submit links containing accounts or access credentials';

  @override
  String get mediaCoverPending => 'Generating cover';

  @override
  String get mediaCoverUnavailable => 'Cover unavailable';

  @override
  String get mediaCoverLabel => 'Video cover';

  @override
  String get watchVideoAction => 'Watch';

  @override
  String get getFileAction => 'Get file';

  @override
  String get playbackFailed =>
      'The video could not be played. Request a new playback URL and retry.';

  @override
  String get playbackUnsupported =>
      'This format cannot be previewed on this device. You can still get the original file.';

  @override
  String get downloadOpenFailed =>
      'The system download could not be opened. Try again later.';

  @override
  String get aiAnalysisTitle => 'AI analysis';

  @override
  String get aiAnalysisDescription =>
      'Let AI review the video to create a continuous shot breakdown, visual highlights, an asset catalog, or an article draft.';

  @override
  String get analysisSkillLabel => 'Analysis skill';

  @override
  String get analysisOutputLanguageLabel => 'Output language';

  @override
  String get simplifiedChineseLabel => '简体中文';

  @override
  String get englishLabel => 'English';

  @override
  String get analysisPromptLabel => 'Analysis focus';

  @override
  String get analysisPromptDescription =>
      'Edit or clear the focus. Tool permissions, safety boundaries, and result structure cannot be changed.';

  @override
  String get restoreDefaultPrompt => 'Restore default';

  @override
  String get startAnalysisAction => 'Start AI analysis';

  @override
  String get startingAnalysis => 'Creating analysis…';

  @override
  String get analysisSkillsEmpty =>
      'No video analysis skills are available. Check the AI service configuration and retry.';

  @override
  String get analysisLoadFailed => 'AI analysis is temporarily unavailable.';

  @override
  String get analysisStatusQueued => 'Waiting for analysis';

  @override
  String get analysisStatusRunning => 'Analyzing';

  @override
  String get analysisStatusRetryWait => 'Waiting to retry';

  @override
  String get analysisStatusSucceeded => 'Analysis complete';

  @override
  String get analysisStatusFailed => 'Analysis failed';

  @override
  String get analysisStatusCancelled => 'Analysis cancelled';

  @override
  String get analysisStagePreparing => 'Preparing input';

  @override
  String get analysisStageAnalyzing => 'Running AI analysis';

  @override
  String get analysisStageValidating => 'Validating structured results';

  @override
  String get analysisStagePublishing => 'Publishing the report';

  @override
  String get analysisStagePending => 'Waiting to start';

  @override
  String analysisRunSummary(int run, int attempt) {
    return 'Run $run · technical attempt $attempt';
  }

  @override
  String analysisProgressSemantics(int progress) {
    return 'Analysis progress $progress%';
  }

  @override
  String get refreshAnalysisAction => 'Refresh analysis';

  @override
  String get cancelAnalysisAction => 'Cancel analysis';

  @override
  String get cancelAnalysisTitle => 'Cancel this analysis?';

  @override
  String get cancelAnalysisDescription =>
      'This stops the current run. You can start the analysis again later.';

  @override
  String get continueAnalysisAction => 'Keep analyzing';

  @override
  String get confirmCancelAnalysis => 'Cancel analysis';

  @override
  String get retryAnalysisAction => 'Retry analysis';

  @override
  String get retryingAnalysis => 'Retrying…';

  @override
  String get deleteAnalysisAction => 'Delete analysis';

  @override
  String get deletingAnalysis => 'Deleting…';

  @override
  String get deleteAnalysisTitle => 'Delete this analysis?';

  @override
  String get deleteAnalysisDescription =>
      'The result and report will be removed and cannot be recovered. The downloaded video is not affected.';

  @override
  String get confirmDeleteAnalysis => 'Delete';

  @override
  String get analysisOperationFailed =>
      'The AI analysis action did not complete. Try again later.';

  @override
  String get analysisExecutionFailed =>
      'AI analysis failed to run. Try again later.';

  @override
  String get analysisServiceUnavailable =>
      'AI analysis is temporarily unavailable. Check the local analysis service and retry.';

  @override
  String get analysisAuthenticationRequired =>
      'The AI analysis service is not signed in. Sign in to the service and retry.';

  @override
  String get analysisTimeoutError => 'AI analysis timed out. Try again later.';

  @override
  String get analysisInvalidResult =>
      'The AI result failed structure and evidence validation. Retry the analysis.';

  @override
  String get analysisResourceLimit =>
      'This video exceeds the current analysis limits. Use a shorter or smaller video.';

  @override
  String get analysisInputUnavailable =>
      'The source video is no longer available. Create a new download task.';

  @override
  String get analysisUsageLimited =>
      'The AI service is rate limited or has insufficient usage available. Try again later.';

  @override
  String get analysisWorkerLost =>
      'The analysis worker disconnected. Check the local service and retry.';

  @override
  String get shotCountLabel => 'Shots';

  @override
  String get visualAssetCountLabel => 'Visual assets';

  @override
  String get visualSummaryTitle => 'Visual summary';

  @override
  String get productionAdviceTitle => 'Production advice';

  @override
  String get analysisResultSectionLabel => 'Result section';

  @override
  String get analysisScenesTab => 'Scenes';

  @override
  String get analysisShotsTab => 'Shots';

  @override
  String get analysisHighlightsTab => 'Highlights';

  @override
  String get analysisAssetsTab => 'Assets';

  @override
  String get analysisReportTab => 'Report preview';

  @override
  String get analysisEmptySection =>
      'No results were identified in this section.';

  @override
  String loadMoreAnalysisResults(int count) {
    return 'Load more ($count remaining)';
  }

  @override
  String get highlightScoreLabel => 'Score';

  @override
  String get articleKeyPointsTitle => 'Key points';

  @override
  String get articleClosingTitle => 'Closing';

  @override
  String get articleLimitationsTitle => 'Editorial notes';

  @override
  String get articleEvidenceLabel => 'Video evidence';

  @override
  String get assetTypePerson => 'Person';

  @override
  String get assetTypeLocation => 'Location';

  @override
  String get assetTypeObject => 'Object';

  @override
  String get assetTypeProduct => 'Product';

  @override
  String get assetTypeLogo => 'Logo';

  @override
  String get assetTypeOnScreenText => 'On-screen text';

  @override
  String get adminCenterTitle => 'Admin center';

  @override
  String get adminCenterDescription =>
      'Review global operations and handle frequent administration tasks.';

  @override
  String get adminAnalyticsTitle => 'Download analytics';

  @override
  String get adminAnalyticsDescription =>
      'Review global volume, success rate, and source distribution by UTC day.';

  @override
  String get adminFilesTitle => 'File management';

  @override
  String get adminFilesDescription =>
      'Review persisted files and clean up resources beyond retention.';

  @override
  String get adminUsersTitle => 'User management';

  @override
  String get adminUsersDescription =>
      'Review users and adjust roles or account access.';

  @override
  String get adminProvidersTitle => 'Provider catalog';

  @override
  String get adminProvidersDescription =>
      'Review provider state and control user-facing visibility.';

  @override
  String get adminAiProvidersTitle => 'AI services';

  @override
  String get adminAiProvidersDescription =>
      'Review analysis routes and select the active provider.';

  @override
  String adminDays(int days) {
    return '$days days';
  }

  @override
  String get adminSuccessRate => 'Success rate';

  @override
  String get adminDownloadedBytes => 'Downloaded';

  @override
  String get adminSourceBreakdown => 'Source breakdown';

  @override
  String get adminCleanupTitle => 'Clean up expired files';

  @override
  String get adminCleanupDescription =>
      'Choose a retention period. The service will remove eligible persisted resources older than it.';

  @override
  String adminCleanupDays(int days) {
    return 'Clean up files older than $days days';
  }

  @override
  String get adminCleanupAction => 'Clean up files';

  @override
  String adminCleanupComplete(int count, String size) {
    return 'Removed $count resources and freed $size.';
  }

  @override
  String adminFileCount(int count) {
    return '$count persisted files';
  }

  @override
  String get adminFilesEmpty => 'No persisted files';

  @override
  String get adminFilesEmptyDescription =>
      'There are no persisted files requiring administrator action.';

  @override
  String adminUserCount(int count) {
    return '$count users';
  }

  @override
  String get adminRoleLabel => 'Role';

  @override
  String get adminRoleUser => 'User';

  @override
  String get adminRoleAdmin => 'Administrator';

  @override
  String get adminAccountActive => 'Allow sign-in and service access';

  @override
  String get adminAccountEnabled => 'Enabled';

  @override
  String get adminAccountDisabled => 'Disabled';

  @override
  String get adminCurrentUser => 'Current account';

  @override
  String get saveAction => 'Save';

  @override
  String get editAction => 'Edit';

  @override
  String get adminSystemRegistered => 'Registered by system';

  @override
  String get adminSystemMissing => 'Not registered by system';

  @override
  String get adminAgentAvailable => 'The local analysis agent is available.';

  @override
  String get adminAgentUnavailable =>
      'The local analysis agent is currently unavailable.';

  @override
  String get adminCredentialReady => 'Credential configured';

  @override
  String get adminCredentialMissing => 'Credential missing';

  @override
  String get adminActiveLine => 'Active route';

  @override
  String get adminActivateAction => 'Make active';

  @override
  String get adminActionFailed =>
      'The admin operation did not complete. Refresh and retry.';

  @override
  String get cancelDownloadAction => 'Cancel task';

  @override
  String get retryDownloadAction => 'Download again';
}
