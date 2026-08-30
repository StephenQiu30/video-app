import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

bool isActiveDownloadStatus(String status) =>
    status == 'queued' || status == 'running' || status == 'retryWait';

Color downloadStatusColor(BuildContext context, String status) =>
    switch (status) {
      'succeeded' => context.appColors.success,
      'failed' => Theme.of(context).colorScheme.error,
      'queued' || 'running' || 'retryWait' => context.appColors.warning,
      _ => Theme.of(context).colorScheme.onSurfaceVariant,
    };

String downloadStatusLabel(AppLocalizations l10n, String status) =>
    switch (status) {
      'queued' => l10n.downloadStatusQueued,
      'running' => l10n.downloadStatusRunning,
      'retryWait' => l10n.downloadStatusRetryWait,
      'succeeded' => l10n.downloadStatusSucceeded,
      'failed' => l10n.downloadStatusFailed,
      'cancelled' => l10n.downloadStatusCancelled,
      _ => l10n.downloadStatusUnknown,
    };

String downloadStageLabel(AppLocalizations l10n, String stage) =>
    switch (stage) {
      'revalidating' => l10n.downloadStageRevalidating,
      'downloading' => l10n.downloadStageDownloading,
      'remuxing' => l10n.downloadStageRemuxing,
      'verifying' => l10n.downloadStageVerifying,
      'uploading' => l10n.downloadStageUploading,
      _ => l10n.downloadStageUnknown,
    };

String downloadFailureLabel(AppLocalizations l10n, String code) {
  if (code == 'cancelled') return l10n.failureCancelled;
  if (code.contains('timeout')) return l10n.failureTimeout;
  if (code.contains('auth') ||
      code.contains('restricted') ||
      code.contains('geo') ||
      code.contains('drm')) {
    return l10n.failureProviderAccess;
  }
  if (code.contains('rate') ||
      code.contains('temporary') ||
      code.contains('unavailable')) {
    return l10n.failureProviderTemporary;
  }
  if (code.contains('storage') || code.contains('space')) {
    return l10n.failureStorage;
  }
  return l10n.failureGeneric;
}

String downloadFormatLabel(
  AppLocalizations localizations,
  SemanticPlanResponse? format,
) {
  if (format == null) return localizations.formatUnavailable;
  final container = format.containerPreference.name.toUpperCase();
  final codec = format.videoCodecFamily.name.toUpperCase();
  return '${format.width}×${format.height} · $container · $codec';
}
