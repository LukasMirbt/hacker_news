import 'package:equatable/equatable.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class AppAnalyticsConsentCompleted extends AppEvent {
  const AppAnalyticsConsentCompleted();
}
