import 'package:flutter/material.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final class StorageCleanupSheet extends StatefulWidget {
  const StorageCleanupSheet({super.key});
  @override
  State<StorageCleanupSheet> createState() => _StorageCleanupSheetState();
}

final class _StorageCleanupSheetState extends State<StorageCleanupSheet> {
  final _form = GlobalKey<ShadFormState>();
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
        child: ShadForm(
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
              ShadInputFormField(
                initialValue: '30',
                keyboardType: TextInputType.number,
                onChanged: (v) => _days = int.tryParse(v) ?? 0,
                validator: (_) =>
                    _days < 1 || _days > 3650 ? l.invalidConfiguration : null,
                label: Text(l.cleanupDaysLabel),
                description: Text('1–3650'),
              ),
              const SizedBox(height: 20),
              ShadButton.ghost(
                onPressed: () => Navigator.pop(context),
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Flexible(child: Text(l.cancelAction)),
              ),
              ShadButton(
                onPressed: () {
                  if (_form.currentState!.validate()) {
                    Navigator.pop(context, _days);
                  }
                },
                height: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Flexible(child: Text(l.adminCleanupAction)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
