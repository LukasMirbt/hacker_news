part of '../../app_shell/route/app_stateful_shell_route.dart';

class ReplyRoute extends RelativeGoRouteData
    with _$ReplyRoute, AuthenticatedRoute, EquatableMixin {
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

  @override
  List<Object> get props => [url];
}
