import 'package:app/login/login.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSpacing.lg,
                horizontal: AppSpacing.xlg,
              ),
              child: Column(
                children: [
                  LoginForm(),
                  SizedBox(height: AppSpacing.lg),
                  Spacer(),
                  LoginFooter(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
