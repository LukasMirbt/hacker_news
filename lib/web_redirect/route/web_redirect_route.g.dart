// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_redirect_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$webRedirectRoute];

RouteBase get $webRedirectRoute => GoRouteData.$route(
  path: '/web-redirect',

  factory: _$WebRedirectRoute._fromState,
);

mixin _$WebRedirectRoute on GoRouteData {
  static WebRedirectRoute _fromState(GoRouterState state) =>
      WebRedirectRoute(url: state.uri.queryParameters['url']!);

  WebRedirectRoute get _self => this as WebRedirectRoute;

  String get location =>
      GoRouteData.$location('/web-redirect', queryParams: {'url': _self.url});

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
