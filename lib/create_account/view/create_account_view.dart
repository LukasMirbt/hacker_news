import 'package:flutter/material.dart';
import 'package:hacker_client/create_account/create_account.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateAccountSuccessListener(
      child: Scaffold(
        appBar: _AppBar(),
        body: CreateAccountBody(),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.createAccount_title),
    );
  }
}
