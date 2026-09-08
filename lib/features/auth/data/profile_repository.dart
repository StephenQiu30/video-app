import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/application/authenticated_request.dart';
import 'package:video_server_api/video_server_api.dart';

final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(
    ref.watch(authenticatedRequestProvider),
    ref.read(authSessionProvider.notifier),
  ),
);

final class ProfileRepository {
  const ProfileRepository(this.request, this.session);
  final AuthenticatedRequest request;
  final AuthSessionController session;
  Future<void> update(String username) async {
    final generation = request.sessionGeneration;
    final user = await request.execute((client) async {
      final response = await client.getUsersApi().updateCurrentUser(
        updateProfileRequest: UpdateProfileRequest(
          (b) => b..username = username,
        ),
      );
      final user = response.data;
      if (user == null) throw StateError('Missing profile');
      return user;
    });
    session.acceptUpdatedProfile(user, generation);
  }
}
