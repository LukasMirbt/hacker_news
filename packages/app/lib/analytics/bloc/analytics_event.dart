import 'package:equatable/equatable.dart';

sealed class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();
}

final class AnalyticsFullPathChanged extends AnalyticsEvent {
  const AnalyticsFullPathChanged(this.fullPath);

  final String fullPath;

  @override
  List<Object> get props => [fullPath];
}
