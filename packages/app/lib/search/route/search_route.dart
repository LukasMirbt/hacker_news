part of '../../app_shell/route/app_stateful_shell_route.dart';

class SearchRoute extends GoRouteData with _$SearchRoute, EquatableMixin {
  const SearchRoute();

  // TODO: Fix navigation bug when going to search, pressing Home button in webview,
  // going to a post and then going to a comment.

  // TODO: Fix going to comments from /search/post

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
