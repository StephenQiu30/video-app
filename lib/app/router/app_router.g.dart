// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$downloadHomeRoute];

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
