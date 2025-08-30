import 'package:app/comment/comment.dart';
import 'package:app/post/post.dart';
import 'package:app/reply/reply.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'post_route.g.dart';

@PostRoute.config
class PostRoute extends RelativeGoRouteData with $PostRoute, EquatableMixin {
  const PostRoute({
    required this.postId,
  });

  static const config = TypedRelativeGoRoute<PostRoute>(
    path: 'post/:postId',
    routes: [
      CommentRoute.config,
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
