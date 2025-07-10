import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';

class AnalyticsConsentBody extends StatelessWidget {
  const AnalyticsConsentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      child: SafeArea(
        child: Column(
          spacing: AppSpacing.lg,
          children: [
            AnalyticsConsentContinueButton(),
            AnalyticsConsentSkipButton(),
          ],
        ),
      ),
    );
  }
}
