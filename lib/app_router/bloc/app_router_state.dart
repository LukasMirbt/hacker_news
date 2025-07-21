import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

part 'app_router_state.freezed.dart';

@freezed
abstract class AppRouterState with _$AppRouterState {
  const factory AppRouterState({
    required GoRouter goRouter,
    @Default([]) List<String> history,
  }) = _AppRouterState;

  factory AppRouterState.initial({
    AppRedirect? appRedirect,
    AppRouteList? appRouteList,
  }) {
    appRedirect ??= const AppRedirect();
    appRouteList ??= AppRouteList();
    return AppRouterState(
      goRouter: GoRouter(
        navigatorKey: navigatorKey,
        initialLocation: initialLocation,
        routes: appRouteList.routes,
        redirect: appRedirect.redirect,
      ),
    );
  }

  const AppRouterState._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static final initialLocation = const HomeRoute().location;

  String get location => history.lastOrNull ?? initialLocation;
}
