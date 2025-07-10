import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/app/app.dart';

class AnalyticsConsentListener extends StatelessWidget {
  const AnalyticsConsentListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnalyticsConsentBloc, AnalyticsConsentState>(
      listenWhen: (previous, current) =>
          !previous.status.isSuccess && current.status.isSuccess,
      listener: (context, state) {
        context.read<AppBloc>().add(
          const AppAnalyticsConsentCompleted(),
        );
      },
      child: child,
    );
  }
}
