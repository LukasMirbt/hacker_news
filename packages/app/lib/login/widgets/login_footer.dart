import 'package:app/login/login.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: AppSpacing.lg,
      children: [
        LoginPolicyLinks(),
        LoginButton(),
      ],
    );
  }
}
