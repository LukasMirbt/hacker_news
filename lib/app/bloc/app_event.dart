import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class AppAnalyticsConsentCompleted extends AppEvent {
  const AppAnalyticsConsentCompleted();
}

final class AppLifecycleStateChanged extends AppEvent {
  const AppLifecycleStateChanged(this.state);

  final AppLifecycleState state;

  @override
  List<Object> get props => [state];
}
