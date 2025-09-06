// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'reply_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$replyRoute];

RouteBase get $replyRoute => RelativeGoRouteData.$route(
  path: 'reply',
  parentNavigatorKey: ReplyRoute.$parentNavigatorKey,
  factory: $ReplyRoute._fromState,
);

mixin $ReplyRoute on RelativeGoRouteData {
  static ReplyRoute _fromState(GoRouterState state) =>
      ReplyRoute(url: state.uri.queryParameters['url']!);

  ReplyRoute get _self => this as ReplyRoute;

  @override
  String get subLocation =>
      RelativeGoRouteData.$location('reply', queryParams: {'url': _self.url});

  @override
  String get relativeLocation => './$subLocation';

  @override
  void goRelative(BuildContext context) => context.go(relativeLocation);

  @override
  Future<T?> pushRelative<T>(BuildContext context) =>
      context.push<T>(relativeLocation);

  @override
  void pushReplacementRelative(BuildContext context) =>
      context.pushReplacement(relativeLocation);

  @override
  void replaceRelative(BuildContext context) =>
      context.replace(relativeLocation);
}
