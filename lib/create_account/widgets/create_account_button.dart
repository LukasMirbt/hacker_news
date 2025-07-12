import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (CreateAccountBloc bloc) => bloc.state.form.isLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.expand(
      isLoading: isLoading,
      onPressed: () {
        context.read<CreateAccountBloc>().add(
          const CreateAccountSubmitted(),
        );
      },
      child: Text(l10n.createAccount_submitAction),
    );
  }
}
