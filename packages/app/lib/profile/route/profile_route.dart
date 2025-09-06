import 'package:app/profile/profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'profile_route.g.dart';

@ProfileRoute.config
class ProfileRoute extends GoRouteData with $ProfileRoute, EquatableMixin {
  const ProfileRoute({
    required this.id,
  });

  static const config = TypedGoRoute<ProfileRoute>(
    path: '/profile/:id',
  );

  final String id;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      fullscreenDialog: true,
      child: ProfilePage(id: id),
    );
  }

  @override
  List<Object> get props => [id];
}
