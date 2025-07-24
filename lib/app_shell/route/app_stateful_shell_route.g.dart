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
            ShellRouteData.$route(
              parentNavigatorKey: PostShellRoute.$parentNavigatorKey,
              factory: $PostShellRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'post/:postId',

                  factory: _$PostRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'comment',

                      factory: _$CommentRoute._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'reply',
                      parentNavigatorKey: ReplyRoute.$parentNavigatorKey,

                      factory: _$ReplyRoute._fromState,
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
        ShellRouteData.$route(
          factory: $ThreadFeedShellRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: '/threads',

              factory: _$ThreadFeedRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'reply',
                  parentNavigatorKey: ReplyRoute.$parentNavigatorKey,

                  factory: _$ReplyRoute._fromState,
                ),
                ShellRouteData.$route(
                  parentNavigatorKey: PostShellRoute.$parentNavigatorKey,
                  factory: $PostShellRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'post/:postId',

                      factory: _$PostRoute._fromState,
                      routes: [
                        GoRouteData.$route(
                          path: 'comment',

                          factory: _$CommentRoute._fromState,
                        ),
                        GoRouteData.$route(
                          path: 'reply',
                          parentNavigatorKey: ReplyRoute.$parentNavigatorKey,

                          factory: _$ReplyRoute._fromState,
                        ),
                      ],
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
              path: 'data-collection',

              parentNavigatorKey: DataCollectionRoute.$parentNavigatorKey,

              factory: _$DataCollectionRoute._fromState,
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

  String get location => GoRouteData.$location('/home');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostShellRouteExtension on PostShellRoute {
  static PostShellRoute _fromState(GoRouterState state) =>
      const PostShellRoute();
}

mixin _$PostRoute on GoRouteData {
  static PostRoute _fromState(GoRouterState state) =>
      PostRoute(postId: state.pathParameters['postId']!);

  PostRoute get _self => this as PostRoute;

  String get location =>
      GoRouteData.$location('post/${Uri.encodeComponent(_self.postId)}');

  String get relativeLocation => './$location';

  void goRelative(BuildContext context) => context.go(relativeLocation);

  Future<T?> pushRelative<T>(BuildContext context) =>
      context.push<T>(relativeLocation);

  void pushReplacementRelative(BuildContext context) =>
      context.pushReplacement(relativeLocation);

  void replaceRelative(BuildContext context) =>
      context.replace(relativeLocation);
}

mixin _$CommentRoute on GoRouteData {
  static CommentRoute _fromState(GoRouterState state) =>
      CommentRoute($extra: state.extra as CommentForm);

  CommentRoute get _self => this as CommentRoute;

  String get location => GoRouteData.$location('comment');

  String get relativeLocation => './$location';

  void goRelative(BuildContext context) =>
      context.go(relativeLocation, extra: _self.$extra);

  Future<T?> pushRelative<T>(BuildContext context) =>
      context.push<T>(relativeLocation, extra: _self.$extra);

  void pushReplacementRelative(BuildContext context) =>
      context.pushReplacement(relativeLocation, extra: _self.$extra);

  void replaceRelative(BuildContext context) =>
      context.replace(relativeLocation, extra: _self.$extra);
}

mixin _$ReplyRoute on GoRouteData {
  static ReplyRoute _fromState(GoRouterState state) =>
      ReplyRoute(url: state.uri.queryParameters['url']!);

  ReplyRoute get _self => this as ReplyRoute;

  String get location =>
      GoRouteData.$location('reply', queryParams: {'url': _self.url});

  String get relativeLocation => './$location';

  void goRelative(BuildContext context) => context.go(relativeLocation);

  Future<T?> pushRelative<T>(BuildContext context) =>
      context.push<T>(relativeLocation);

  void pushReplacementRelative(BuildContext context) =>
      context.pushReplacement(relativeLocation);

  void replaceRelative(BuildContext context) =>
      context.replace(relativeLocation);
}

extension $ThreadFeedShellRouteExtension on ThreadFeedShellRoute {
  static ThreadFeedShellRoute _fromState(GoRouterState state) =>
      const ThreadFeedShellRoute();
}

mixin _$ThreadFeedRoute on GoRouteData {
  static ThreadFeedRoute _fromState(GoRouterState state) =>
      const ThreadFeedRoute();

  String get location => GoRouteData.$location('/threads');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location('/settings');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$DataCollectionRoute on GoRouteData {
  static DataCollectionRoute _fromState(GoRouterState state) =>
      const DataCollectionRoute();

  String get location => GoRouteData.$location('/settings/data-collection');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
