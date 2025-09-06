import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/drafts/drafts.dart';
import 'package:app/post/post.dart';
import 'package:app/reply/reply.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DraftRoute extends GoRouteData
    with $DraftRoute, AuthenticatedRoute, EquatableMixin {
  const DraftRoute();

  static const config = TypedGoRoute<DraftRoute>(
    path: '/drafts',
    routes: [
      ReplyRoute.config,
      PostShellRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DraftPage();
  }

  @override
  List<Object> get props => [];
}
