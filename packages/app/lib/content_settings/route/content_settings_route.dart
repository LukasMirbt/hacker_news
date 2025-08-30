import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/content_settings/content_settings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContentSettingsRoute extends GoRouteData
    with $ContentSettingsRoute, EquatableMixin {
  const ContentSettingsRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<ContentSettingsRoute>(
    path: 'content',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const ContentSettingsPage();
  }

  @override
  List<Object> get props => [];
}
