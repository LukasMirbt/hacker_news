import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/theme/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThemeRoute extends GoRouteData with $ThemeRoute, EquatableMixin {
  const ThemeRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<ThemeRoute>(
    path: 'theme',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const ThemePage();
  }

  @override
  List<Object> get props => [];
}
