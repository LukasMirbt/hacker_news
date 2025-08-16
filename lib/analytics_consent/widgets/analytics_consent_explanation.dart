import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/l10n/l10n.dart';

class AnalyticsConsentExplanation extends StatelessWidget {
  const AnalyticsConsentExplanation({super.key});

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
            text: l10n.analyticsConsent_explanationPart1,
          ),
          TextSpan(
            text: l10n.analyticsConsent_explanationPart2,
          ),
          TextSpan(
            text: l10n.analyticsConsent_privacyPolicy,
            style: underlinedStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<AnalyticsConsentBloc>().add(
                  const AnalyticsConsentPrivacyPolicyPressed(),
                );
              },
          ),
          TextSpan(
            text: l10n.analyticsConsent_explanationPart4,
          ),
        ],
      ),
    );
  }
}
