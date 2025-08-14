import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:bloc/bloc.dart';
import 'package:vote_repository/vote_repository.dart';

class VoteRepository extends Cubit<VoteState> {
  VoteRepository({
    required VoteApi voteApi,
    required AuthenticationApi authenticationApi,
    VoteParser? voteParser,
  }) : _voteApi = voteApi,
       _authenticationApi = authenticationApi,
       _voteParser = voteParser ?? const VoteParser(),
       super(
         const VoteInitial(),
       );

  final VoteApi _voteApi;
  final AuthenticationApi _authenticationApi;
  final VoteParser _voteParser;

  Future<void> vote({
    required String? upvoteUrl,
    required bool hasBeenUpvoted,
  }) async {
    if (state is VoteLoading) return;

    emit(
      const VoteLoading(),
    );

    final isAuthenticated = _authenticationApi.state.status.isAuthenticated;

    if (!isAuthenticated) {
      return emit(
        const UnauthenticatedVote(),
      );
    }

    final vote = _voteParser.tryParse(
      upvoteUrl: upvoteUrl,
      hasBeenUpvoted: hasBeenUpvoted,
    );

    if (vote == null) {
      return emit(
        const InvalidVoteUrl(),
      );
    }

    try {
      await _voteApi.vote(vote.url);

      emit(
        VoteSuccess(vote: vote),
      );
    } catch (_) {
      emit(
        const UnknownVoteFailure(),
      );

      rethrow;
    }
  }
}
