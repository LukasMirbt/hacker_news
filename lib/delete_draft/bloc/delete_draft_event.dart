import 'package:equatable/equatable.dart';

class DeleteDraftEvent extends Equatable {
  const DeleteDraftEvent();

  @override
  List<Object> get props => [];
}

final class DeleteDraftConfirmed extends DeleteDraftEvent {
  const DeleteDraftConfirmed();
}
