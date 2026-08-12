// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$foundationRoute];

RouteBase get $foundationRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $FoundationRoute._fromState,
);

mixin $FoundationRoute on GoRouteData {
  static FoundationRoute _fromState(GoRouterState state) =>
      const FoundationRoute();

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
