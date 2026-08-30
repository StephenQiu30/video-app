import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/providers/data/provider_status_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final providerStatusProvider = FutureProvider<ProviderListResponse>((ref) {
  ref.watch(authSessionProvider.select((state) => state.user?.id));
  return ref.watch(providerStatusRepositoryProvider).fetch();
}, retry: (_, _) => null);
