import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/create_account/create_account.dart';

class CreateAccountBody extends StatelessWidget {
  const CreateAccountBody({super.key});

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
                  CreateAccountForm(),
                  SizedBox(height: AppSpacing.lg),
                  Spacer(),
                  CreateAccountFooter(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
