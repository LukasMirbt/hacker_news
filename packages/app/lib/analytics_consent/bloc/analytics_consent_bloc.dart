import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/analytics_consent/analytics_consent.dart';
import 'package:app/external_links/external_links.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';

class AnalyticsConsentBloc
    extends Bloc<AnalyticsConsentEvent, AnalyticsConsentState> {
  AnalyticsConsentBloc({
    required AnalyticsRepository analyticsRepository,
    required LinkLauncher linkLauncher,
  }) : _repository = analyticsRepository,
       _launcher = linkLauncher,
       super(const AnalyticsConsentState()) {
    on<AnalyticsConsentPrivacyPolicyPressed>(_onPrivacyPolicyPressed);
    on<AnalyticsConsentAgreePressed>(_onAgreePressed);
    on<AnalyticsConsentDeclinePressed>(_onDeclinePressed);
  }

  final AnalyticsRepository _repository;
  final LinkLauncher _launcher;

  void _onPrivacyPolicyPressed(
    AnalyticsConsentPrivacyPolicyPressed event,
    Emitter<AnalyticsConsentState> emit,
  ) {
    _launcher.launch(yapPrivacyPolicyLink);
  }

  void _onAgreePressed(
    AnalyticsConsentAgreePressed event,
    Emitter<AnalyticsConsentState> emit,
  ) {
    _repository.enableAnalyticsCollection();

    emit(
      state.copyWith(
        status: AnalyticsConsentStatus.success,
      ),
    );
  }

  void _onDeclinePressed(
    AnalyticsConsentDeclinePressed event,
    Emitter<AnalyticsConsentState> emit,
  ) {
    _repository.disableAnalyticsCollection();

    emit(
      state.copyWith(
        status: AnalyticsConsentStatus.success,
      ),
    );
  }
}
