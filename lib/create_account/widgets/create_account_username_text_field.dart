import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CreateAccountUsernameTextField extends StatelessWidget {
  const CreateAccountUsernameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final errorText = context.select(
      (CreateAccountBloc bloc) => bloc.state.form.usernameErrorText(l10n),
    );

    return TextField(
      autocorrect: false,
      enableSuggestions: false,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.newUsername],
      decoration: InputDecoration(
        labelText: l10n.createAccount_usernameLabel,
        errorText: errorText,
        suffixIcon: errorText != null ? const Icon(Icons.error) : null,
      ),
      onChanged: (value) {
        context.read<CreateAccountBloc>().add(
          CreateAccountUsernameChanged(value),
        );
      },
    );
  }
}
