import 'package:flutter_test/flutter_test.dart';
import 'package:vote_repository/vote_repository.dart';

void main() {
  group(VoteState, () {
    group('isFailure', () {
      test('returns false for $VoteInitial', () {
        const state = VoteInitial();
        expect(state.isFailure, false);
      });

      test('returns false for $VoteLoading', () {
        const state = VoteLoading();
        expect(state.isFailure, false);
      });

      test('returns false for $VoteSuccess', () {
        final state = VoteSuccess(
          vote: VotePlaceholder(),
        );
        expect(state.isFailure, false);
      });

      test('returns true for $InvalidVoteUrl', () {
        const state = InvalidVoteUrl();
        expect(state.isFailure, true);
      });

      test('returns true for $UnknownVoteFailure', () {
        const state = UnknownVoteFailure();
        expect(state.isFailure, true);
      });
    });
  });
}
