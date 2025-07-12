import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/create_account/create_account.dart';

class CreateAccountBody extends StatelessWidget {
  const CreateAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: AutofillGroup(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.lg,
            horizontal: AppSpacing.xlg,
          ),
          child: Column(
            children: [
              CreateAccountExplanation(),
              SizedBox(height: AppSpacing.xlg),
              CreateAccountUsernameTextField(),
              SizedBox(height: AppSpacing.lg),
              CreateAccountPasswordTextField(),
              SizedBox(height: AppSpacing.lg),
              SizedBox(height: AppSpacing.sm),
              Spacer(),
              CreateAccountPolicyLinks(),
              SizedBox(height: AppSpacing.lg),
              CreateAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
