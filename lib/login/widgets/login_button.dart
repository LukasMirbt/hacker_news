import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (LoginBloc bloc) => bloc.state.isLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.expand(
      isLoading: isLoading,
      onPressed: () {
        context.read<LoginBloc>().add(
          const LoginSubmitted(),
        );
      },
      child: Text(l10n.login_loginAction),
    );
  }
}
