import 'dart:convert';

import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'web_redirect_route.g.dart';

@WebRedirectRoute.config
class WebRedirectRoute extends GoRouteData
    with _$WebRedirectRoute, EquatableMixin {
  const WebRedirectRoute({
    required this.$extra,
    this.from,
  });

  factory WebRedirectRoute.from(
    WebRedirect redirect, {
    String? from,
  }) {
    return WebRedirectRoute(
      $extra: jsonEncode(
        switch (redirect) {
          UrlRedirect() => redirect.toJson(),
          HtmlRedirect() => redirect.toJson(),
        },
      ),
      from: from,
    );
  }

  static const config = TypedGoRoute<WebRedirectRoute>(
    path: '/web-redirect',
  );

  final String? from;
  final String $extra;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    WebRedirect redirect;

    try {
      redirect = HtmlRedirect.fromJson(
        jsonDecode($extra) as Map<String, dynamic>,
      );
    } catch (_) {
      redirect = UrlRedirect.fromJson(
        jsonDecode($extra) as Map<String, dynamic>,
      );
    }

    print('restored extra: ${$extra}');

    return MaterialPage(
      fullscreenDialog: true,
      child: WebRedirectPage(
        redirect: redirect,
      ),
    );
  }

  @override
  List<Object?> get props => [
    $extra,
    from,
  ];
}
