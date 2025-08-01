import 'package:flutter/material.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TextButton(
      onPressed: () {
        final appRouter = AppRouter.of(context);
        appRouter.push(
          LoginRoute(from: appRouter.from),
        );
      },
      child: Text(l10n.appShell_login),
    );
  }
}
