import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/admin/presentation/admin_ai_providers_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_analytics_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_home_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_providers_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_storage_screen.dart';
import 'package:framegrab/features/admin/presentation/admin_users_screen.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/presentation/login_screen.dart';
import 'package:framegrab/features/auth/presentation/register_screen.dart';
import 'package:framegrab/features/auth/presentation/session_restore_screen.dart';
import 'package:framegrab/features/download/presentation/download_home_screen.dart';
import 'package:framegrab/features/history/presentation/download_detail_screen.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = _RouterRefresh();
  ref.listen(
    authSessionProvider.select(
      (session) => (session.phase, session.user?.role.name),
    ),
    (_, _) => refresh.notify(),
  );
  final router = GoRouter(
    routes: $appRoutes,
    refreshListenable: refresh,
    redirect: (_, state) => _redirectForAuth(
      phase: ref.read(authSessionProvider).phase,
      isAdmin: ref.read(authSessionProvider).user?.role.name == 'admin',
      location: state.matchedLocation,
    ),
  );
  ref.onDispose(refresh.dispose);
  ref.onDispose(router.dispose);
  return router;
});

String? _redirectForAuth({
  required AuthSessionPhase phase,
  required bool isAdmin,
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
  if (phase == AuthSessionPhase.signedIn &&
      location.startsWith('/admin') &&
      !isAdmin) {
    return '/';
  }
  return null;
}

@TypedGoRoute<AdminHomeRoute>(path: '/admin')
final class AdminHomeRoute extends GoRouteData with $AdminHomeRoute {
  const AdminHomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminHomeScreen();
  }
}

@TypedGoRoute<AdminAnalyticsRoute>(path: '/admin/analytics')
final class AdminAnalyticsRoute extends GoRouteData with $AdminAnalyticsRoute {
  const AdminAnalyticsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminAnalyticsScreen();
  }
}

@TypedGoRoute<AdminFilesRoute>(path: '/admin/files')
final class AdminFilesRoute extends GoRouteData with $AdminFilesRoute {
  const AdminFilesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminStorageScreen();
  }
}

@TypedGoRoute<AdminUsersRoute>(path: '/admin/users')
final class AdminUsersRoute extends GoRouteData with $AdminUsersRoute {
  const AdminUsersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminUsersScreen();
  }
}

@TypedGoRoute<AdminProvidersRoute>(path: '/admin/providers')
final class AdminProvidersRoute extends GoRouteData with $AdminProvidersRoute {
  const AdminProvidersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminProvidersScreen();
  }
}

@TypedGoRoute<AdminAiProvidersRoute>(path: '/admin/ai-providers')
final class AdminAiProvidersRoute extends GoRouteData
    with $AdminAiProvidersRoute {
  const AdminAiProvidersRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminAiProvidersScreen();
  }
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

@TypedGoRoute<DownloadDetailRoute>(path: '/downloads/:jobId')
final class DownloadDetailRoute extends GoRouteData with $DownloadDetailRoute {
  const DownloadDetailRoute({required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DownloadDetailScreen(jobId: jobId);
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
