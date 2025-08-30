import 'package:app/app_shell/app_shell.dart';
import 'package:app/home/home.dart';
import 'package:app/post/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeRoute extends GoRouteData with $HomeRoute, EquatableMixin {
  const HomeRoute();

  static const config = TypedGoRoute<HomeRoute>(
    path: '/home',
    routes: [
      PostShellRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }

  @override
  List<Object> get props => [];
}
