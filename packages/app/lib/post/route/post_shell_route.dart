import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:authentication_api/authentication_api.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_repository/post_repository.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

class PostShellRoute extends ShellRouteData {
  const PostShellRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedShellRoute<PostShellRoute>(
    routes: [
      PostRoute.config,
    ],
  );

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return RepositoryProvider(
      create: (context) => PostRepository(
        postApi: context.read<PostApi>(),
        authenticationApi: context.read<AuthenticationApi>(),
        draftStorage: context.read<DraftStorage>(),
        visitedPostStorage: context.read<VisitedPostStorage>(),
      ),
      child: navigator,
    );
  }
}
