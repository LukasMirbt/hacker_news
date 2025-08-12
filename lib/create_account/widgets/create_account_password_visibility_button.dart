import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/create_account/create_account.dart';

class CreateAccountPasswordVisibilityButton extends StatelessWidget {
  const CreateAccountPasswordVisibilityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword = context.select(
      (CreateAccountBloc bloc) => bloc.state.form.obscurePassword,
    );

    return IconButton(
      onPressed: () {
        context.read<CreateAccountBloc>().add(
          const CreateAccountPasswordVisibilityToggled(),
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
