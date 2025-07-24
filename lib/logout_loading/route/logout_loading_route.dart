import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/logout_loading/logout_loading.dart';

part 'logout_loading_route.g.dart';

@LogoutLoadingRoute.config
class LogoutLoadingRoute extends GoRouteData
    with _$LogoutLoadingRoute, AppAbsoluteRoute, EquatableMixin {
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
