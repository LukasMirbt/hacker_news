import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';

class AnalyticsConsentBloc
    extends Bloc<AnalyticsConsentEvent, AnalyticsConsentState> {
  AnalyticsConsentBloc({
    required AnalyticsRepository analyticsRepository,
  }) : _repository = analyticsRepository,
       super(const AnalyticsConsentState()) {
    on<AnalyticsConsentContinuePressed>(_onContinuePressed);
    on<AnalyticsConsentSkipPressed>(_onSkipPressed);
  }

  final AnalyticsRepository _repository;

  Future<void> _onContinuePressed(
    AnalyticsConsentContinuePressed event,
    Emitter<AnalyticsConsentState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AnalyticsConsentStatus.loading,
      ),
    );

    await _repository.enableAnalyticsCollection();

    emit(
      state.copyWith(
        status: AnalyticsConsentStatus.success,
      ),
    );
  }

  Future<void> _onSkipPressed(
    AnalyticsConsentSkipPressed event,
    Emitter<AnalyticsConsentState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AnalyticsConsentStatus.loading,
      ),
    );

    await _repository.disableAnalyticsCollection();

    emit(
      state.copyWith(
        status: AnalyticsConsentStatus.success,
      ),
    );
  }
}
