part of '../../app_shell/route/app_stateful_shell_route.dart';

class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  static const config = TypedGoRoute<HomeRoute>(
    path: '/home',
    routes: [
      PostShellRoute.config,
    ],
  );

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      restorationId: 'home_route52345234324',
      child: HomePage(),
    );
  }
}
