import 'package:flutter/material.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/presentation/download_status.dart';
import 'package:framegrab/features/download/presentation/inspection_workspace.dart';
import 'package:framegrab/features/download/presentation/intake_failure_message.dart';
import 'package:framegrab/features/download/presentation/source_discovery_workspace.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:video_server_api/video_server_api.dart';

final class DownloadIntakeWorkspace extends StatelessWidget {
  const DownloadIntakeWorkspace({
    required this.onCancelIntent,
    required this.onCreate,
    required this.onOpenJob,
    required this.onRefreshIntent,
    required this.onRetryInspection,
    required this.onSelectFormat,
    required this.onSelectItem,
    required this.state,
    super.key,
  });

  final VoidCallback onCancelIntent;
  final VoidCallback onCreate;
  final ValueChanged<String> onOpenJob;
  final VoidCallback onRefreshIntent;
  final VoidCallback onRetryInspection;
  final ValueChanged<String> onSelectFormat;
  final ValueChanged<String> onSelectItem;
  final DownloadIntakeState state;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final inspection = state.inspection;
    final intent = state.intent;
    final expired =
        (inspection != null && !inspection.expiresAt.isAfter(DateTime.now())) ||
        (state.error is DataRequestFailure &&
            (state.error! as DataRequestFailure).code == 'resource_expired');
    final status = intent == null
        ? null
        : switch (intent.status) {
            IntentStatus.queued => localizations.intentQueued,
            IntentStatus.preparing => localizations.intentPreparing,
            IntentStatus.resolving => localizations.intentResolving,
            IntentStatus.retryWait => localizations.intentRetryWait,
            IntentStatus.actionRequired => localizations.intentActionRequired,
            IntentStatus.failed => localizations.intentFailed,
            IntentStatus.cancelled => localizations.intentCancelled,
            IntentStatus.expired => localizations.intentExpired,
            IntentStatus.handedOff => localizations.intentHandedOff,
            _ => localizations.inspectionResultTitle,
          };
    final reasonCode = intent?.reasonCode;
    final reason = reasonCode == null
        ? null
        : intakeFailureMessage(
            localizations,
            DataRequestFailure(
              DataRequestFailureKind.unknown,
              code: reasonCode,
            ),
          );
    return Column(
      key: const Key('download-intake-workspace'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (intent == null && inspection == null && state.discovery != null)
          SourceDiscoveryWorkspace(
            busy: state.busy,
            discovery: state.discovery!,
            onSelect: onSelectItem,
          ),
        if (intent != null &&
            (intent.status != IntentStatus.ready ||
                inspection == null ||
                expired)) ...[
          DownloadInlineStatus(
            message: expired
                ? '${localizations.intentExpired} — ${localizations.intentRefreshHint}'
                : intent.status == IntentStatus.ready && inspection == null
                ? localizations.serviceUnavailableError
                : reason == null
                ? status ?? localizations.inspectionResultTitle
                : '$status — $reason',
            tone: DownloadNoticeTone.neutral,
          ),
          const SizedBox(height: 12),
          if (intent.status == IntentStatus.ready && expired)
            ShadButton(
              onPressed: state.busy ? null : onRefreshIntent,
              child: Text(localizations.intentRefreshAction),
            ),
          if (intent.status == IntentStatus.ready &&
              inspection == null &&
              !expired)
            ShadButton.outline(
              onPressed: state.busy ? null : onRetryInspection,
              child: Text(localizations.retryAction),
            ),
          if (intent.status == IntentStatus.handedOff && intent.jobId != null)
            ShadButton(
              onPressed: () => onOpenJob(intent.jobId!),
              child: Text(localizations.downloadDetailNavigation),
            ),
          if (intent.status == IntentStatus.queued ||
              intent.status == IntentStatus.preparing ||
              intent.status == IntentStatus.resolving ||
              intent.status == IntentStatus.retryWait)
            ShadButton.outline(
              onPressed: state.busy ? null : onCancelIntent,
              child: Text(localizations.intentCancelAction),
            ),
        ] else if (inspection != null)
          InspectionWorkspace(
            onCreate: onCreate,
            onSelectFormat: onSelectFormat,
            state: state,
          ),
      ],
    );
  }
}
