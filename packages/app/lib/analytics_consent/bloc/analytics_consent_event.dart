import 'package:equatable/equatable.dart';

sealed class AnalyticsConsentEvent extends Equatable {
  const AnalyticsConsentEvent();

  @override
  List<Object> get props => [];
}

final class AnalyticsConsentPrivacyPolicyPressed extends AnalyticsConsentEvent {
  const AnalyticsConsentPrivacyPolicyPressed();
}

final class AnalyticsConsentAgreePressed extends AnalyticsConsentEvent {
  const AnalyticsConsentAgreePressed();
}

final class AnalyticsConsentDeclinePressed extends AnalyticsConsentEvent {
  const AnalyticsConsentDeclinePressed();
}
