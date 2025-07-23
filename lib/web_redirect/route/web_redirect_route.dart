import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';

part 'web_redirect_route.g.dart';

@WebRedirectRoute.config
class WebRedirectRoute extends GoRouteData
    with _$WebRedirectRoute, AppAbsoluteRoute, EquatableMixin {
  const WebRedirectRoute({required this.url});

  static const config = TypedGoRoute<WebRedirectRoute>(
    path: '/web-redirect',
  );

  final String url;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      fullscreenDialog: true,
      child: WebRedirectPage(url: url),
    );
  }

  @override
  List<Object> get props => [url];
}
