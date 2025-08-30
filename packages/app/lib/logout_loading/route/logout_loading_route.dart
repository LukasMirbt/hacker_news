import 'package:app/logout_loading/logout_loading.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'logout_loading_route.g.dart';

@LogoutLoadingRoute.config
class LogoutLoadingRoute extends GoRouteData
    with $LogoutLoadingRoute, EquatableMixin {
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

  @override
  List<Object> get props => [];
}
