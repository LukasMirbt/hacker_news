// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

part of 'post_shell_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$postShellRoute];

RouteBase get $postShellRoute => ShellRouteData.$route(
  parentNavigatorKey: PostShellRoute.$parentNavigatorKey,
  factory: $PostShellRouteExtension._fromState,
  routes: [
    RelativeGoRouteData.$route(
      path: 'post/:postId',
      factory: _$PostRoute._fromState,
      routes: [
        RelativeGoRouteData.$route(
          path: 'comment',
          factory: _$CommentRoute._fromState,
        ),
        RelativeGoRouteData.$route(
          path: 'reply',
          parentNavigatorKey: ReplyRoute.$parentNavigatorKey,
          factory: _$ReplyRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $PostShellRouteExtension on PostShellRoute {
  static PostShellRoute _fromState(GoRouterState state) =>
      const PostShellRoute();
}

mixin _$PostRoute on RelativeGoRouteData {
  static PostRoute _fromState(GoRouterState state) =>
      PostRoute(postId: state.pathParameters['postId']!);

  PostRoute get _self => this as PostRoute;

  @override
  String get subLocation => RelativeGoRouteData.$location(
    'post/${Uri.encodeComponent(_self.postId)}',
  );

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

mixin _$CommentRoute on RelativeGoRouteData {
  static CommentRoute _fromState(GoRouterState state) => const CommentRoute();

  @override
  String get subLocation => RelativeGoRouteData.$location('comment');

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

mixin _$ReplyRoute on RelativeGoRouteData {
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
