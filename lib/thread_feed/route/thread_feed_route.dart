part of '../../app_shell/route/app_stateful_shell_route.dart';

class ThreadFeedRoute extends GoRouteData
    with _$ThreadFeedRoute, AuthenticatedRoute {
  const ThreadFeedRoute();

  static const config = TypedGoRoute<ThreadFeedRoute>(
    path: '/threads',
    routes: [
      ReplyRoute.config,
      PostShellRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThreadFeedPage();
  }
}
