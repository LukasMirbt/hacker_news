import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/login/login.dart';

class LoginPasswordVisibilityButton extends StatelessWidget {
  const LoginPasswordVisibilityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword = context.select(
      (LoginBloc bloc) => bloc.state.form.obscurePassword,
    );

    return IconButton(
      onPressed: () {
        context.read<LoginBloc>().add(
          const LoginPasswordVisibilityToggled(),
        );
      },
      icon: AppIcon(
        obscurePassword
            ? Symbols.visibility_rounded
            : Symbols.visibility_off_rounded,
      ),
    );
  }
}
