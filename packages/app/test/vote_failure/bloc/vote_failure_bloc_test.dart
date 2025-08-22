// ignore_for_file: prefer_const_constructors

import 'package:app/vote_failure/vote_failure.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockVoteRepository extends Mock implements VoteRepository {}

void main() {
  const initialState = VoteInitial();

  group(VoteFailureBloc, () {
    late VoteRepository repository;

    setUp(() {
      repository = _MockVoteRepository();
      when(() => repository.state).thenReturn(initialState);
    });

    VoteFailureBloc buildBloc() {
      return VoteFailureBloc(
        voteRepository: repository,
      );
    }

    test('initial state is $VoteState', () {
      expect(buildBloc().state, initialState);
    });

    group(VoteFailureSubscriptionRequested, () {
      final updatedState = VoteLoading();

      blocTest<VoteFailureBloc, VoteState>(
        'emits state',
        setUp: () {
          when(() => repository.stream).thenAnswer(
            (_) => Stream.value(updatedState),
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            VoteFailureSubscriptionRequested(),
          );
        },
        expect: () => [updatedState],
      );
    });
  });
}
