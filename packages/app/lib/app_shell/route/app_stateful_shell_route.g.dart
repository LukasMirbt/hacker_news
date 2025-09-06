// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file

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
          factory: $HomeRoute._fromState,
          routes: [
            ShellRouteData.$route(
              parentNavigatorKey: PostShellRoute.$parentNavigatorKey,
              factory: $PostShellRouteExtension._fromState,
              routes: [
                RelativeGoRouteData.$route(
                  path: 'post/:postId',
                  factory: $PostRoute._fromState,
                  routes: [
                    RelativeGoRouteData.$route(
                      path: 'search',
                      factory: $PostSearchRoute._fromState,
                    ),
                    RelativeGoRouteData.$route(
                      path: 'comment',
                      factory: $CommentRoute._fromState,
                    ),
                    RelativeGoRouteData.$route(
                      path: 'reply',
                      parentNavigatorKey: ReplyRoute.$parentNavigatorKey,
                      factory: $ReplyRoute._fromState,
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
          path: '/search',
          factory: $SearchRoute._fromState,
          routes: [
            ShellRouteData.$route(
              parentNavigatorKey: PostShellRoute.$parentNavigatorKey,
              factory: $PostShellRouteExtension._fromState,
              routes: [
                RelativeGoRouteData.$route(
                  path: 'post/:postId',
                  factory: $PostRoute._fromState,
                  routes: [
                    RelativeGoRouteData.$route(
                      path: 'search',
                      factory: $PostSearchRoute._fromState,
                    ),
                    RelativeGoRouteData.$route(
                      path: 'comment',
                      factory: $CommentRoute._fromState,
                    ),
                    RelativeGoRouteData.$route(
                      path: 'reply',
                      parentNavigatorKey: ReplyRoute.$parentNavigatorKey,
                      factory: $ReplyRoute._fromState,
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
              factory: $ThreadFeedRoute._fromState,
              routes: [
                RelativeGoRouteData.$route(
                  path: 'reply',
                  parentNavigatorKey: ReplyRoute.$parentNavigatorKey,
                  factory: $ReplyRoute._fromState,
                ),
                ShellRouteData.$route(
                  parentNavigatorKey: PostShellRoute.$parentNavigatorKey,
                  factory: $PostShellRouteExtension._fromState,
                  routes: [
                    RelativeGoRouteData.$route(
                      path: 'post/:postId',
                      factory: $PostRoute._fromState,
                      routes: [
                        RelativeGoRouteData.$route(
                          path: 'search',
                          factory: $PostSearchRoute._fromState,
                        ),
                        RelativeGoRouteData.$route(
                          path: 'comment',
                          factory: $CommentRoute._fromState,
                        ),
                        RelativeGoRouteData.$route(
                          path: 'reply',
                          parentNavigatorKey: ReplyRoute.$parentNavigatorKey,
                          factory: $ReplyRoute._fromState,
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
        ShellRouteData.$route(
          factory: $DraftShellRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: '/drafts',
              factory: $DraftRoute._fromState,
              routes: [
                RelativeGoRouteData.$route(
                  path: 'reply',
                  parentNavigatorKey: ReplyRoute.$parentNavigatorKey,
                  factory: $ReplyRoute._fromState,
                ),
                ShellRouteData.$route(
                  parentNavigatorKey: PostShellRoute.$parentNavigatorKey,
                  factory: $PostShellRouteExtension._fromState,
                  routes: [
                    RelativeGoRouteData.$route(
                      path: 'post/:postId',
                      factory: $PostRoute._fromState,
                      routes: [
                        RelativeGoRouteData.$route(
                          path: 'search',
                          factory: $PostSearchRoute._fromState,
                        ),
                        RelativeGoRouteData.$route(
                          path: 'comment',
                          factory: $CommentRoute._fromState,
                        ),
                        RelativeGoRouteData.$route(
                          path: 'reply',
                          parentNavigatorKey: ReplyRoute.$parentNavigatorKey,
                          factory: $ReplyRoute._fromState,
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
          factory: $SettingsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'theme',
              parentNavigatorKey: ThemeRoute.$parentNavigatorKey,
              factory: $ThemeRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'content',
              parentNavigatorKey: ContentSettingsRoute.$parentNavigatorKey,
              factory: $ContentSettingsRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'data-collection',
              parentNavigatorKey: DataCollectionRoute.$parentNavigatorKey,
              factory: $DataCollectionRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'about',
              parentNavigatorKey: AboutRoute.$parentNavigatorKey,
              factory: $AboutRoute._fromState,
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

mixin $HomeRoute on GoRouteData {
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

extension $PostShellRouteExtension on PostShellRoute {
  static PostShellRoute _fromState(GoRouterState state) =>
      const PostShellRoute();
}

mixin $PostRoute on RelativeGoRouteData {
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

mixin $PostSearchRoute on RelativeGoRouteData {
  static PostSearchRoute _fromState(GoRouterState state) =>
      const PostSearchRoute();

  @override
  String get subLocation => RelativeGoRouteData.$location('search');

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

mixin $CommentRoute on RelativeGoRouteData {
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

mixin $SearchRoute on GoRouteData {
  static SearchRoute _fromState(GoRouterState state) => const SearchRoute();

  @override
  String get location => GoRouteData.$location('/search');

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

extension $ThreadFeedShellRouteExtension on ThreadFeedShellRoute {
  static ThreadFeedShellRoute _fromState(GoRouterState state) =>
      const ThreadFeedShellRoute();
}

mixin $ThreadFeedRoute on GoRouteData {
  static ThreadFeedRoute _fromState(GoRouterState state) =>
      const ThreadFeedRoute();

  @override
  String get location => GoRouteData.$location('/threads');

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

extension $DraftShellRouteExtension on DraftShellRoute {
  static DraftShellRoute _fromState(GoRouterState state) =>
      const DraftShellRoute();
}

mixin $DraftRoute on GoRouteData {
  static DraftRoute _fromState(GoRouterState state) => const DraftRoute();

  @override
  String get location => GoRouteData.$location('/drafts');

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

mixin $SettingsRoute on GoRouteData {
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

mixin $ThemeRoute on GoRouteData {
  static ThemeRoute _fromState(GoRouterState state) => const ThemeRoute();

  @override
  String get location => GoRouteData.$location('/settings/theme');

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

mixin $ContentSettingsRoute on GoRouteData {
  static ContentSettingsRoute _fromState(GoRouterState state) =>
      const ContentSettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings/content');

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

mixin $DataCollectionRoute on GoRouteData {
  static DataCollectionRoute _fromState(GoRouterState state) =>
      const DataCollectionRoute();

  @override
  String get location => GoRouteData.$location('/settings/data-collection');

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

mixin $AboutRoute on GoRouteData {
  static AboutRoute _fromState(GoRouterState state) => const AboutRoute();

  @override
  String get location => GoRouteData.$location('/settings/about');

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
