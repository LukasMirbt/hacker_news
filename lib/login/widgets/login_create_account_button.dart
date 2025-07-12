import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';

class LoginCreateAccountButton extends StatelessWidget {
  const LoginCreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TextButton(
      onPressed: () {},
      child: Text(l10n.login_createAccountAction),
    );
  }
}
