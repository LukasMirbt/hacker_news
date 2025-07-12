import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/create_account/create_account.dart';

class CreateAccountFooter extends StatelessWidget {
  const CreateAccountFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: AppSpacing.lg,
      children: [
        CreateAccountPolicyLinks(),
        CreateAccountButton(),
      ],
    );
  }
}
