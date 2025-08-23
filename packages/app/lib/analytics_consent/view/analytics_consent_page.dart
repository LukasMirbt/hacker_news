import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/analytics_consent/analytics_consent.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';

class AnalyticsConsentPage extends StatelessWidget {
  const AnalyticsConsentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalyticsConsentBloc(
        analyticsRepository: context.read<AnalyticsRepository>(),
        linkLauncher: context.read<LinkLauncher>(),
      ),
      child: const AnalyticsConsentView(),
    );
  }
}
