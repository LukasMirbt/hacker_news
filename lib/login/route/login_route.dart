import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/login/login.dart';

part 'login_route.g.dart';

@LoginRoute.config
class LoginRoute extends GoRouteData with _$LoginRoute {
  const LoginRoute({required this.from});

  static const config = TypedGoRoute<LoginRoute>(
    path: '/login',
  );

  final String from;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      fullscreenDialog: true,
      child: LoginPage(from: from),
    );
  }
}
