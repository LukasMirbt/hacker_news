import 'package:equatable/equatable.dart';

class ReplyDraftOptionsEvent extends Equatable {
  const ReplyDraftOptionsEvent();

  @override
  List<Object> get props => [];
}

final class ReplyDraftOptionsDeleteConfirmed extends ReplyDraftOptionsEvent {
  const ReplyDraftOptionsDeleteConfirmed();
}
