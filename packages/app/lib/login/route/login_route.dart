import 'package:app/create_account/create_account.dart';
import 'package:app/login/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'login_route.g.dart';

@LoginRoute.config
class LoginRoute extends GoRouteData with $LoginRoute, EquatableMixin {
  const LoginRoute({required this.from});

  static const config = TypedGoRoute<LoginRoute>(
    path: '/login',
    routes: [
      CreateAccountRoute.config,
    ],
  );

  final String from;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      restorationId: 'loginPage',
      fullscreenDialog: true,
      child: LoginPage(from: from),
    );
  }

  @override
  List<Object> get props => [from];
}
