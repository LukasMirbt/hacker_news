import 'package:equatable/equatable.dart';

sealed class AnalyticsConsentEvent extends Equatable {
  const AnalyticsConsentEvent();

  @override
  List<Object> get props => [];
}

final class AnalyticsConsentContinuePressed extends AnalyticsConsentEvent {
  const AnalyticsConsentContinuePressed();
}

final class AnalyticsConsentSkipPressed extends AnalyticsConsentEvent {
  const AnalyticsConsentSkipPressed();
}
