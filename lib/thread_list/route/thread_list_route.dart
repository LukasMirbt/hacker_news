part of '../../app_shell/route/app_stateful_shell_route.dart';

class ThreadRoute extends GoRouteData with _$ThreadRoute, AuthenticatedRoute {
  const ThreadRoute();

  static const config = TypedGoRoute<ThreadRoute>(
    path: '/threads',
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RepositoryProvider(
      create: (context) => ThreadRepository(
        threadApi: context.read<ThreadApi>(),
      ),
      child: const ThreadListPage(),
    );
  }
}
