import 'package:equatable/equatable.dart';

sealed class DataCollectionEvent extends Equatable {
  const DataCollectionEvent();

  @override
  List<Object> get props => [];
}

final class DataCollectionAnalyticsToggled extends DataCollectionEvent {
  const DataCollectionAnalyticsToggled();
}
