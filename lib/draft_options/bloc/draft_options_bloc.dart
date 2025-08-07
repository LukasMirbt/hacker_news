import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/draft_options/draft_options.dart';

class DraftOptionsBloc extends Bloc<DraftOptionsEvent, DraftOptionsState> {
  DraftOptionsBloc({
    required Draft draft,
    required DraftRepository draftRepository,
  }) : _repository = draftRepository,
       super(
         DraftOptionsState.from(draft),
       ) {
    on<DraftOptionsDeleteConfirmed>(_onDeleteConfirmed);
  }

  final DraftRepository _repository;

  void _onDeleteConfirmed(
    DraftOptionsDeleteConfirmed event,
    Emitter<DraftOptionsState> emit,
  ) {
    _repository.deleteDraft(
      state.draft.toRepository(),
    );
  }
}
