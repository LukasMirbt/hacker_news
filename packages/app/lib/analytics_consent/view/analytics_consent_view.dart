import 'package:app/analytics_consent/analytics_consent.dart';
import 'package:flutter/material.dart';

class AnalyticsConsentView extends StatelessWidget {
  const AnalyticsConsentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnalyticsConsentListener(
      child: Scaffold(
        body: AnalyticsConsentBody(),
      ),
    );
  }
}
