// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $downloadHomeRoute,
  $downloadDetailRoute,
  $loginRoute,
  $sessionRestoreRoute,
  $registerRoute,
];

RouteBase get $downloadHomeRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $DownloadHomeRoute._fromState,
);

mixin $DownloadHomeRoute on GoRouteData {
  static DownloadHomeRoute _fromState(GoRouterState state) =>
      const DownloadHomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $downloadDetailRoute => GoRouteData.$route(
  path: '/downloads/:jobId',
  hasOverriddenOnExit: false,
  factory: $DownloadDetailRoute._fromState,
);

mixin $DownloadDetailRoute on GoRouteData {
  static DownloadDetailRoute _fromState(GoRouterState state) =>
      DownloadDetailRoute(jobId: state.pathParameters['jobId']!);

  DownloadDetailRoute get _self => this as DownloadDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/downloads/${Uri.encodeComponent(_self.jobId)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/auth/login',
  hasOverriddenOnExit: false,
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/auth/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $sessionRestoreRoute => GoRouteData.$route(
  path: '/auth/restoring',
  hasOverriddenOnExit: false,
  factory: $SessionRestoreRoute._fromState,
);

mixin $SessionRestoreRoute on GoRouteData {
  static SessionRestoreRoute _fromState(GoRouterState state) =>
      const SessionRestoreRoute();

  @override
  String get location => GoRouteData.$location('/auth/restoring');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
  path: '/auth/register',
  hasOverriddenOnExit: false,
  factory: $RegisterRoute._fromState,
);

mixin $RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location('/auth/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
