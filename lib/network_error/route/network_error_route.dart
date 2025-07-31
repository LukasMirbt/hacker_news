import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/network_error/network_error.dart';

part 'network_error_route.g.dart';

@NetworkErrorRoute.config
class NetworkErrorRoute extends GoRouteData
    with _$NetworkErrorRoute, AppAbsoluteRoute, EquatableMixin {
  const NetworkErrorRoute({required this.from});

  static const config = TypedGoRoute<NetworkErrorRoute>(
    path: '/network-error',
  );

  final String from;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      fullscreenDialog: true,
      child: NetworkErrorPage(from: from),
    );
  }

  @override
  List<Object> get props => [from];
}
