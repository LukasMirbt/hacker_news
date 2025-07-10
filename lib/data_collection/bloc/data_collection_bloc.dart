import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/data_collection/data_collection.dart';

class DataCollectionBloc
    extends Bloc<DataCollectionEvent, DataCollectionState> {
  DataCollectionBloc({
    required AnalyticsRepository analyticsRepository,
  }) : _repository = analyticsRepository,
       super(const DataCollectionState()) {
    on<DataCollectionStarted>(_onStarted);
    on<DataCollectionAnalyticsToggled>(_onAnalyticsToggled);
  }

  final AnalyticsRepository _repository;

  Future<void> _onStarted(
    DataCollectionStarted event,
    Emitter<DataCollectionState> emit,
  ) async {
    final enabled = await _repository.isAnalyticsCollectionEnabled();

    emit(
      state.copyWith(
        isAnalyticsCollectionEnabled: enabled,
        status: DataCollectionStatus.success,
      ),
    );
  }

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
