part of '../../app_shell/route/app_stateful_shell_route.dart';

class ReplyFormRoute extends GoRouteData
    with _$ReplyFormRoute, AuthenticatedRoute {
  const ReplyFormRoute({
    required this.postId,
    required this.commentId,
  });

  static const config = TypedGoRoute<ReplyFormRoute>(
    path: 'reply/:commentId',
  );

  final String postId;
  final String commentId;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      fullscreenDialog: true,
      child: ReplyFormPage(commentId: commentId),
    );
  }
}
