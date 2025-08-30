import 'package:app/web_redirect/web_redirect.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'web_redirect_route.g.dart';

@WebRedirectRoute.config
class WebRedirectRoute extends GoRouteData
    with $WebRedirectRoute, EquatableMixin {
  const WebRedirectRoute({
    required this.url,
    this.from,
  });

  static const config = TypedGoRoute<WebRedirectRoute>(
    path: '/web-redirect',
  );

  final String url;
  final String? from;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    final state = context.read<AuthenticationRepository>().state;
    return MaterialPage(
      fullscreenDialog: true,
      child: WebRedirectPage(
        url: url,
        html: state.webRedirect.html,
      ),
    );
  }

  @override
  List<Object?> get props => [
    url,
    from,
  ];
}
