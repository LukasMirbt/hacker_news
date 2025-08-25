part of '../../app_shell/route/app_stateful_shell_route.dart';

class SearchWebRedirectRoute extends GoRouteData
    with _$SearchWebRedirectRoute, EquatableMixin {
  const SearchWebRedirectRoute({
    required this.search,
    this.from,
  });

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<SearchWebRedirectRoute>(
    path: 'search-web-redirect',
  );

  final String search;
  final String? from;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      child: SearchWebRedirectPage(
        search: search,
      ),
    );
  }

  @override
  List<Object?> get props => [
    search,
    from,
  ];
}
