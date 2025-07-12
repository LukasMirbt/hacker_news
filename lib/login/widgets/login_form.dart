import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutofillGroup(
      child: Column(
        children: [
          _Instructions(),
          SizedBox(height: AppSpacing.lg),
          LoginUsernameTextField(),
          SizedBox(height: AppSpacing.lg),
          LoginPasswordTextField(),
          SizedBox(height: AppSpacing.sm),
          LoginCreateAccountButton(),
        ],
      ),
    );
  }
}

class _Instructions extends StatelessWidget {
  const _Instructions();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Text(
      l10n.login_instructions,
      textAlign: TextAlign.center,
    );
  }
}
