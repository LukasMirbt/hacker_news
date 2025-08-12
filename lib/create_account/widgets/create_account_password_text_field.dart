import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CreateAccountPasswordTextField extends StatelessWidget {
  const CreateAccountPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final obscurePassword = context.select(
      (CreateAccountBloc bloc) => bloc.state.form.obscurePassword,
    );

    final l10n = AppLocalizations.of(context);

    final errorText = context.select(
      (CreateAccountBloc bloc) => bloc.state.form.passwordErrorText(l10n),
    );

    return TextField(
      obscureText: obscurePassword,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.newPassword],
      decoration: InputDecoration(
        labelText: l10n.createAccount_passwordLabel,
        errorText: errorText,
        suffixIcon: errorText != null
            ? const AppIcon.filled(Symbols.error_rounded)
            : const CreateAccountPasswordVisibilityButton(),
      ),
      onChanged: (value) {
        context.read<CreateAccountBloc>().add(
          CreateAccountPasswordChanged(value),
        );
      },
      onSubmitted: (_) {
        context.read<CreateAccountBloc>().add(
          const CreateAccountSubmitted(),
        );
      },
    );
  }
}
