// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_api/authentication_api.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockVoteApi extends Mock implements VoteApi {}

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockVoteParser extends Mock implements VoteParser {}

void main() {
  group(VoteRepository, () {
    late VoteApi voteApi;
    late AuthenticationApi authenticationApi;
    late AuthenticationState authenticationState;
    late VoteParser voteParser;

    setUp(() {
      voteApi = _MockVoteApi();
      authenticationApi = _MockAuthenticationApi();
      authenticationState = _MockAuthenticationState();
      voteParser = _MockVoteParser();
      when(() => authenticationApi.state).thenReturn(authenticationState);
      when(() => authenticationState.status).thenReturn(
        AuthenticationStatus.authenticated,
      );
    });

    VoteRepository buildCubit() {
      return VoteRepository(
        voteApi: voteApi,
        authenticationApi: authenticationApi,
        voteParser: voteParser,
      );
    }

    test('initial state is $VoteInitial', () {
      final repository = buildCubit();
      expect(repository.state, VoteInitial());
    });

    group('vote', () {
      const upvoteUrl = 'https://example.com';
      const hasBeenUpvoted = true;
      final vote = VotePlaceholder();
      final exception = Exception('oops');

      final redirectToLogin = () => authenticationApi.redirectToLogin();

      final tryParse = () => voteParser.tryParse(
        upvoteUrl: upvoteUrl,
        hasBeenUpvoted: hasBeenUpvoted,
      );

      final voteRequest = () => voteApi.vote(vote.url);

      blocTest<VoteRepository, VoteState>(
        'calls redirectToLogin and returns when !isAuthenticated',
        setUp: () {
          when(() => authenticationState.status).thenReturn(
            AuthenticationStatus.unauthenticated,
          );
        },
        build: buildCubit,
        act: (cubit) {
          cubit.vote(
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          );
        },
        expect: () => <VoteState>[],
        verify: (_) {
          verify(redirectToLogin).called(1);
        },
      );

      blocTest<VoteRepository, VoteState>(
        'returns when state is $VoteLoading',
        seed: VoteLoading.new,
        build: buildCubit,
        act: (cubit) {
          cubit.vote(
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          );
        },
        expect: () => <VoteState>[],
      );

      blocTest<VoteRepository, VoteState>(
        'emits $InvalidVoteUrl when voteParser returns null',
        build: buildCubit,
        act: (cubit) {
          cubit.vote(
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          );
        },
        expect: () => [
          InvalidVoteUrl(),
        ],
        verify: (_) {
          verify(tryParse).called(1);
        },
      );

      blocTest<VoteRepository, VoteState>(
        'emits [$VoteLoading, $VoteSuccess] '
        'when vote request succeeds',
        setUp: () {
          when(tryParse).thenReturn(vote);
          when(voteRequest).thenAnswer((_) async {});
        },
        build: buildCubit,
        act: (cubit) {
          cubit.vote(
            upvoteUrl: upvoteUrl,
            hasBeenUpvoted: hasBeenUpvoted,
          );
        },
        expect: () => [
          VoteLoading(),
          VoteSuccess(vote: vote),
        ],
        verify: (_) {
          verify(tryParse).called(1);
          verify(voteRequest).called(1);
        },
      );

      blocTest<VoteRepository, VoteState>(
        'emits [$VoteLoading, $UnknownVoteFailure] and rethrows '
        'when vote request throws',
        setUp: () {
          when(tryParse).thenReturn(vote);
          when(voteRequest).thenThrow(exception);
        },
        build: buildCubit,
        act: (cubit) {
          expect(
            cubit.vote(
              upvoteUrl: upvoteUrl,
              hasBeenUpvoted: hasBeenUpvoted,
            ),
            throwsA(exception),
          );
        },
        expect: () => [
          VoteLoading(),
          UnknownVoteFailure(),
        ],
        verify: (_) {
          verify(tryParse).called(1);
          verify(voteRequest).called(1);
        },
      );
    });
  });
}
