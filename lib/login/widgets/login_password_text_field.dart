import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginPasswordTextField extends StatelessWidget {
  const LoginPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword = context.select(
      (LoginBloc bloc) => bloc.state.form.obscurePassword,
    );

    final l10n = AppLocalizations.of(context);

    final errorText = context.select(
      (LoginBloc bloc) => bloc.state.form.passwordErrorText(l10n),
    );

    return TextField(
      obscureText: obscurePassword,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      decoration: InputDecoration(
        labelText: l10n.login_passwordLabel,
        errorText: errorText,
        suffixIcon: errorText != null
            ? const Icon(Icons.error)
            : const LoginPasswordVisibilityButton(),
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(
          LoginPasswordChanged(value),
        );
      },
      onSubmitted: (_) {
        context.read<LoginBloc>().add(
          const LoginSubmitted(),
        );
      },
    );
  }
}
