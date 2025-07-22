part of '../../app_shell/route/app_stateful_shell_route.dart';

class CommentFormRoute extends GoRouteData
    with _$CommentFormRoute, AppRelativeRoute, AuthenticatedRoute {
  const CommentFormRoute();

  static const config = TypedRelativeGoRoute<CommentFormRoute>(
    path: 'comment',
  );

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return const MaterialPage(
      fullscreenDialog: true,
      child: CommentFormPage(),
    );
  }
}
