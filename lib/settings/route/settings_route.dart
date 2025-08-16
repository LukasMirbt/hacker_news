part of '../../app_shell/route/app_stateful_shell_route.dart';

class SettingsRoute extends GoRouteData with _$SettingsRoute, EquatableMixin {
  const SettingsRoute();

  static const config = TypedGoRoute<SettingsRoute>(
    path: '/settings',
    routes: [
      ThemeRoute.config,
      DataCollectionRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }

  @override
  List<Object> get props => [];
}
