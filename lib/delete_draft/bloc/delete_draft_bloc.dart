import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/delete_draft/delete_draft.dart';

class DeleteDraftBloc extends Bloc<DeleteDraftEvent, DeleteDraftState> {
  DeleteDraftBloc({
    required Draft draft,
    required DraftRepository draftRepository,
  }) : _repository = draftRepository,
       super(
         DeleteDraftState(draft: draft),
       ) {
    on<DeleteDraftConfirmed>(_onConfirmed);
  }

  final DraftRepository _repository;

  void _onConfirmed(
    DeleteDraftConfirmed event,
    Emitter<DeleteDraftState> emit,
  ) {
    _repository.deleteDraft(state.draft);
  }
}
