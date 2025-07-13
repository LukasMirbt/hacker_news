import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class AppRouter {
  AppRouter({
    AppRedirect? appRedirect,
    AppRouteList? appRouteList,
  }) : _appRedirect = appRedirect ?? const AppRedirect(),
       _appRouteList = appRouteList ?? AppRouteList();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static final initialLocation = const HomeRoute().location;

  final AppRedirect _appRedirect;
  final AppRouteList _appRouteList;

  late final goRouter = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: initialLocation,
    routes: _appRouteList.routes,
    redirect: _appRedirect.redirect,
  );
}
