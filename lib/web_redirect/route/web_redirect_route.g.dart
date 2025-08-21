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
  static WebRedirectRoute _fromState(GoRouterState state) => WebRedirectRoute(
    url: state.uri.queryParameters['url']!,
    from: state.uri.queryParameters['from'],
    $extra: state.extra as String?,
  );

  WebRedirectRoute get _self => this as WebRedirectRoute;

  @override
  String get location => GoRouteData.$location(
    '/web-redirect',
    queryParams: {'url': _self.url, if (_self.from != null) 'from': _self.from},
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}
