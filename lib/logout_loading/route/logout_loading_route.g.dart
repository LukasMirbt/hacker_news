// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_loading_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$logoutLoadingRoute];

RouteBase get $logoutLoadingRoute => GoRouteData.$route(
  path: '/logout-loading',

  factory: _$LogoutLoadingRoute._fromState,
);

mixin _$LogoutLoadingRoute on GoRouteData {
  static LogoutLoadingRoute _fromState(GoRouterState state) =>
      const LogoutLoadingRoute();

  String get location => GoRouteData.$location('/logout-loading');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
