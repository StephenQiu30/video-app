import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/download/presentation/download_home_screen.dart';
import 'package:framegrab/features/landing/presentation/public_home_screen.dart';

final class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signedIn = ref.watch(
      authSessionProvider.select((session) => session.isSignedIn),
    );
    return signedIn ? const DownloadHomeScreen() : const PublicHomeScreen();
  }
}
