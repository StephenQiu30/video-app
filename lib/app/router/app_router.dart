import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/download/presentation/download_home_screen.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(routes: $appRoutes);
  ref.onDispose(router.dispose);
  return router;
});

@TypedGoRoute<DownloadHomeRoute>(path: '/')
final class DownloadHomeRoute extends GoRouteData with $DownloadHomeRoute {
  const DownloadHomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DownloadHomeScreen();
  }
}
