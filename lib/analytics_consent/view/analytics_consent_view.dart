import 'package:flutter/material.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';

class AnalyticsConsentView extends StatelessWidget {
  const AnalyticsConsentView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnalyticsConsentListener(
      child: Scaffold(
        appBar: AppBar(),
        body: const AnalyticsConsentBody(),
      ),
    );
  }
}
