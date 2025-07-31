// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_error_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$networkErrorRoute];

RouteBase get $networkErrorRoute => GoRouteData.$route(
  path: '/network-error',

  factory: _$NetworkErrorRoute._fromState,
);

mixin _$NetworkErrorRoute on GoRouteData {
  static NetworkErrorRoute _fromState(GoRouterState state) =>
      NetworkErrorRoute(from: state.uri.queryParameters['from']!);

  NetworkErrorRoute get _self => this as NetworkErrorRoute;

  String get location => GoRouteData.$location(
    '/network-error',
    queryParams: {'from': _self.from},
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
