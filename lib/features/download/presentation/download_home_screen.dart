import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/app/presentation/app_bottom_navigation.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/features/documents/application/document_list_provider.dart';
import 'package:framegrab/features/documents/presentation/document_list_screen.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/application/media_url_input.dart';
import 'package:framegrab/features/download/presentation/content_intake_controls.dart';
import 'package:framegrab/features/download/presentation/download_app_bar.dart';
import 'package:framegrab/features/download/presentation/download_home_content.dart';
import 'package:framegrab/features/download/presentation/download_intake_workspace.dart';
import 'package:framegrab/features/download/presentation/download_status.dart';
import 'package:framegrab/features/download/presentation/intake_failure_message.dart';
import 'package:framegrab/features/history/application/download_history_provider.dart';
import 'package:framegrab/features/history/presentation/download_history_screen.dart';
import 'package:framegrab/features/providers/application/provider_status_provider.dart';
import 'package:framegrab/features/providers/presentation/provider_status_screen.dart';
import 'package:framegrab/features/settings/presentation/settings_screen.dart';
import 'package:framegrab/features/upload/application/content_upload_controller.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class DownloadHomeScreen extends ConsumerStatefulWidget {
  const DownloadHomeScreen({super.key});

  @override
  ConsumerState<DownloadHomeScreen> createState() => _DownloadHomeScreenState();
}

final class _DownloadHomeScreenState extends ConsumerState<DownloadHomeScreen> {
  final _urlController = TextEditingController();
  String? _error;
  bool _urlInvalid = false;
  int _selectedIndex = 0;
  final Set<int> _visitedIndexes = {0};
  ContentIntakeMode _selectedIntakeMode = ContentIntakeMode.link;
  DownloadNoticeTone _statusTone = DownloadNoticeTone.destructive;

  @override
  void initState() {
    super.initState();
    unawaited(
      Future<void>.microtask(() async {
        try {
          await ref.read(providerStatusProvider.future);
        } catch (_) {
          // The status page exposes the retryable error when the user opens it.
        }
      }),
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final localizations = AppLocalizations.of(context);
    final normalized = normalizeMediaUrl(_urlController.text);
    if (normalized == null) {
      setState(() {
        _error = localizations.mediaUrlError;
        _urlInvalid = true;
        _statusTone = DownloadNoticeTone.destructive;
      });
      return;
    }

    setState(() {
      _error = null;
      _urlInvalid = false;
      _statusTone = DownloadNoticeTone.destructive;
    });
    await ref
        .read(downloadIntakeControllerProvider.notifier)
        .inspect(normalized);
  }

  void _clear() {
    _urlController.clear();
    ref.read(downloadIntakeControllerProvider.notifier).clearResult();
    setState(() {
      _error = null;
      _urlInvalid = false;
      _statusTone = DownloadNoticeTone.destructive;
    });
  }

  Future<void> _createDownload() async {
    final job = await ref
        .read(downloadIntakeControllerProvider.notifier)
        .createDownload();
    if (!mounted || job == null) return;
    ref.invalidate(downloadHistoryProvider);
    unawaited(DownloadDetailRoute(jobId: job.id).push<void>(context));
  }

  void _handleUploadResult(ContentUploadResult result) {
    ref.read(contentUploadControllerProvider.notifier).reset();
    if (result.kind == ContentUploadKind.video) {
      ref.invalidate(downloadHistoryProvider);
      unawaited(
        DownloadDetailRoute(jobId: result.resourceId).push<void>(context),
      );
      return;
    }
    ref.invalidate(documentListProvider);
    setState(() {
      _selectedIndex = 2;
      _visitedIndexes.add(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final intake = ref.watch(downloadIntakeControllerProvider);
    final upload = ref.watch(contentUploadControllerProvider);
    ref.listen(
      contentUploadControllerProvider.select((state) => state.result),
      (previous, next) {
        if (next != null && !identical(previous, next)) {
          _handleUploadResult(next);
        }
      },
    );
    final remoteError = intake.error;
    final error = remoteError == null
        ? _error
        : intakeFailureMessage(localizations, remoteError);
    return Scaffold(
      appBar: const DownloadAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DownloadHomeContent(
            busy: intake.busy || upload.busy,
            controller: _urlController,
            error: error,
            invalid: _urlInvalid,
            mode: _selectedIntakeMode,
            onChanged: (_) {
              ref.read(downloadIntakeControllerProvider.notifier).clearResult();
              setState(() {
                if (_error != null) _error = null;
                _urlInvalid = false;
                _statusTone = DownloadNoticeTone.destructive;
              });
            },
            onClear: _clear,
            onModeChanged: (mode) {
              if (upload.busy) return;
              ref.read(downloadIntakeControllerProvider.notifier).clearResult();
              ref.read(contentUploadControllerProvider.notifier).reset();
              setState(() {
                _selectedIntakeMode = mode;
                _error = null;
                _urlInvalid = false;
                _statusTone = DownloadNoticeTone.destructive;
              });
            },
            onSubmit: () {
              _submit();
            },
            onUploadAction: (kind) {
              ref.read(contentUploadControllerProvider.notifier).start(kind);
            },
            result:
                _selectedIntakeMode == ContentIntakeMode.link &&
                    (intake.discovery != null || intake.inspection != null)
                ? DownloadIntakeWorkspace(
                    onCreate: () {
                      _createDownload();
                    },
                    onSelectFormat: ref
                        .read(downloadIntakeControllerProvider.notifier)
                        .selectFormat,
                    onSelectItem: (itemRef) {
                      ref
                          .read(downloadIntakeControllerProvider.notifier)
                          .inspectItem(itemRef);
                    },
                    state: intake,
                  )
                : null,
            statusTone: remoteError == null
                ? _statusTone
                : DownloadNoticeTone.destructive,
            uploadState: upload,
          ),
          _lazyPage(1, const DownloadHistoryScreen()),
          _lazyPage(2, const DocumentListScreen()),
          _lazyPage(3, const ProviderStatusScreen()),
          _lazyPage(4, const SettingsScreen()),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
            _visitedIndexes.add(index);
          });
        },
      ),
    );
  }

  Widget _lazyPage(int index, Widget child) {
    return _visitedIndexes.contains(index) ? child : const SizedBox.shrink();
  }
}
