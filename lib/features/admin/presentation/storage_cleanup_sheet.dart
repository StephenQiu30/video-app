import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class StorageCleanupSheet extends StatefulWidget {
  const StorageCleanupSheet({super.key});
  @override
  State<StorageCleanupSheet> createState() => _StorageCleanupSheetState();
}

final class _StorageCleanupSheetState extends State<StorageCleanupSheet> {
  final _form = GlobalKey<FormState>();
  int _days = 30;
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return SafeArea(
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l.adminCleanupTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Text(l.adminCleanupDescription),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: '30',
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: l.cleanupDaysLabel,
                  helperText: '1–3650',
                ),
                onChanged: (v) => _days = int.tryParse(v) ?? 0,
                validator: (_) =>
                    _days < 1 || _days > 3650 ? l.invalidConfiguration : null,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l.cancelAction),
              ),
              FilledButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    Navigator.pop(context, _days);
                  }
                },
                child: Text(l.adminCleanupAction),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
