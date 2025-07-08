part of '../../app_shell/route/app_stateful_shell_route.dart';

class PostRoute extends GoRouteData with _$PostRoute {
  const PostRoute({
    required this.postId,
  });

  static const config = TypedGoRoute<PostRoute>(
    path: ':postId',
    routes: [
      PostOptionsRoute.config,
      CommentFormRoute.config,
      ReplyFormRoute.config,
      CommentOptionsRoute.config,
    ],
  );

  final String postId;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return PostPage(id: postId);
  }
}
