import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_consent_state.freezed.dart';

enum AnalyticsConsentStatus {
  initial,
  loading,
  success;

  bool get isSuccess => this == success;
}

@freezed
abstract class AnalyticsConsentState with _$AnalyticsConsentState {
  const factory AnalyticsConsentState({
    @Default(AnalyticsConsentStatus.initial) AnalyticsConsentStatus status,
  }) = _AnalyticsConsentState;

  const AnalyticsConsentState._();

  bool get isLoading =>
      status == AnalyticsConsentStatus.loading ||
      status == AnalyticsConsentStatus.success;
}
