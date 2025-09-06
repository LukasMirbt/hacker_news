import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/login/login.dart';
import 'package:flutter/material.dart';

class ShellLoginButton extends StatelessWidget {
  const ShellLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TextButton(
      onPressed: () {
        final appRouter = AppRouter.of(context);
        appRouter.push(
          LoginRoute(from: appRouter.currentLocation),
        );
      },
      child: Text(l10n.appShell_login),
    );
  }
}
