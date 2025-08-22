part of '../../app_shell/route/app_stateful_shell_route.dart';

class ThemeRoute extends GoRouteData with _$ThemeRoute, EquatableMixin {
  const ThemeRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<ThemeRoute>(
    path: 'theme',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const ThemePage();
  }

  @override
  List<Object> get props => [];
}
