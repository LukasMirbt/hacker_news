import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/reply/reply.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReplyRoute extends RelativeGoRouteData
    with $ReplyRoute, AuthenticatedRoute, EquatableMixin {
  const ReplyRoute({required this.url});

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedRelativeGoRoute<ReplyRoute>(
    path: 'reply',
  );

  final String url;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return ReplyPage(url: url);
  }

  @override
  List<Object> get props => [url];
}
