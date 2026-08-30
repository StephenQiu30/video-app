import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/presentation/auth_error_text.dart';
import 'package:framegrab/features/auth/presentation/auth_failure_message.dart';
import 'package:framegrab/features/auth/presentation/auth_page_scaffold.dart';
import 'package:framegrab/features/auth/presentation/password_field.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

final class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

final class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusManager.instance.primaryFocus?.unfocus();
    final success = await ref
        .read(authSessionProvider.notifier)
        .register(
          username: _usernameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
    if (success && mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final session = ref.watch(authSessionProvider);
    final failure = session.failure;
    return AuthPageScaffold(
      title: localizations.createAccountTitle,
      description: localizations.registerDescription,
      child: AutofillGroup(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                key: const Key('register-username-field'),
                controller: _usernameController,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.newUsername],
                validator: (value) {
                  final length = value?.trim().length ?? 0;
                  return length >= 2 && length <= 32
                      ? null
                      : localizations.invalidUsername;
                },
                decoration: InputDecoration(
                  labelText: localizations.usernameLabel,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              TextFormField(
                key: const Key('register-email-field'),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                autocorrect: false,
                validator: (value) =>
                    _validEmail(value) ? null : localizations.invalidEmail,
                decoration: InputDecoration(
                  labelText: localizations.emailLabel,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              PasswordField(
                controller: _passwordController,
                label: localizations.passwordLabel,
                fieldKey: const Key('register-password-field'),
                obscure: _obscurePassword,
                onToggle: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                validator: (value) => (value?.length ?? 0) >= 8
                    ? null
                    : localizations.invalidPassword,
              ),
              const SizedBox(height: AppSpacing.small),
              PasswordField(
                controller: _confirmController,
                label: localizations.confirmPasswordLabel,
                fieldKey: const Key('register-confirm-field'),
                obscure: _obscurePassword,
                onToggle: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                validator: (value) => value == _passwordController.text
                    ? null
                    : localizations.passwordMismatch,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => unawaited(_submit()),
              ),
              const SizedBox(height: AppSpacing.medium),
              AuthErrorText(
                message: failure == null
                    ? null
                    : authFailureMessage(localizations, failure),
              ),
              if (failure != null) const SizedBox(height: AppSpacing.medium),
              FilledButton(
                key: const Key('register-submit-button'),
                onPressed: session.isBusy ? null : () => unawaited(_submit()),
                child: Text(
                  session.phase == AuthSessionPhase.submitting
                      ? localizations.registerSubmitting
                      : localizations.registerSubmit,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              TextButton(
                key: const Key('go-login-button'),
                onPressed: session.isBusy
                    ? null
                    : () => context.pushReplacement('/auth/login'),
                child: Text(
                  '${localizations.hasAccountPrompt} '
                  '${localizations.goLogin}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool _validEmail(String? value) {
  return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value?.trim() ?? '');
}
