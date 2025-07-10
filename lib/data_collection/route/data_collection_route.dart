part of '../../app_shell/route/app_stateful_shell_route.dart';

class DataCollectionRoute extends GoRouteData with _$DataCollectionRoute {
  const DataCollectionRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<DataCollectionRoute>(
    path: 'data-collection',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const DataCollectionPage();
  }
}
