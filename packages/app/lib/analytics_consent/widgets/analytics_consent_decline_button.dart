import 'package:app/analytics_consent/analytics_consent.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsConsentDeclineButton extends StatelessWidget {
  const AnalyticsConsentDeclineButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppOutlinedButton.expand(
      onPressed: () {
        context.read<AnalyticsConsentBloc>().add(
          const AnalyticsConsentDeclinePressed(),
        );
      },
      child: Text(l10n.analyticsConsent_declineAction),
    );
  }
}
