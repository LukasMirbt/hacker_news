import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/models/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/login_loading/login_loading.dart';

class LoginSuccessListener extends StatelessWidget {
  const LoginSuccessListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) =>
          !previous.status.isAuthenticated && current.status.isAuthenticated,
      listener: (context, state) {
        AppRouter.of(context).go(
          LoginLoadingRoute(from: state.from),
        );
      },
      child: child,
    );
  }
}
