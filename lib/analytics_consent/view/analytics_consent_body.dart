import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/l10n/l10n.dart';

class AnalyticsConsentBody extends StatelessWidget {
  const AnalyticsConsentBody({super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Title(),
                  SizedBox(height: AppSpacing.lg),
                  AnalyticsConsentExplanation(),
                  Spacer(),
                  SizedBox(height: AppSpacing.lg),
                  AnalyticsConsentAgreeButton(),
                  SizedBox(height: AppSpacing.sm),
                  AnalyticsConsentDeclineButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    return Text(
      l10n.analyticsConsent_title,
      style: textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}
