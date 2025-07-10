import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/l10n/l10n.dart';

class AnalyticsConsentContinueButton extends StatelessWidget {
  const AnalyticsConsentContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (AnalyticsConsentBloc bloc) => bloc.state.isLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.expand(
      isLoading: isLoading,
      onPressed: () {
        context.read<AnalyticsConsentBloc>().add(
          const AnalyticsConsentContinuePressed(),
        );
      },
      child: Text(l10n.analyticsConsent_continue),
    );
  }
}
