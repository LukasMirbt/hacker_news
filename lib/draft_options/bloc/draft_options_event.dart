import 'package:equatable/equatable.dart';

class DraftOptionsEvent extends Equatable {
  const DraftOptionsEvent();

  @override
  List<Object> get props => [];
}

final class DraftOptionsDeleteConfirmed extends DraftOptionsEvent {
  const DraftOptionsDeleteConfirmed();
}
