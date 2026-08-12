import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/foundation/presentation/foundation_screen.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(routes: $appRoutes);
  ref.onDispose(router.dispose);
  return router;
});

@TypedGoRoute<FoundationRoute>(path: '/')
final class FoundationRoute extends GoRouteData with $FoundationRoute {
  const FoundationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FoundationScreen();
  }
}
