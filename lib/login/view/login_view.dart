import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return LoginSuccessListener(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.login_title),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.lg,
            horizontal: AppSpacing.xlg,
          ),
          child: LoginBody(),
        ),
      ),
    );
  }
}
