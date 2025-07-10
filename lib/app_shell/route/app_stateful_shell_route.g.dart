// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_stateful_shell_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$appStatefulShellRoute];

RouteBase get $appStatefulShellRoute => StatefulShellRouteData.$route(
  factory: $AppStatefulShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',

          factory: _$HomeRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'item/options',

              parentNavigatorKey: FeedItemOptionsRoute.$parentNavigatorKey,

              factory: _$FeedItemOptionsRoute._fromState,
            ),
            ShellRouteData.$route(
              parentNavigatorKey: PostShellRoute.$parentNavigatorKey,
              factory: $PostShellRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':postId',

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
                      path: 'reply/:commentId',

                      factory: _$ReplyFormRoute._fromState,
                    ),
                    GoRouteData.$route(
                      path: ':commentId/options',

                      factory: _$CommentOptionsRoute._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/settings',

          factory: _$SettingsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'licenses',

              parentNavigatorKey: LicenseRoute.$parentNavigatorKey,

              factory: _$LicenseRoute._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $AppStatefulShellRouteExtension on AppStatefulShellRoute {
  static AppStatefulShellRoute _fromState(GoRouterState state) =>
      const AppStatefulShellRoute();
}

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/home');

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

mixin _$FeedItemOptionsRoute on GoRouteData {
  static FeedItemOptionsRoute _fromState(GoRouterState state) =>
      FeedItemOptionsRoute(state.extra as FeedItem);

  FeedItemOptionsRoute get _self => this as FeedItemOptionsRoute;

  @override
  String get location => GoRouteData.$location('/home/item/options');

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

extension $PostShellRouteExtension on PostShellRoute {
  static PostShellRoute _fromState(GoRouterState state) =>
      const PostShellRoute();
}

mixin _$PostRoute on GoRouteData {
  static PostRoute _fromState(GoRouterState state) =>
      PostRoute(postId: state.pathParameters['postId']!);

  PostRoute get _self => this as PostRoute;

  @override
  String get location =>
      GoRouteData.$location('/home/${Uri.encodeComponent(_self.postId)}');

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
    '/home/${Uri.encodeComponent(_self.postId)}/options',
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
    '/home/${Uri.encodeComponent(_self.postId)}/comment',
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

mixin _$ReplyFormRoute on GoRouteData {
  static ReplyFormRoute _fromState(GoRouterState state) => ReplyFormRoute(
    postId: state.pathParameters['postId']!,
    commentId: state.pathParameters['commentId']!,
  );

  ReplyFormRoute get _self => this as ReplyFormRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/${Uri.encodeComponent(_self.postId)}/reply/${Uri.encodeComponent(_self.commentId)}',
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
        commentId: state.pathParameters['commentId']!,
      );

  CommentOptionsRoute get _self => this as CommentOptionsRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/${Uri.encodeComponent(_self.postId)}/${Uri.encodeComponent(_self.commentId)}/options',
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

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

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

mixin _$LicenseRoute on GoRouteData {
  static LicenseRoute _fromState(GoRouterState state) => const LicenseRoute();

  @override
  String get location => GoRouteData.$location('/settings/licenses');

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
