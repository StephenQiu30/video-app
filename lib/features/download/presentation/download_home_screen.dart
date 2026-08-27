import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/app/presentation/app_bottom_navigation.dart';
import 'package:framegrab/features/download/application/inspect_media_intent.dart';
import 'package:framegrab/features/download/application/media_url_input.dart';
import 'package:framegrab/features/download/presentation/content_intake_controls.dart';
import 'package:framegrab/features/download/presentation/download_app_bar.dart';
import 'package:framegrab/features/download/presentation/download_home_content.dart';
import 'package:framegrab/features/download/presentation/download_status.dart';
import 'package:framegrab/features/settings/presentation/settings_screen.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/contract_pending_view.dart';

final class DownloadHomeScreen extends ConsumerStatefulWidget {
  const DownloadHomeScreen({super.key});

  @override
  ConsumerState<DownloadHomeScreen> createState() => _DownloadHomeScreenState();
}

final class _DownloadHomeScreenState extends ConsumerState<DownloadHomeScreen> {
  final _urlController = TextEditingController();
  bool _busy = false;
  String? _error;
  bool _urlInvalid = false;
  int _selectedIndex = 0;
  ContentIntakeMode _selectedIntakeMode = ContentIntakeMode.link;
  DownloadNoticeTone _statusTone = DownloadNoticeTone.destructive;

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

    final inspect = ref.read(inspectMediaIntentProvider);
    if (inspect == null) {
      setState(() {
        _error = localizations.nativeContractPending;
        _urlInvalid = false;
        _statusTone = DownloadNoticeTone.neutral;
      });
      return;
    }

    setState(() {
      _busy = true;
      _error = null;
      _urlInvalid = false;
      _statusTone = DownloadNoticeTone.destructive;
    });
    try {
      await inspect(normalized);
    } catch (_) {
      if (mounted) {
        setState(() {
          _error = localizations.operationFailed;
          _statusTone = DownloadNoticeTone.destructive;
        });
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _clear() {
    _urlController.clear();
    setState(() {
      _error = null;
      _urlInvalid = false;
      _statusTone = DownloadNoticeTone.destructive;
    });
  }

  void _showPendingContract() {
    final localizations = AppLocalizations.of(context);
    setState(() {
      _error = localizations.nativeUploadContractPending;
      _urlInvalid = false;
      _statusTone = DownloadNoticeTone.neutral;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: const DownloadAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DownloadHomeContent(
            busy: _busy,
            controller: _urlController,
            error: _error,
            invalid: _urlInvalid,
            mode: _selectedIntakeMode,
            onChanged: (_) {
              setState(() {
                if (_error != null) _error = null;
                _urlInvalid = false;
                _statusTone = DownloadNoticeTone.destructive;
              });
            },
            onClear: _clear,
            onModeChanged: (mode) {
              setState(() {
                _selectedIntakeMode = mode;
                _error = null;
                _urlInvalid = false;
                _statusTone = DownloadNoticeTone.destructive;
              });
            },
            onPendingAction: _showPendingContract,
            onSubmit: () {
              _submit();
            },
            statusTone: _statusTone,
          ),
          ContractPendingView(
            pageDescription: localizations.downloadHistoryDescription,
            pageTitle: localizations.downloadHistoryNavigation,
            title: localizations.downloadHistoryPendingTitle,
            description: localizations.downloadHistoryPendingDescription,
          ),
          ContractPendingView(
            pageDescription: localizations.screenplayDocumentsDescription,
            pageTitle: localizations.screenplayDocumentsNavigation,
            title: localizations.screenplayDocumentsPendingTitle,
            description: localizations.screenplayDocumentsPendingDescription,
          ),
          ContractPendingView(
            pageDescription: localizations.providerStatusDescription,
            pageTitle: localizations.providerStatusNavigation,
            title: localizations.providerStatusPendingTitle,
            description: localizations.providerStatusPendingDescription,
          ),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
