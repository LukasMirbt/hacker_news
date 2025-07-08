part of '../../app_shell/route/app_stateful_shell_route.dart';

class CommentOptionsRoute extends GoRouteData with _$CommentOptionsRoute {
  const CommentOptionsRoute({
    required this.postId,
    required this.commentId,
  });

  static const config = TypedGoRoute<CommentOptionsRoute>(
    path: ':commentId/options',
  );

  final String postId;
  final String commentId;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return ModalBottomSheetPage(
      showDragHandle: true,
      builder: (_) => CommentOptionsSheet(commentId: commentId),
    );
  }
}
