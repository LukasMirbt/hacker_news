import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:vote_repository/vote_repository.dart';

class VoteFailureBloc extends Bloc<VoteFailureEvent, VoteState> {
  VoteFailureBloc({
    required VoteRepository voteRepository,
  }) : _repository = voteRepository,
       super(
         voteRepository.state,
       ) {
    on<VoteFailureSubscriptionRequested>(_onSubscriptionRequested);
  }

  final VoteRepository _repository;

  Future<void> _onSubscriptionRequested(
    VoteFailureSubscriptionRequested event,
    Emitter<VoteState> emit,
  ) {
    return emit.forEach(
      _repository.stream,
      onData: (state) => state,
    );
  }
}
