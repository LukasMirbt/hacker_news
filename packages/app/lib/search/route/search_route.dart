import 'package:app/app_shell/app_shell.dart';
import 'package:app/post/post.dart';
import 'package:app/search/search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchRoute extends GoRouteData with $SearchRoute, EquatableMixin {
  const SearchRoute();

  static const config = TypedGoRoute<SearchRoute>(
    path: '/search',
    routes: [
      PostShellRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }

  @override
  List<Object> get props => [];
}
