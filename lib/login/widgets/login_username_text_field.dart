import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginUsernameTextField extends StatelessWidget {
  const LoginUsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final errorText = context.select(
      (LoginBloc bloc) => bloc.state.form.usernameErrorText(l10n),
    );

    return TextField(
      restorationId: 'login_username_text_field',
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.username],
      decoration: InputDecoration(
        labelText: l10n.login_usernameLabel,
        errorText: errorText,
        suffixIcon: errorText != null
            ? const AppIcon.filled(Symbols.error_rounded)
            : null,
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(
          LoginUsernameChanged(value),
        );
      },
    );
  }
}
