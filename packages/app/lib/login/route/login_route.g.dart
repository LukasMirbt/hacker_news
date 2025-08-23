// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

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

  @override
  String get location =>
      GoRouteData.$location('/login', queryParams: {'from': _self.from});

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

mixin _$CreateAccountRoute on GoRouteData {
  static CreateAccountRoute _fromState(GoRouterState state) =>
      CreateAccountRoute(from: state.uri.queryParameters['from']!);

  CreateAccountRoute get _self => this as CreateAccountRoute;

  @override
  String get location => GoRouteData.$location(
    '/login/create-account',
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
