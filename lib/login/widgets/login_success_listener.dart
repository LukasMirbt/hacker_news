import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/login/login.dart';
import 'package:hacker_client/login_loading/login_loading.dart';

class LoginSuccessListener extends StatelessWidget {
  const LoginSuccessListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          !previous.status.isSuccess && current.status.isSuccess,
      listener: (context, state) {
        LoginLoadingRoute(from: state.from).go(context);
      },
      child: child,
    );
  }
}
