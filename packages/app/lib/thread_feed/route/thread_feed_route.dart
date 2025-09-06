import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/post/post.dart';
import 'package:app/reply/reply.dart';
import 'package:app/thread_feed/thread_feed.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThreadFeedRoute extends GoRouteData
    with $ThreadFeedRoute, AuthenticatedRoute, EquatableMixin {
  const ThreadFeedRoute();

  static const config = TypedGoRoute<ThreadFeedRoute>(
    path: '/threads',
    routes: [
      ReplyRoute.config,
      PostShellRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThreadFeedPage();
  }

  @override
  List<Object> get props => [];
}
