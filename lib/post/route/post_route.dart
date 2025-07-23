part of '../../app_shell/route/app_stateful_shell_route.dart';

class PostRoute extends GoRouteData
    with _$PostRoute, AppRelativeRoute, EquatableMixin {
  const PostRoute({
    required this.postId,
  });

  static const config = TypedRelativeGoRoute<PostRoute>(
    path: 'post/:postId',
    routes: [
      CommentFormRoute.config,
      ReplyRoute.config,
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

  @override
  List<Object> get props => [postId];
}
