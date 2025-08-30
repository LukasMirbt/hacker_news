// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'logout_loading_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$logoutLoadingRoute];

RouteBase get $logoutLoadingRoute => GoRouteData.$route(
  path: '/logout-loading',
  factory: $LogoutLoadingRoute._fromState,
);

mixin $LogoutLoadingRoute on GoRouteData {
  static LogoutLoadingRoute _fromState(GoRouterState state) =>
      const LogoutLoadingRoute();

  @override
  String get location => GoRouteData.$location('/logout-loading');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
