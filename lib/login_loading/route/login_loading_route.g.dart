// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_loading_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$loginLoadingRoute];

RouteBase get $loginLoadingRoute => GoRouteData.$route(
  path: '/login-loading',

  factory: _$LoginLoadingRoute._fromState,
);

mixin _$LoginLoadingRoute on GoRouteData {
  static LoginLoadingRoute _fromState(GoRouterState state) =>
      LoginLoadingRoute(from: state.uri.queryParameters['from']!);

  LoginLoadingRoute get _self => this as LoginLoadingRoute;

  String get location => GoRouteData.$location(
    '/login-loading',
    queryParams: {'from': _self.from},
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
