import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/reply/reply.dart';

part 'reply_route.g.dart';

@ReplyRoute.config
class ReplyRoute extends GoRouteData with _$ReplyRoute, AuthenticatedRoute {
  const ReplyRoute({required this.url});

  static const config = TypedGoRoute<ReplyRoute>(
    path: '/reply',
  );

  final String url;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      fullscreenDialog: true,
      child: ReplyPage(url: url),
    );
  }
}
