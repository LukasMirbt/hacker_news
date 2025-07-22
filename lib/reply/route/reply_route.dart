part of '../../app_shell/route/app_stateful_shell_route.dart';

class ReplyRoute extends GoRouteData
    with _$ReplyRoute, AppRelativeRoute, AuthenticatedRoute {
  const ReplyRoute({required this.url});

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedRelativeGoRoute<ReplyRoute>(
    path: 'reply',
  );

  final String url;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      fullscreenDialog: true,
      child: ReplyPage(url: url),
    );
  }
}
