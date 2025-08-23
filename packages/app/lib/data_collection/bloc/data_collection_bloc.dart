import 'package:analytics_repository/analytics_repository.dart';
import 'package:app/data_collection/data_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCollectionBloc
    extends Bloc<DataCollectionEvent, DataCollectionState> {
  DataCollectionBloc({
    required AnalyticsRepository analyticsRepository,
  }) : _repository = analyticsRepository,
       super(
         DataCollectionState(
           isAnalyticsCollectionEnabled: analyticsRepository
               .isAnalyticsCollectionEnabled(),
         ),
       ) {
    on<DataCollectionAnalyticsToggled>(_onAnalyticsToggled);
  }

  final AnalyticsRepository _repository;

  void _onAnalyticsToggled(
    DataCollectionAnalyticsToggled event,
    Emitter<DataCollectionState> emit,
  ) {
    final enabled = !state.isAnalyticsCollectionEnabled;

    emit(
      state.copyWith(
        isAnalyticsCollectionEnabled: enabled,
      ),
    );

    if (enabled) {
      _repository.enableAnalyticsCollection();
    } else {
      _repository.disableAnalyticsCollection();
    }
  }
}
