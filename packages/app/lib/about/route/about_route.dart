import 'package:app/about/about.dart';
import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutRoute extends GoRouteData with $AboutRoute, EquatableMixin {
  const AboutRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<AboutRoute>(
    path: 'about',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const AboutPage();
  }

  @override
  List<Object> get props => [];
}
