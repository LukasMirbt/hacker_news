import 'package:app/about/about.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/content_settings/content_settings.dart';
import 'package:app/data_collection/data_collection.dart';
import 'package:app/settings/settings.dart';
import 'package:app/theme/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsRoute extends GoRouteData with $SettingsRoute, EquatableMixin {
  const SettingsRoute();

  static const config = TypedGoRoute<SettingsRoute>(
    path: '/settings',
    routes: [
      ThemeRoute.config,
      ContentSettingsRoute.config,
      DataCollectionRoute.config,
      AboutRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }

  @override
  List<Object> get props => [];
}
