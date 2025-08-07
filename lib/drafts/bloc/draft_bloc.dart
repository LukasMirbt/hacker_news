import 'package:draft_repository/draft_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/drafts/drafts.dart';

class DraftBloc extends Bloc<DraftEvent, DraftState> {
  DraftBloc({
    required DraftRepository draftRepository,
  }) : _repository = draftRepository,
       super(const DraftState()) {
    on<DraftSubscriptionRequested>(_onSubscriptionRequested);
  }

  final DraftRepository _repository;

  Future<void> _onSubscriptionRequested(
    DraftSubscriptionRequested event,
    Emitter<DraftState> emit,
  ) {
    return emit.forEach(
      _repository.drafts,
      onData: (drafts) => state.copyWith(
        drafts: drafts,
        status: DraftStatus.success,
      ),
      onError: (error, stackTrace) {
        addError(error, stackTrace);
        return state.copyWith(
          status: DraftStatus.failure,
        );
      },
    );
  }
}
