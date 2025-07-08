import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/login/login.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutofillGroup(
      child: Column(
        spacing: AppSpacing.lg,
        children: [
          LoginUsernameTextField(),
          LoginPasswordTextField(),
          LoginButton(),
        ],
      ),
    );
  }
}
