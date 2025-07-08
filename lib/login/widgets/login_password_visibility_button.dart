import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/login/login.dart';

class LoginPasswordVisibilityButton extends StatelessWidget {
  const LoginPasswordVisibilityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword = context.select(
      (LoginBloc bloc) => bloc.state.obscurePassword,
    );

    return IconButton(
      onPressed: () {
        context.read<LoginBloc>().add(
          const LoginPasswordVisibilityToggled(),
        );
      },
      icon: Icon(
        obscurePassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
      ),
    );
  }
}
