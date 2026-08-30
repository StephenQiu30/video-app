import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/media/data/media_repository.dart';

final mediaThumbnailProvider = FutureProvider.autoDispose
    .family<Uint8List, String>((ref, resourcePath) async {
      final userId = ref.watch(
        authSessionProvider.select((session) => session.user?.id),
      );
      if (userId == null) {
        throw StateError('An authenticated user is required.');
      }
      final link = ref.keepAlive();
      ref.onDispose(link.close);
      return ref.watch(mediaRepositoryProvider).fetchThumbnail(resourcePath);
    }, retry: (_, _) => null);
