import 'package:app/create_account/create_account.dart';
import 'package:app/login/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountRoute extends GoRouteData
    with $CreateAccountRoute, EquatableMixin {
  const CreateAccountRoute({required this.from});

  static const config = TypedGoRoute<CreateAccountRoute>(
    path: 'create-account',
  );

  final String from;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return CreateAccountPage(from: from);
  }

  @override
  List<Object> get props => [from];
}
