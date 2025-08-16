import 'package:app_ui/app_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/l10n/l10n.dart';

class AnalyticsConsentBody extends StatelessWidget {
  const AnalyticsConsentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
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
                  _Explanation(),
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

class _Explanation extends StatelessWidget {
  const _Explanation();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    final normalStyle = textTheme.bodyMedium;

    final underlinedStyle = normalStyle?.copyWith(
      decoration: TextDecoration.underline,
      color: colorScheme.tertiary,
      decorationColor: colorScheme.tertiary,
    );

    return Text.rich(
      textAlign: TextAlign.center,
      style: normalStyle,
      TextSpan(
        children: [
          TextSpan(
            text: l10n.analyticsConsent_explanation,
          ),
          const TextSpan(
            text: ' ',
          ),
          TextSpan(
            text: l10n.analyticsConsent_privacyPolicyPart1,
          ),
          TextSpan(
            text: l10n.analyticsConsent_privacyPolicyPart2,
            style: underlinedStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<AnalyticsConsentBloc>().add(
                  const AnalyticsConsentPrivacyPolicyPressed(),
                );
              },
          ),
          TextSpan(
            text: l10n.analyticsConsent_privacyPolicyPart3,
          ),
        ],
      ),
    );
  }
}
