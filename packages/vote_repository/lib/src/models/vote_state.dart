import 'package:equatable/equatable.dart';
import 'package:vote_repository/vote_repository.dart';

sealed class VoteState extends Equatable {
  const VoteState();

  bool get isFailure => this is VoteFailure;

  @override
  List<Object> get props => [];
}

final class VoteInitial extends VoteState {
  const VoteInitial();
}

final class VoteLoading extends VoteState {
  const VoteLoading();
}

final class VoteSuccess extends VoteState {
  const VoteSuccess({required this.vote});

  final Vote vote;

  @override
  List<Object> get props => [vote];
}

sealed class VoteFailure extends VoteState implements Exception {
  const VoteFailure();
}

final class UnauthenticatedVote extends VoteFailure {
  const UnauthenticatedVote();
}

final class InvalidVoteUrl extends VoteFailure {
  const InvalidVoteUrl();
}

final class UnknownVoteFailure extends VoteFailure {
  const UnknownVoteFailure();
}
