import 'package:app/create_account/create_account.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutofillGroup(
      child: Column(
        children: [
          _Explanation(),
          SizedBox(height: AppSpacing.lg),
          CreateAccountUsernameTextField(),
          SizedBox(height: AppSpacing.lg),
          CreateAccountPasswordTextField(),
        ],
      ),
    );
  }
}

class _Explanation extends StatelessWidget {
  const _Explanation();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Text(
      l10n.createAccount_explanation,
      textAlign: TextAlign.center,
    );
  }
}
