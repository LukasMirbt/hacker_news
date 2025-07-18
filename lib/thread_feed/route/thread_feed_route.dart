part of '../../app_shell/route/app_stateful_shell_route.dart';

class ThreadFeedRoute extends GoRouteData
    with _$ThreadFeedRoute, AuthenticatedRoute {
  const ThreadFeedRoute();

  static const config = TypedGoRoute<ThreadFeedRoute>(
    path: '/threads',
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RepositoryProvider(
      create: (context) => ThreadRepository(
        threadApi: context.read<ThreadApi>(),
      ),
      child: const ThreadFeedPage(),
    );
  }
}
