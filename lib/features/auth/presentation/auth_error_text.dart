import 'package:flutter/material.dart';
import 'package:phosphor_icons/phosphor_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
      child: ShadAlert.destructive(
        icon: const Icon(PhosphorIconsRegular.warningCircle),
        description: Text(value),
      ),
    );
  }
}
