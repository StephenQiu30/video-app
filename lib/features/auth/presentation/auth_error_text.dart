import 'package:flutter/material.dart';

final class AuthErrorText extends StatelessWidget {
  const AuthErrorText({required this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final value = message;
    if (value == null) return const SizedBox.shrink();
    return Semantics(
      container: true,
      liveRegion: true,
      child: Text(
        value,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
