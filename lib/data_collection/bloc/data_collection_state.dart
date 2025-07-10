import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_collection_state.freezed.dart';

enum DataCollectionStatus {
  loading,
  success;

  bool get isLoading => this == loading;
}

@freezed
abstract class DataCollectionState with _$DataCollectionState {
  const factory DataCollectionState({
    @Default(DataCollectionStatus.loading) DataCollectionStatus status,
    @Default(false) bool isAnalyticsCollectionEnabled,
  }) = _DataCollectionState;
}
