part of '../../app_shell/route/app_stateful_shell_route.dart';

class ReplyRoute extends GoRouteData
    with _$ReplyRoute, AppRelativeRoute, AuthenticatedRoute, EquatableMixin {
  const ReplyRoute({
    required this.url,
    this.$extra,
  });

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedRelativeGoRoute<ReplyRoute>(
    path: 'reply',
  );

  final String url;
  final Comment? $extra;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      child: ReplyPage(
        url: url,
        parent: $extra,
      ),
    );
  }

  @override
  List<Object> get props => [url];
}
