import 'package:flutter/material.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return CreateAccountSuccessListener(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(l10n.createAccount_title),
        ),
        body: const CreateAccountBody(),
      ),
    );
  }
}
