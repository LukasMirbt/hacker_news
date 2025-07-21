part of '../../post/route/post_shell_route.dart';

class CommentFormRoute extends GoRouteData
    with _$CommentFormRoute, AuthenticatedRoute {
  const CommentFormRoute({
    required this.postId,
  });

  static const config = TypedGoRoute<CommentFormRoute>(
    path: 'comment',
  );

  final String postId;

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
