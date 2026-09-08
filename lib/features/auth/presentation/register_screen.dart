import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/core/theme/app_spacing.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/domain/username.dart';
import 'package:framegrab/features/auth/presentation/auth_error_text.dart';
import 'package:framegrab/features/auth/presentation/auth_failure_message.dart';
import 'package:framegrab/features/auth/presentation/auth_page_scaffold.dart';
import 'package:framegrab/features/auth/presentation/auth_validation.dart';
import 'package:framegrab/features/auth/presentation/password_field.dart';
import 'package:framegrab/features/auth/presentation/registration_code_field.dart';
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
  final _codeController = TextEditingController();
  bool _sendingCode = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (ref.read(authSessionProvider).isBusy || _sendingCode) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    FocusManager.instance.primaryFocus?.unfocus();
    final success = await ref
        .read(authSessionProvider.notifier)
        .register(
          verificationCode: _codeController.text,
          username: normalizeUsername(_usernameController.text),
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
                validator: (value) =>
                    validateAuthUsername(value, localizations),
                decoration: InputDecoration(
                  helperText: localizations.usernameHelp,
                  labelText: localizations.usernameLabel,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              TextFormField(
                key: const Key('register-email-field'),
                enabled: !session.isBusy && !_sendingCode,
                onChanged: (_) => setState(() {
                  _codeController.clear();
                }),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.email],
                autocorrect: false,
                validator: (value) => validateAuthEmail(value, localizations),
                decoration: InputDecoration(
                  labelText: localizations.emailLabel,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              RegistrationCodeField(
                key: ValueKey(_emailController.text.trim().toLowerCase()),
                email: _emailController.text,
                controller: _codeController,
                disabled: session.isBusy,
                onSendingChanged: (sending) =>
                    setState(() => _sendingCode = sending),
              ),
              const SizedBox(height: AppSpacing.small),
              PasswordField(
                newPassword: true,
                controller: _passwordController,
                label: localizations.passwordLabel,
                fieldKey: const Key('register-password-field'),
                obscure: _obscurePassword,
                onToggle: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                validator: (value) => validateAuthPassword(
                  value,
                  localizations,
                  registering: true,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              PasswordField(
                newPassword: true,
                controller: _confirmController,
                label: localizations.confirmPasswordLabel,
                fieldKey: const Key('register-confirm-field'),
                obscure: _obscurePassword,
                onToggle: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                validator: (value) => (value ?? '').isEmpty
                    ? localizations.requiredConfirmPassword
                    : value == _passwordController.text
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
                onPressed: session.isBusy || _sendingCode
                    ? null
                    : () => unawaited(_submit()),
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
