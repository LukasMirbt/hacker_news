import 'package:authentication_api/authentication_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:post_repository/post_repository.dart';

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
        commentStorage: context.read<CommentStorage>(),
      ),
      child: navigator,
    );
  }
}
