import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/app/router/app_router.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';

void main() {
  group('authRedirect', () {
    test('keeps public guide visible while the session is restoring', () {
      expect(
        authRedirect(
          phase: AuthSessionPhase.restoring,
          isAdmin: false,
          uri: Uri.parse('/guide'),
        ),
        isNull,
      );
    });

    test('restores a protected deep link after authentication', () {
      final restoringLocation = authRedirect(
        phase: AuthSessionPhase.restoring,
        isAdmin: true,
        uri: Uri.parse('/admin/analytics'),
      );

      expect(restoringLocation, '/auth/restoring?from=%2Fadmin%2Fanalytics');
      expect(
        authRedirect(
          phase: AuthSessionPhase.signedIn,
          isAdmin: true,
          uri: Uri.parse(restoringLocation!),
        ),
        '/admin/analytics',
      );
    });

    test('rejects external and authentication return locations', () {
      for (final from in [
        'https://example.com',
        '//example.com',
        '/auth/login',
      ]) {
        expect(
          authRedirect(
            phase: AuthSessionPhase.signedIn,
            isAdmin: true,
            uri: Uri(path: '/auth/restoring', queryParameters: {'from': from}),
          ),
          '/',
        );
      }
    });
  });
}
