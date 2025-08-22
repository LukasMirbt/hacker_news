import 'package:app/app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required bool isAnalyticsConsentCompleted,
  }) = _AppState;

  const AppState._();

  AppStatus get status {
    if (!isAnalyticsConsentCompleted) {
      return AppStatus.analyticsConsent;
    }
    return AppStatus.home;
  }
}
