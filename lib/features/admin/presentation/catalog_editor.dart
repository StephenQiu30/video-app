import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_configuration_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

Future<void> editCatalog(
  BuildContext context,
  WidgetRef ref, [
  ProviderCatalogEntryResponse? item,
]) async {
  final saved = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    builder: (_) => _CatalogEditor(item: item),
  );
  if (saved == true && context.mounted) {
    ref.invalidate(adminProviderCatalogProvider);
  }
}

final class _CatalogEditor extends ConsumerStatefulWidget {
  const _CatalogEditor({this.item});
  final ProviderCatalogEntryResponse? item;
  @override
  ConsumerState<_CatalogEditor> createState() => _CatalogEditorState();
}

final class _CatalogEditorState extends ConsumerState<_CatalogEditor> {
  late final _key = TextEditingController(text: widget.item?.key);
  late final _name = TextEditingController(text: widget.item?.displayName);
  late final _order = TextEditingController(
    text: '${widget.item?.sortOrder ?? 100}',
  );
  late bool _visible = widget.item?.isVisible ?? true;
  @override
  void dispose() {
    _key.dispose();
    _name.dispose();
    _order.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final repository = ref.read(adminConfigurationRepositoryProvider);
    if (widget.item == null) {
      await repository.createCatalog(
        CreateProviderCatalogEntryRequest(
          (b) => b
            ..key = _key.text.trim()
            ..displayName = _name.text.trim()
            ..sortOrder = int.parse(_order.text)
            ..isVisible = _visible,
        ),
      );
    } else {
      await repository.updateCatalog(
        widget.item!.key,
        UpdateProviderCatalogEntryRequest(
          (b) => b
            ..displayName = _name.text.trim()
            ..sortOrder = int.parse(_order.text)
            ..isVisible = _visible,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return AdminEditSheet(
      title: widget.item == null ? l.createPlatform : l.editAction,
      onSave: _save,
      fields: [
        Text(l.catalogScopeDescription),
        TextFormField(
          controller: _key,
          enabled: widget.item == null,
          decoration: InputDecoration(labelText: l.configurationKey),
          validator: (v) => RegExp(r'^[a-z][a-z0-9_-]{0,31}$').hasMatch(v ?? '')
              ? null
              : l.invalidConfiguration,
        ),
        TextFormField(
          controller: _name,
          maxLength: 64,
          decoration: InputDecoration(labelText: l.displayName),
          validator: (v) =>
              (v ?? '').trim().isEmpty ? l.invalidConfiguration : null,
        ),
        TextFormField(
          controller: _order,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: l.sortOrder,
            helperText: '0–10000',
          ),
          validator: (v) {
            final n = int.tryParse(v ?? '');
            return n == null || n < 0 || n > 10000
                ? l.invalidConfiguration
                : null;
          },
        ),
        SwitchListTile(
          title: Text(l.platformVisible),
          value: _visible,
          onChanged: (v) => setState(() => _visible = v),
        ),
      ],
    );
  }
}
