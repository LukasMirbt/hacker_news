import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppLoadingBody extends StatelessWidget {
  const AppLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.lg,
          horizontal: AppSpacing.xlg,
        ),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
