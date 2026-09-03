import 'package:flutter/material.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/upload/application/content_upload_controller.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class UploadIntakePanel extends StatelessWidget {
  const UploadIntakePanel({
    required this.actionLabel,
    required this.description,
    required this.icon,
    required this.kind,
    required this.onPressed,
    required this.state,
    required this.title,
    super.key,
  });

  final String actionLabel;
  final String description;
  final IconData icon;
  final ContentUploadKind kind;
  final VoidCallback onPressed;
  final ContentUploadState state;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final active = state.kind == kind;
    final busy = active && state.busy;
    final failure = active ? state.failure : null;
    return Semantics(
      container: true,
      explicitChildNodes: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: theme.colorScheme.onSurfaceVariant, size: 24),
              const SizedBox(width: AppSpacing.small),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleSmall),
                    const SizedBox(height: AppSpacing.xSmall),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (busy) ...[
            const SizedBox(height: AppSpacing.large),
            Text(_phaseLabel(context, state.phase)),
            const SizedBox(height: AppSpacing.xSmall),
            LinearProgressIndicator(
              value:
                  state.phase == ContentUploadPhase.creating ||
                      state.phase == ContentUploadPhase.completing ||
                      state.phase == ContentUploadPhase.picking
                  ? null
                  : state.progress / 100,
            ),
          ],
          if (failure != null) ...[
            const SizedBox(height: AppSpacing.large),
            Text(
              _failureLabel(context, failure),
              key: const Key('content-upload-error'),
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ],
          const SizedBox(height: AppSpacing.xLarge),
          FilledButton.icon(
            key: Key('select-${kind.name}-file'),
            onPressed: state.busy ? null : onPressed,
            icon: busy
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Icon(icon, size: 20),
            label: Text(busy ? _phaseLabel(context, state.phase) : actionLabel),
          ),
        ],
      ),
    );
  }
}

String _phaseLabel(BuildContext context, ContentUploadPhase phase) {
  final l10n = AppLocalizations.of(context);
  return switch (phase) {
    ContentUploadPhase.picking => l10n.choosingUploadFile,
    ContentUploadPhase.hashing => l10n.hashingUploadFile,
    ContentUploadPhase.creating => l10n.creatingUpload,
    ContentUploadPhase.uploading => l10n.uploadingFile,
    ContentUploadPhase.completing => l10n.completingUpload,
    _ => l10n.uploadingFile,
  };
}

String _failureLabel(BuildContext context, ContentUploadFailureCode failure) {
  final l10n = AppLocalizations.of(context);
  return switch (failure) {
    ContentUploadFailureCode.emptyFile => l10n.emptyUploadFileError,
    ContentUploadFailureCode.invalidVideo => l10n.invalidVideoFileError,
    ContentUploadFailureCode.invalidDocument => l10n.invalidDocumentFileError,
    ContentUploadFailureCode.documentTooLarge => l10n.documentTooLargeError,
    ContentUploadFailureCode.fileSelectionFailed =>
      l10n.fileSelectionFailedError,
    ContentUploadFailureCode.inaccessibleFile => l10n.inaccessibleFileError,
    ContentUploadFailureCode.invalidSession ||
    ContentUploadFailureCode.uploadFailed => l10n.fileUploadFailed,
  };
}
