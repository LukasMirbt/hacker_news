part of '../../app_shell/route/app_stateful_shell_route.dart';

class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  static const config = TypedGoRoute<HomeRoute>(
    path: '/home',
    routes: [
      FeedItemOptionsRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
