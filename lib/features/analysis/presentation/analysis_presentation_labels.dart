import 'package:flutter/material.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

String analysisStatusLabel(AppLocalizations l10n, AnalysisStatus status) =>
    switch (status) {
      AnalysisStatus.queued => l10n.analysisStatusQueued,
      AnalysisStatus.running => l10n.analysisStatusRunning,
      AnalysisStatus.retryWait => l10n.analysisStatusRetryWait,
      AnalysisStatus.succeeded => l10n.analysisStatusSucceeded,
      AnalysisStatus.failed => l10n.analysisStatusFailed,
      AnalysisStatus.cancelled => l10n.analysisStatusCancelled,
      _ => l10n.analysisOperationFailed,
    };

String analysisStageLabel(AppLocalizations l10n, AnalysisStage? stage) =>
    switch (stage) {
      AnalysisStage.preparing => l10n.analysisStagePreparing,
      AnalysisStage.analyzing => l10n.analysisStageAnalyzing,
      AnalysisStage.validating => l10n.analysisStageValidating,
      AnalysisStage.publishing => l10n.analysisStagePublishing,
      _ => l10n.analysisStagePending,
    };

Color analysisStatusColor(BuildContext context, AnalysisStatus status) =>
    switch (status) {
      AnalysisStatus.succeeded => context.appColors.success,
      AnalysisStatus.failed => Theme.of(context).colorScheme.error,
      AnalysisStatus.queued ||
      AnalysisStatus.running ||
      AnalysisStatus.retryWait => context.appColors.warning,
      _ => Theme.of(context).colorScheme.onSurfaceVariant,
    };

String analysisFailureMessage(AppLocalizations l10n, Object? error) {
  final code = switch (error) {
    final AnalysisErrorCode value => value.name,
    final DataRequestFailure value => value.code,
    _ => null,
  };
  return switch (code) {
    'analysisCliUnavailable' ||
    'analysisCliUnsupported' ||
    'analysisSandboxUnavailable' ||
    'analysis_cli_unavailable' ||
    'analysis_cli_unsupported' ||
    'analysis_sandbox_unavailable' => l10n.analysisServiceUnavailable,
    'analysisCliNotAuthenticated' ||
    'analysis_cli_not_authenticated' => l10n.analysisAuthenticationRequired,
    'analysisCliTimeout' || 'analysis_cli_timeout' => l10n.analysisTimeoutError,
    'analysisCliFailed' ||
    'analysis_cli_failed' ||
    'internalError' ||
    'internal_error' => l10n.analysisExecutionFailed,
    'invalidModelOutput' ||
    'invalid_model_output' => l10n.analysisInvalidResult,
    'analysisResourceLimit' ||
    'analysis_resource_limit' => l10n.analysisResourceLimit,
    'inputArtifactUnavailable' ||
    'analysisInputExpired' ||
    'input_artifact_unavailable' ||
    'analysis_input_expired' => l10n.analysisInputUnavailable,
    'analysisProviderRateLimited' ||
    'analysisProviderUsageLimited' ||
    'analysis_provider_rate_limited' ||
    'analysis_provider_usage_limited' => l10n.analysisUsageLimited,
    'workerLost' || 'worker_lost' => l10n.analysisWorkerLost,
    _ => switch (error) {
      DataRequestFailure(kind: DataRequestFailureKind.rateLimited) =>
        l10n.analysisUsageLimited,
      DataRequestFailure(kind: DataRequestFailureKind.unavailable) =>
        l10n.analysisServiceUnavailable,
      _ => l10n.analysisOperationFailed,
    },
  };
}

String analysisAssetTypeLabel(AppLocalizations l10n, String type) =>
    switch (type) {
      'person' => l10n.assetTypePerson,
      'location' => l10n.assetTypeLocation,
      'object' => l10n.assetTypeObject,
      'product' => l10n.assetTypeProduct,
      'logo' => l10n.assetTypeLogo,
      'on_screen_text' => l10n.assetTypeOnScreenText,
      _ => type,
    };
