import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/presentation/login_screen.dart';
import 'package:framegrab/features/auth/presentation/register_screen.dart';
import 'package:framegrab/features/auth/presentation/session_restore_screen.dart';
import 'package:framegrab/features/download/presentation/download_home_screen.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = _RouterRefresh();
  ref.listen(
    authSessionProvider.select((session) => session.phase),
    (_, _) => refresh.notify(),
  );
  final router = GoRouter(
    routes: $appRoutes,
    refreshListenable: refresh,
    redirect: (_, state) => _redirectForAuth(
      phase: ref.read(authSessionProvider).phase,
      location: state.matchedLocation,
    ),
  );
  ref.onDispose(refresh.dispose);
  ref.onDispose(router.dispose);
  return router;
});

String? _redirectForAuth({
  required AuthSessionPhase phase,
  required String location,
}) {
  final isEntry = location == '/auth/login' || location == '/auth/register';
  final isRestore = location == '/auth/restoring';
  final isAuthLocation = location.startsWith('/auth/');

  if (phase == AuthSessionPhase.restoring) {
    return isRestore ? null : '/auth/restoring';
  }
  if (phase == AuthSessionPhase.signedOut) {
    return isEntry ? null : '/auth/login';
  }
  if (phase == AuthSessionPhase.signedIn && isAuthLocation) return '/';
  return null;
}

final class _RouterRefresh extends ChangeNotifier {
  void notify() => notifyListeners();
}

@TypedGoRoute<DownloadHomeRoute>(path: '/')
final class DownloadHomeRoute extends GoRouteData with $DownloadHomeRoute {
  const DownloadHomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DownloadHomeScreen();
  }
}

@TypedGoRoute<LoginRoute>(path: '/auth/login')
final class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<SessionRestoreRoute>(path: '/auth/restoring')
final class SessionRestoreRoute extends GoRouteData with $SessionRestoreRoute {
  const SessionRestoreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SessionRestoreScreen();
  }
}

@TypedGoRoute<RegisterRoute>(path: '/auth/register')
final class RegisterRoute extends GoRouteData with $RegisterRoute {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegisterScreen();
  }
}
