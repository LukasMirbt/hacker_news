import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/logout_loading/logout_loading.dart';

part 'logout_loading_route.g.dart';

@LogoutLoadingRoute.config
class LogoutLoadingRoute extends GoRouteData with _$LogoutLoadingRoute {
  const LogoutLoadingRoute();

  static const config = TypedGoRoute<LogoutLoadingRoute>(
    path: '/logout-loading',
  );

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const NoTransitionPage(
      child: LogoutLoadingPage(),
    );
  }
}
