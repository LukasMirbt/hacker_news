part of 'post_shell_route.dart';

class PostRoute extends GoRouteData with _$PostRoute {
  const PostRoute({
    required this.postId,
    this.from,
  });

  static const config = TypedGoRoute<PostRoute>(
    path: '/post/:postId',
    routes: [
      PostOptionsRoute.config,
      CommentFormRoute.config,
      CommentOptionsRoute.config,
    ],
  );

  final String postId;
  final String? from;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return PostPage(id: postId);
  }
}
