part of '../../app_shell/route/app_stateful_shell_route.dart';

class LicenseRoute extends GoRouteData with _$LicenseRoute {
  const LicenseRoute();

  static final $parentNavigatorKey = AppRouterState.navigatorKey;

  static const config = TypedGoRoute<LicenseRoute>(
    path: 'licenses',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const LicensePage();
  }
}
