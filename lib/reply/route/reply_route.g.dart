// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$replyRoute];

RouteBase get $replyRoute =>
    GoRouteData.$route(path: '/reply', factory: _$ReplyRoute._fromState);

mixin _$ReplyRoute on GoRouteData {
  static ReplyRoute _fromState(GoRouterState state) =>
      ReplyRoute(url: state.uri.queryParameters['url']!);

  ReplyRoute get _self => this as ReplyRoute;

  @override
  String get location =>
      GoRouteData.$location('/reply', queryParams: {'url': _self.url});

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
