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
                  path: 'item/options',

                  parentNavigatorKey:
                      ThreadItemOptionsRoute.$parentNavigatorKey,

                  factory: _$ThreadItemOptionsRoute._fromState,
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
      FeedItemOptionsRoute($extra: state.extra as FeedItem);

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

extension $ThreadFeedShellRouteExtension on ThreadFeedShellRoute {
  static ThreadFeedShellRoute _fromState(GoRouterState state) =>
      const ThreadFeedShellRoute();
}

mixin _$ThreadFeedRoute on GoRouteData {
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

mixin _$ThreadItemOptionsRoute on GoRouteData {
  static ThreadItemOptionsRoute _fromState(GoRouterState state) =>
      ThreadItemOptionsRoute($extra: state.extra as ThreadFeedItem);

  ThreadItemOptionsRoute get _self => this as ThreadItemOptionsRoute;

  @override
  String get location => GoRouteData.$location('/threads/item/options');

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

mixin _$DataCollectionRoute on GoRouteData {
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
