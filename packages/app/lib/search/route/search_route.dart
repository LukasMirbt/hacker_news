part of '../../app_shell/route/app_stateful_shell_route.dart';

class SearchRoute extends GoRouteData with _$SearchRoute, EquatableMixin {
  const SearchRoute();

  static const config = TypedGoRoute<SearchRoute>(
    path: '/search',
    routes: [
      PostShellRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }

  @override
  List<Object> get props => [];
}
