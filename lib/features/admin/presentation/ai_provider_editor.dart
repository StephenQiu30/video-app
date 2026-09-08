import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/application/admin_providers.dart';
import 'package:framegrab/features/admin/data/admin_configuration_repository.dart';
import 'package:framegrab/features/admin/presentation/admin_edit_sheet.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:video_server_api/video_server_api.dart';

Future<void> editAiProvider(
  BuildContext context,
  WidgetRef ref, [
  AiProviderProfileResponse? item,
]) async {
  final saved = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    builder: (_) => _AiEditor(item: item),
  );
  if (saved == true && context.mounted) {
    ref.invalidate(adminAiProvidersProvider);
  }
}

final class _AiEditor extends ConsumerStatefulWidget {
  const _AiEditor({this.item});
  final AiProviderProfileResponse? item;
  @override
  ConsumerState<_AiEditor> createState() => _AiEditorState();
}

final class _AiEditorState extends ConsumerState<_AiEditor> {
  late final _key = TextEditingController(text: widget.item?.key);
  late final _name = TextEditingController(text: widget.item?.displayName);
  late final _model = TextEditingController(
    text: widget.item?.model ?? 'gpt-5.6-sol',
  );
  late final _url = TextEditingController(text: widget.item?.baseUrl);
  final _secret = TextEditingController();
  late var _engine = widget.item?.engine ?? AiProviderEngine.codex;
  late var _auth = widget.item?.authMode ?? AiProviderAuthMode.hostLogin;
  bool get _local => widget.item?.key == 'local-codex';
  @override
  void dispose() {
    for (final c in [_key, _name, _model, _url, _secret]) {
      c.dispose();
    }
    super.dispose();
  }

  void _changeEngine(AiProviderEngine value) => setState(() {
    _engine = value;
    _auth = value == AiProviderEngine.deepseek
        ? AiProviderAuthMode.apiKey
        : AiProviderAuthMode.hostLogin;
    _model.text = value == AiProviderEngine.deepseek
        ? 'deepseek-v4-flash-vision-exp'
        : value == AiProviderEngine.codex
        ? 'gpt-5.6-sol'
        : 'sonnet';
    _url.text = value == AiProviderEngine.deepseek
        ? 'https://api.deepseek.com'
        : '';
    _secret.clear();
  });
  Future<void> _save() async {
    final repository = ref.read(adminConfigurationRepositoryProvider);
    final secret = _secret.text.trim();
    if (widget.item == null) {
      await repository.createAi(
        CreateAiProviderProfileRequest(
          (b) => b
            ..key = _key.text.trim()
            ..displayName = _name.text.trim()
            ..engine = _engine
            ..authMode = _auth
            ..model = _model.text.trim()
            ..baseUrl = _auth == AiProviderAuthMode.apiKey
                ? _url.text.trim()
                : null
            ..apiKey = secret.isEmpty ? null : secret,
        ),
      );
    } else {
      await repository.updateAi(
        widget.item!.key,
        UpdateAiProviderProfileRequest((b) {
          b
            ..displayName = _name.text.trim()
            ..model = _model.text.trim();
          if (!_local) {
            b
              ..engine = _engine
              ..authMode = _auth
              ..baseUrl = _auth == AiProviderAuthMode.apiKey
                  ? _url.text.trim()
                  : null
              ..apiKey = secret.isEmpty ? null : secret;
          }
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    String? required(String? v) =>
        (v ?? '').trim().isEmpty ? l.invalidConfiguration : null;
    return AdminEditSheet(
      title: widget.item == null ? l.createAiProvider : l.editAction,
      onSave: _save,
      fields: [
        if (_local) Text(l.localCodexRestriction),
        TextFormField(
          controller: _key,
          enabled: widget.item == null,
          maxLength: 32,
          decoration: InputDecoration(labelText: l.configurationKey),
          validator: (v) => RegExp(r'^[a-z][a-z0-9_-]{0,31}$').hasMatch(v ?? '')
              ? null
              : l.invalidConfiguration,
        ),
        TextFormField(
          controller: _name,
          maxLength: 64,
          decoration: InputDecoration(labelText: l.displayName),
          validator: required,
        ),
        DropdownButtonFormField<AiProviderEngine>(
          isExpanded: true,
          initialValue: _engine,
          decoration: InputDecoration(labelText: l.engineLabel),
          items: [
            for (final e in AiProviderEngine.values.where(
              (v) => v != AiProviderEngine.unknownDefaultOpenApi,
            ))
              DropdownMenuItem(value: e, child: Text(e.name)),
          ],
          onChanged: _local
              ? null
              : (v) {
                  if (v != null) _changeEngine(v);
                },
        ),
        DropdownButtonFormField<AiProviderAuthMode>(
          isExpanded: true,
          key: ValueKey(_engine),
          initialValue: _auth,
          decoration: InputDecoration(labelText: l.authModeLabel),
          items: [
            for (final a in AiProviderAuthMode.values.where(
              (v) => v != AiProviderAuthMode.unknownDefaultOpenApi,
            ))
              if (_engine != AiProviderEngine.deepseek ||
                  a == AiProviderAuthMode.apiKey)
                DropdownMenuItem(
                  value: a,
                  child: Text(
                    a == AiProviderAuthMode.hostLogin
                        ? l.hostLoginLabel
                        : 'API Key',
                  ),
                ),
          ],
          onChanged: _local
              ? null
              : (v) {
                  if (v != null) {
                    setState(() {
                      _auth = v;
                      _url.clear();
                      _secret.clear();
                    });
                  }
                },
        ),
        TextFormField(
          controller: _model,
          enabled: _engine != AiProviderEngine.deepseek,
          maxLength: 128,
          decoration: InputDecoration(labelText: l.modelLabel),
          validator: required,
        ),
        if (_auth == AiProviderAuthMode.apiKey) ...[
          TextFormField(
            controller: _url,
            keyboardType: TextInputType.url,
            decoration: InputDecoration(labelText: l.baseUrlLabel),
            validator: (v) {
              final uri = Uri.tryParse(v ?? '');
              return uri != null &&
                      uri.hasAuthority &&
                      {'http', 'https'}.contains(uri.scheme)
                  ? null
                  : l.invalidConfiguration;
            },
          ),
          TextFormField(
            controller: _secret,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
              labelText: l.apiKeyLabel,
              helperText: widget.item?.credentialConfigured == true
                  ? l.apiKeyKeepHint
                  : null,
            ),
            validator: widget.item?.credentialConfigured == true
                ? null
                : required,
          ),
        ],
      ],
    );
  }
}
