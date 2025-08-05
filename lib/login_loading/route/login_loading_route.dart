import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/login_loading/login_loading.dart';

part 'login_loading_route.g.dart';

@LoginLoadingRoute.config
class LoginLoadingRoute extends GoRouteData
    with _$LoginLoadingRoute, EquatableMixin {
  const LoginLoadingRoute({required this.from});

  static const config = TypedGoRoute<LoginLoadingRoute>(
    path: '/login-loading',
  );

  final String from;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return NoTransitionPage(
      child: LoginLoadingPage(from: from),
    );
  }

  @override
  List<Object> get props => [from];
}
