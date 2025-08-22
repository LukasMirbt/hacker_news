// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


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

  @override
  String get location => GoRouteData.$location(
    '/login-loading',
    queryParams: {'from': _self.from},
  );

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
