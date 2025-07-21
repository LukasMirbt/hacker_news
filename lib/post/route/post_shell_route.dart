import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:post_repository/post_repository.dart';

part '../../comment_form/route/comment_form_route.dart';
part '../../comment_options/route/comment_options_route.dart';
part '../../post_options/route/post_options_route.dart';
part 'post_route.dart';
part 'post_shell_route.g.dart';

@PostShellRoute.config
class PostShellRoute extends ShellRouteData {
  const PostShellRoute();

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
      ),
      child: navigator,
    );
  }
}
