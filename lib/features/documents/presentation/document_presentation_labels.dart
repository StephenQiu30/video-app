import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_colors.dart';
import 'package:framegrab/l10n/app_localizations.dart';

Color documentStatusColor(BuildContext context, String status) =>
    switch (status) {
      'ready' => context.appColors.success,
      'failed' || 'expired' => Theme.of(context).colorScheme.error,
      'uploading' || 'verifying' => context.appColors.warning,
      _ => Theme.of(context).colorScheme.onSurfaceVariant,
    };

String documentStatusLabel(AppLocalizations l10n, String status) =>
    switch (status) {
      'uploading' => l10n.documentStatusUploading,
      'verifying' => l10n.documentStatusVerifying,
      'ready' => l10n.documentStatusReady,
      'failed' => l10n.documentStatusFailed,
      'cancelled' => l10n.documentStatusCancelled,
      'expired' => l10n.documentStatusExpired,
      _ => l10n.documentStatusUnknown,
    };

String documentLanguageLabel(AppLocalizations l10n, String? language) =>
    switch (language) {
      'zh' || 'zh-CN' => l10n.chineseLanguage,
      'en' || 'en-US' => l10n.englishLanguage,
      'mixed' => l10n.mixedLanguage,
      'unknown' => l10n.unknownLanguage,
      _ => l10n.waitingForParsing,
    };

String documentErrorLabel(AppLocalizations l10n, String? code) =>
    switch (code) {
      'import_storage_unavailable' => l10n.documentStorageUnavailable,
      'upload_session_expired' => l10n.documentUploadSessionExpired,
      'upload_incomplete' => l10n.documentUploadIncomplete,
      'import_size_mismatch' => l10n.documentSizeMismatch,
      'import_sha256_mismatch' => l10n.documentIntegrityMismatch,
      'document_format_unsupported' => l10n.documentFormatUnsupported,
      'document_encrypted' => l10n.documentEncrypted,
      'document_archive_unsafe' => l10n.documentArchiveUnsafe,
      'document_text_unavailable' => l10n.documentTextUnavailable,
      'document_structure_invalid' => l10n.documentStructureInvalid,
      _ => l10n.operationFailed,
    };

String documentQualityWarningLabel(AppLocalizations l10n, String warning) =>
    warning == 'scene_heading_missing'
    ? l10n.documentSceneHeadingMissing
    : l10n.documentManualReviewRequired;
