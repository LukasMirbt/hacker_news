// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$loginRoute];

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',

  factory: _$LoginRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'create-account',

      factory: _$CreateAccountRoute._fromState,
    ),
  ],
);

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) =>
      LoginRoute(from: state.uri.queryParameters['from']!);

  LoginRoute get _self => this as LoginRoute;

  String get location =>
      GoRouteData.$location('/login', queryParams: {'from': _self.from});

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$CreateAccountRoute on GoRouteData {
  static CreateAccountRoute _fromState(GoRouterState state) =>
      CreateAccountRoute(from: state.uri.queryParameters['from']!);

  CreateAccountRoute get _self => this as CreateAccountRoute;

  String get location => GoRouteData.$location(
    '/login/create-account',
    queryParams: {'from': _self.from},
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
