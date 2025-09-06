import 'package:app/l10n/l10n.dart';
import 'package:app/login/login.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (LoginBloc bloc) => bloc.state.form.isLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.expand(
      isLoading: isLoading,
      onPressed: () {
        context.read<LoginBloc>().add(
          const LoginSubmitted(),
        );
      },
      child: Text(l10n.login_submitAction),
    );
  }
}
