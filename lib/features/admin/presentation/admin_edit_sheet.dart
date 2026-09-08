import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';

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
  final _form = GlobalKey<FormState>();
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
        child: Form(
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
                Semantics(liveRegion: true, child: Text(_error!)),
              TextButton(
                onPressed: _saving ? null : () => Navigator.pop(context, false),
                child: Text(AppLocalizations.of(context).cancelAction),
              ),
              FilledButton(
                onPressed: _saving ? null : _save,
                child: Text(
                  _saving
                      ? AppLocalizations.of(context).savingProfile
                      : AppLocalizations.of(context).saveAction,
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
    await showDialog<bool>(
      context: context,
      builder: (context) {
        final l = AppLocalizations.of(context);
        return AlertDialog(
          title: Text(l.deleteConfiguration),
          content: Text(l.deleteConfigurationDescription),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l.cancelAction),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(l.deleteAction),
            ),
          ],
        );
      },
    ) ??
    false;
