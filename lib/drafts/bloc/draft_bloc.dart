import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/drafts/drafts.dart';

class DraftBloc extends Bloc<DraftEvent, DraftState> {
  DraftBloc({
    required DraftRepository draftRepository,
  }) : _repository = draftRepository,
       super(const DraftState()) {
    on<DraftStarted>(_onStarted);
  }

  final DraftRepository _repository;

  Future<void> _onStarted(
    DraftStarted event,
    Emitter<DraftState> emit,
  ) async {
    try {
      final drafts = await _repository.loadDrafts();

      emit(
        state.copyWith(
          status: DraftStatus.success,
          drafts: drafts,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          status: DraftStatus.failure,
        ),
      );
    }
  }
}
