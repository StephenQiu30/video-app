// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $adminHomeRoute,
  $adminAnalyticsRoute,
  $adminFilesRoute,
  $adminUsersRoute,
  $adminProvidersRoute,
  $adminAiProvidersRoute,
  $downloadHomeRoute,
  $downloadDetailRoute,
  $documentDetailRoute,
  $loginRoute,
  $sessionRestoreRoute,
  $registerRoute,
];

RouteBase get $adminHomeRoute => GoRouteData.$route(
  path: '/admin',
  hasOverriddenOnExit: false,
  factory: $AdminHomeRoute._fromState,
);

mixin $AdminHomeRoute on GoRouteData {
  static AdminHomeRoute _fromState(GoRouterState state) =>
      const AdminHomeRoute();

  @override
  String get location => GoRouteData.$location('/admin');

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

RouteBase get $adminAnalyticsRoute => GoRouteData.$route(
  path: '/admin/analytics',
  hasOverriddenOnExit: false,
  factory: $AdminAnalyticsRoute._fromState,
);

mixin $AdminAnalyticsRoute on GoRouteData {
  static AdminAnalyticsRoute _fromState(GoRouterState state) =>
      const AdminAnalyticsRoute();

  @override
  String get location => GoRouteData.$location('/admin/analytics');

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

RouteBase get $adminFilesRoute => GoRouteData.$route(
  path: '/admin/files',
  hasOverriddenOnExit: false,
  factory: $AdminFilesRoute._fromState,
);

mixin $AdminFilesRoute on GoRouteData {
  static AdminFilesRoute _fromState(GoRouterState state) =>
      const AdminFilesRoute();

  @override
  String get location => GoRouteData.$location('/admin/files');

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

RouteBase get $adminUsersRoute => GoRouteData.$route(
  path: '/admin/users',
  hasOverriddenOnExit: false,
  factory: $AdminUsersRoute._fromState,
);

mixin $AdminUsersRoute on GoRouteData {
  static AdminUsersRoute _fromState(GoRouterState state) =>
      const AdminUsersRoute();

  @override
  String get location => GoRouteData.$location('/admin/users');

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

RouteBase get $adminProvidersRoute => GoRouteData.$route(
  path: '/admin/providers',
  hasOverriddenOnExit: false,
  factory: $AdminProvidersRoute._fromState,
);

mixin $AdminProvidersRoute on GoRouteData {
  static AdminProvidersRoute _fromState(GoRouterState state) =>
      const AdminProvidersRoute();

  @override
  String get location => GoRouteData.$location('/admin/providers');

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

RouteBase get $adminAiProvidersRoute => GoRouteData.$route(
  path: '/admin/ai-providers',
  hasOverriddenOnExit: false,
  factory: $AdminAiProvidersRoute._fromState,
);

mixin $AdminAiProvidersRoute on GoRouteData {
  static AdminAiProvidersRoute _fromState(GoRouterState state) =>
      const AdminAiProvidersRoute();

  @override
  String get location => GoRouteData.$location('/admin/ai-providers');

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

RouteBase get $documentDetailRoute => GoRouteData.$route(
  path: '/documents/:documentId',
  hasOverriddenOnExit: false,
  factory: $DocumentDetailRoute._fromState,
);

mixin $DocumentDetailRoute on GoRouteData {
  static DocumentDetailRoute _fromState(GoRouterState state) =>
      DocumentDetailRoute(documentId: state.pathParameters['documentId']!);

  DocumentDetailRoute get _self => this as DocumentDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/documents/${Uri.encodeComponent(_self.documentId)}',
  );

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
