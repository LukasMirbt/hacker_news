part of '../../app_shell/route/app_stateful_shell_route.dart';

class LicenseRoute extends GoRouteData with _$LicenseRoute {
  const LicenseRoute();

  static const config = TypedGoRoute<LicenseRoute>(
    path: 'licenses',
  );

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const LicensePage();
  }
}
