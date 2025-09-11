import 'package:app/post/post.dart';
import 'package:app/post_search/post_search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostSearchRoute extends RelativeGoRouteData
    with $PostSearchRoute, EquatableMixin {
  const PostSearchRoute();

  static const config = TypedRelativeGoRoute<PostSearchRoute>(
    path: 'search',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const PostSearchPage();
  }

  @override
  List<Object> get props => [];
}
