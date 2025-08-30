import 'package:app/app_router/app_router.dart';
import 'package:app/comment/comment.dart';
import 'package:app/post/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommentRoute extends RelativeGoRouteData
    with $CommentRoute, AuthenticatedRoute, EquatableMixin {
  const CommentRoute();

  static const config = TypedRelativeGoRoute<CommentRoute>(
    path: 'comment',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const CommentPage();
  }

  @override
  List<Object> get props => [];
}
