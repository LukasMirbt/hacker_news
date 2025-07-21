// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_shell_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$postShellRoute];

RouteBase get $postShellRoute => ShellRouteData.$route(
  factory: $PostShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/post/:postId',

      factory: _$PostRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'options',

          factory: _$PostOptionsRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'comment',

          factory: _$CommentFormRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'comment/options',

          factory: _$CommentOptionsRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $PostShellRouteExtension on PostShellRoute {
  static PostShellRoute _fromState(GoRouterState state) =>
      const PostShellRoute();
}

mixin _$PostRoute on GoRouteData {
  static PostRoute _fromState(GoRouterState state) => PostRoute(
    postId: state.pathParameters['postId']!,
    from: state.uri.queryParameters['from'],
  );

  PostRoute get _self => this as PostRoute;

  @override
  String get location => GoRouteData.$location(
    '/post/${Uri.encodeComponent(_self.postId)}',
    queryParams: {if (_self.from != null) 'from': _self.from},
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

mixin _$PostOptionsRoute on GoRouteData {
  static PostOptionsRoute _fromState(GoRouterState state) =>
      PostOptionsRoute(postId: state.pathParameters['postId']!);

  PostOptionsRoute get _self => this as PostOptionsRoute;

  @override
  String get location => GoRouteData.$location(
    '/post/${Uri.encodeComponent(_self.postId)}/options',
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

mixin _$CommentFormRoute on GoRouteData {
  static CommentFormRoute _fromState(GoRouterState state) =>
      CommentFormRoute(postId: state.pathParameters['postId']!);

  CommentFormRoute get _self => this as CommentFormRoute;

  @override
  String get location => GoRouteData.$location(
    '/post/${Uri.encodeComponent(_self.postId)}/comment',
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

mixin _$CommentOptionsRoute on GoRouteData {
  static CommentOptionsRoute _fromState(GoRouterState state) =>
      CommentOptionsRoute(
        postId: state.pathParameters['postId']!,
        $extra: state.extra as Comment,
      );

  CommentOptionsRoute get _self => this as CommentOptionsRoute;

  @override
  String get location => GoRouteData.$location(
    '/post/${Uri.encodeComponent(_self.postId)}/comment/options',
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
