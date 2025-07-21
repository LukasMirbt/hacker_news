part of '../../post/route/post_shell_route.dart';

class CommentOptionsRoute extends GoRouteData with _$CommentOptionsRoute {
  const CommentOptionsRoute({
    required this.postId,
    required this.$extra,
  });

  static const config = TypedGoRoute<CommentOptionsRoute>(
    path: 'comment/options',
  );

  final String postId;
  final Comment $extra;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return ModalBottomSheetPage(
      showDragHandle: true,
      builder: (_) => CommentOptionsSheet(comment: $extra),
    );
  }
}
