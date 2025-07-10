import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';

class AnalyticsConsentPage extends StatelessWidget {
  const AnalyticsConsentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalyticsConsentBloc(
        analyticsRepository: context.read<AnalyticsRepository>(),
      ),
      child: const AnalyticsConsentView(),
    );
  }
}
