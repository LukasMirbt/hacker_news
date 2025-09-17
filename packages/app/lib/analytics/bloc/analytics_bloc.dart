import 'package:analytics_repository/analytics_repository.dart'
    hide AnalyticsEvent;
import 'package:app/analytics/analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, void> {
  AnalyticsBloc({
    required AnalyticsRepository analyticsRepository,
  }) : _repository = analyticsRepository,
       super(null) {
    on<AnalyticsFullPathChanged>(_onFullPathChanged);
  }

  final AnalyticsRepository _repository;

  void _onFullPathChanged(
    AnalyticsFullPathChanged event,
    Emitter<void> emit,
  ) {
    _repository.send(
      ScreenView(event.fullPath),
    );
  }
}
