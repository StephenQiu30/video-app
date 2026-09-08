import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/profile_repository.dart';
import 'package:framegrab/features/auth/domain/username.dart';
import 'package:framegrab/features/auth/presentation/auth_validation.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class ProfileEditor extends ConsumerStatefulWidget {
  const ProfileEditor({super.key});
  @override
  ConsumerState<ProfileEditor> createState() => _ProfileEditorState();
}

final class _ProfileEditorState extends ConsumerState<ProfileEditor> {
  final _form = GlobalKey<FormState>();
  late final _username = TextEditingController(
    text: ref.read(authSessionProvider).user?.username,
  );
  bool _saving = false;
  String? _notice;
  @override
  void dispose() {
    _username.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving || !(_form.currentState?.validate() ?? false)) return;
    final l = AppLocalizations.of(context);
    setState(() {
      _saving = true;
      _notice = null;
    });
    try {
      await ref
          .read(profileRepositoryProvider)
          .update(normalizeUsername(_username.text));
      if (mounted) setState(() => _notice = l.profileSaved);
    } catch (error) {
      if (mounted) {
        setState(
          () => _notice =
              error is DataRequestFailure &&
                  error.code == 'username_already_registered'
              ? l.usernameRegisteredError
              : l.unknownAuthError,
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final user = ref.watch(authSessionProvider).user;
    if (user == null) return const SizedBox.shrink();
    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            key: const Key('profile-username-field'),
            controller: _username,
            enabled: !_saving,
            validator: (v) => validateAuthUsername(v, l),
            onChanged: (_) => setState(() => _notice = null),
            decoration: InputDecoration(
              labelText: l.usernameLabel,
              helperText: l.usernameHelp,
            ),
          ),
          const SizedBox(height: 16),
          Text(user.role.name == 'admin' ? l.adminRoleAdmin : l.adminRoleUser),
          if (_notice != null)
            Semantics(liveRegion: true, child: Text(_notice!)),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('profile-save-button'),
            onPressed:
                _saving || normalizeUsername(_username.text) == user.username
                ? null
                : _save,
            child: Text(_saving ? l.savingProfile : l.saveProfile),
          ),
        ],
      ),
    );
  }
}
