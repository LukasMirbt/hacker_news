import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginUsernameTextField extends StatelessWidget {
  const LoginUsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TextField(
      textInputAction: TextInputAction.next,
      autocorrect: false,
      autofillHints: const [AutofillHints.username],
      decoration: InputDecoration(
        labelText: l10n.login_usernameLabel,
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(
          LoginUsernameChanged(value),
        );
      },
    );
  }
}
