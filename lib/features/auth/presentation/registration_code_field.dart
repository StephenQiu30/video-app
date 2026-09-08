import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/presentation/auth_failure_message.dart';
import 'package:framegrab/features/auth/presentation/auth_validation.dart';
import 'package:framegrab/l10n/app_localizations.dart';

final class RegistrationCodeField extends ConsumerStatefulWidget {
  const RegistrationCodeField({
    required this.email,
    required this.controller,
    required this.disabled,
    required this.onSendingChanged,
    super.key,
  });
  final String email;
  final TextEditingController controller;
  final bool disabled;
  final ValueChanged<bool> onSendingChanged;
  @override
  ConsumerState<RegistrationCodeField> createState() =>
      _RegistrationCodeFieldState();
}

final class _RegistrationCodeFieldState
    extends ConsumerState<RegistrationCodeField> {
  bool _sending = false;
  bool _sent = false;
  AuthFailureKind? _failure;
  DateTime? _retryAt;
  Timer? _timer;
  int get _remaining => _retryAt == null
      ? 0
      : ((_retryAt!.difference(DateTime.now()).inMilliseconds / 1000).ceil())
            .clamp(0, 3600);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _send() async {
    if (_sending || _remaining > 0) return;
    final email = widget.email.trim();
    if (widget.disabled || !isValidAuthEmail(email)) return;
    setState(() {
      _sending = true;
      _failure = null;
      _sent = false;
    });
    widget.onSendingChanged(true);
    try {
      final result = await ref
          .read(nativeAuthGatewayProvider)
          .sendRegistrationCode(email);
      if (!mounted) return;
      widget.controller.clear();
      setState(() {
        _sent = true;
        _retryAt = DateTime.now().add(
          Duration(seconds: result.retryAfterSeconds ?? 60),
        );
      });
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (mounted) setState(() {});
        if (_remaining == 0) _timer?.cancel();
      });
    } on AuthRequestFailure catch (error) {
      if (mounted) setState(() => _failure = error.kind);
    } catch (_) {
      if (mounted) setState(() => _failure = AuthFailureKind.unknown);
    } finally {
      if (mounted) {
        setState(() => _sending = false);
        widget.onSendingChanged(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final validEmail = isValidAuthEmail(widget.email);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          key: const Key('register-code-field'),
          controller: widget.controller,
          enabled: !widget.disabled,
          keyboardType: TextInputType.number,
          autofillHints: const [AutofillHints.oneTimeCode],
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ],
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(labelText: l.verificationCodeLabel),
          validator: (value) => RegExp(r'^[0-9]{6}$').hasMatch(value ?? '')
              ? null
              : l.verificationCodeRequired,
        ),
        const SizedBox(height: 8),
        OutlinedButton(
          key: const Key('register-send-code-button'),
          onPressed:
              widget.disabled || _sending || _remaining > 0 || !validEmail
              ? null
              : () => unawaited(_send()),
          child: Text(
            _sending
                ? l.sendingVerificationCode
                : _remaining > 0
                ? l.verificationCodeCooldown(_remaining)
                : l.sendVerificationCode,
          ),
        ),
        if (_sent || _failure != null)
          Semantics(
            liveRegion: true,
            child: Text(
              _failure != null
                  ? authFailureMessage(l, _failure!)
                  : l.verificationCodeSent,
            ),
          ),
      ],
    );
  }
}
