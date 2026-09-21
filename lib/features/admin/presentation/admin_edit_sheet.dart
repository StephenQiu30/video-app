import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class AdminEditSheet extends StatefulWidget {
  const AdminEditSheet({
    required this.title,
    required this.fields,
    required this.onSave,
    super.key,
  });
  final String title;
  final List<Widget> fields;
  final Future<void> Function() onSave;
  @override
  State<AdminEditSheet> createState() => _AdminEditSheetState();
}

final class _AdminEditSheetState extends State<AdminEditSheet> {
  final _form = GlobalKey<ShadFormState>();
  bool _saving = false;
  String? _error;
  Future<void> _save() async {
    if (_saving || !(_form.currentState?.validate() ?? false)) return;
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await widget.onSave();
      if (mounted) Navigator.pop(context, true);
    } catch (_) {
      if (mounted) {
        setState(() => _error = AppLocalizations.of(context).adminActionFailed);
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: !_saving,
    child: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          24,
          24,
          24,
          MediaQuery.viewInsetsOf(context).bottom + 24,
        ),
        child: ShadForm(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              AbsorbPointer(
                absorbing: _saving,
                child: Column(
                  children: [
                    for (final field in widget.fields)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: field,
                      ),
                  ],
                ),
              ),
              if (_error != null)
                Semantics(
                  liveRegion: true,
                  child: ShadAlert.destructive(description: Text(_error!)),
                ),
              ShadButton.ghost(
                onPressed: _saving ? null : () => Navigator.pop(context, false),
                enabled:
                    (_saving ? null : () => Navigator.pop(context, false)) !=
                    null,
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Flexible(
                  child: Text(AppLocalizations.of(context).cancelAction),
                ),
              ),
              ShadButton(
                onPressed: _saving ? null : _save,
                enabled: (_saving ? null : _save) != null,
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Flexible(
                  child: Text(
                    _saving
                        ? AppLocalizations.of(context).savingProfile
                        : AppLocalizations.of(context).saveAction,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Future<bool> confirmAdminDelete(BuildContext context) async =>
    await showShadDialog<bool>(
      context: context,
      builder: (context) {
        final l = AppLocalizations.of(context);
        return ShadDialog.alert(
          title: Text(l.deleteConfiguration),
          actions: [
            ShadButton.ghost(
              onPressed: () => Navigator.pop(context, false),
              height: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Flexible(child: Text(l.cancelAction)),
            ),
            ShadButton(
              onPressed: () => Navigator.pop(context, true),
              height: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Flexible(child: Text(l.deleteAction)),
            ),
          ],
          description: Text(l.deleteConfigurationDescription),
        );
      },
    ) ??
    false;
