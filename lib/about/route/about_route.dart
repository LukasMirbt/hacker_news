part of '../../app_shell/route/app_stateful_shell_route.dart';

class AboutRoute extends GoRouteData with _$AboutRoute, EquatableMixin {
  const AboutRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<AboutRoute>(
    path: 'about',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const AboutPage();
  }

  @override
  List<Object> get props => [];
}
