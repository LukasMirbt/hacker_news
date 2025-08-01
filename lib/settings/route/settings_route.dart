part of '../../app_shell/route/app_stateful_shell_route.dart';

class SettingsRoute extends GoRouteData with _$SettingsRoute {
  const SettingsRoute();

  static const config = TypedGoRoute<SettingsRoute>(
    path: '/settings',
    routes: [
      DataCollectionRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}
