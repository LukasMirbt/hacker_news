// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockThreadRepository extends Mock implements ThreadRepository {}

class _MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockVoteRepository extends Mock implements VoteRepository {}

class _MockReplyRepository extends Mock implements ReplyRepository {}

class _MockThreadFeedVoteModel extends Mock implements ThreadFeedVoteModel {}

class _MockThreadFeedReplyModel extends Mock implements ThreadFeedReplyModel {}

class _MockLinkLauncher extends Mock implements LinkLauncher {}

class _MockThreadFeedModel extends Mock implements PaginatedThreadFeedModel {}

void main() {
  final initialState = ThreadFeedState.initial();

  final item = ThreadFeedItemModel(
    item: ThreadFeedItemPlaceholder(),
  );

  final user = UserPlaceholder();

  group(ThreadFeedBloc, () {
    late ThreadRepository threadRepository;
    late AuthenticationRepository authenticationRepository;
    late AuthenticationState authenticationState;
    late VoteRepository voteRepository;
    late ReplyRepository replyRepository;
    late ThreadFeedVoteModel voteModel;
    late ThreadFeedReplyModel replyModel;
    late LinkLauncher linkLauncher;

    setUp(() {
      threadRepository = _MockThreadRepository();
      authenticationRepository = _MockAuthenticationRepository();
      authenticationState = _MockAuthenticationState();
      voteRepository = _MockVoteRepository();
      replyRepository = _MockReplyRepository();
      voteModel = _MockThreadFeedVoteModel();
      replyModel = _MockThreadFeedReplyModel();
      linkLauncher = _MockLinkLauncher();
      when(
        () => authenticationRepository.state,
      ).thenReturn(authenticationState);
      when(() => authenticationState.user).thenReturn(user);
    });

    ThreadFeedBloc buildBloc() {
      return ThreadFeedBloc(
        threadRepository: threadRepository,
        authenticationRepository: authenticationRepository,
        voteRepository: voteRepository,
        replyRepository: replyRepository,
        voteModel: voteModel,
        replyModel: replyModel,
        linkLauncher: linkLauncher,
      );
    }

    test('initial state is $ThreadFeedState', () {
      expect(buildBloc().state, initialState);
    });

    group(ThreadFeedVoteSubscriptionRequested, () {
      final repositoryState = VoteSuccess(
        vote: VotePlaceholder(),
      );

      final state = initialState.copyWith(
        feed: _MockThreadFeedModel(),
      );

      final extendedList = _MockThreadFeedModel();

      final updateFeed = () => voteModel.updateFeed(
        vote: repositoryState.vote,
        feed: state.feed,
      );

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits updated feed when repository emits $VoteSuccess',
        setUp: () {
          when(() => voteRepository.stream).thenAnswer(
            (_) => Stream.value(repositoryState),
          );
          when(updateFeed).thenReturn(extendedList);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedVoteSubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            feed: extendedList,
          ),
        ],
        verify: (_) {
          verify(updateFeed).called(1);
        },
      );
    });

    group(ThreadFeedReplySubscriptionRequested, () {
      final user = UserPlaceholder();

      final update = ReplyUpdate(
        form: ReplyFormPlaceholder(),
        comment: CurrentUserCommentDataPlaceholder(),
      );

      final state = initialState.copyWith(
        feed: _MockThreadFeedModel(),
      );

      final updatedThreadFeed = _MockThreadFeedModel();

      final updateThreadFeed = () => replyModel.updateFeed(
        update: update,
        feed: state.feed,
      );

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits updated commentList when repository emits $ReplyUpdate',
        setUp: () {
          when(() => authenticationState.user).thenReturn(user);
          when(() => replyRepository.stream).thenAnswer(
            (_) => Stream.value(update),
          );
          when(updateThreadFeed).thenReturn(updatedThreadFeed);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedReplySubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            feed: updatedThreadFeed,
          ),
        ],
        verify: (_) {
          verify(updateThreadFeed).called(1);
        },
      );
    });

    group(ThreadFeedStarted, () {
      final request = () => threadRepository.fetchMore(
        PaginatedThreadFeed.initial(user),
      );

      final feed = PaginatedThreadFeedPlaceholder(
        items: [
          ThreadFeedItemPlaceholder(),
        ],
      );

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits [success] and $PaginatedThreadFeedModel '
        'when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async => feed);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            fetchStatus: FetchStatus.success,
            feed: PaginatedThreadFeedModel.fromRepository(feed),
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits [failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            fetchStatus: FetchStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group(ThreadFeedDataFetched, () {
      final feed = _MockThreadFeedModel();

      final initialRepositoryList = PaginatedThreadFeedPlaceholder(
        items: [
          ThreadFeedItemPlaceholder(),
        ],
      );

      final extendedRepositoryList = PaginatedThreadFeedPlaceholder(
        items: [
          ThreadFeedItemPlaceholder(),
          ThreadFeedItemPlaceholder(),
        ],
      );

      final rebuiltThreadFeed = _MockThreadFeedModel();

      final state = initialState.copyWith(
        feed: feed,
        fetchStatus: FetchStatus.success,
      );

      final request = () => threadRepository.fetchMore(initialRepositoryList);

      final rebuildWith = () => feed.rebuildWith(extendedRepositoryList);

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits [loading, success] and $PaginatedThreadFeedModel '
        'when request succeeds',
        setUp: () {
          when(feed.toRepository).thenReturn(initialRepositoryList);
          when(request).thenAnswer((_) async => extendedRepositoryList);
          when(rebuildWith).thenReturn(rebuiltThreadFeed);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedDataFetched(),
          );
        },
        expect: () => [
          state.copyWith(
            fetchStatus: FetchStatus.loading,
          ),
          state.copyWith(
            fetchStatus: FetchStatus.success,
            feed: rebuiltThreadFeed,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
          verify(rebuildWith).called(1);
        },
      );

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(feed.toRepository).thenReturn(initialRepositoryList);
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedDataFetched(),
          );
        },
        expect: () => [
          state.copyWith(
            fetchStatus: FetchStatus.loading,
          ),
          state.copyWith(
            fetchStatus: FetchStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group(ThreadFeedRefreshTriggered, () {
      final feed = _MockThreadFeedModel();

      final state = initialState.copyWith(
        feed: feed,
        fetchStatus: FetchStatus.success,
      );

      final repositoryList = PaginatedThreadFeedPlaceholder(
        items: [
          ThreadFeedItemPlaceholder(),
        ],
      );

      final request = () => threadRepository.fetchMore(
        PaginatedThreadFeed.initial(user),
      );

      final rebuildWith = () => feed.rebuildWith(repositoryList);

      final rebuiltList = _MockThreadFeedModel();

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits [loading, success] and $PaginatedThreadFeedModel '
        'when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async => repositoryList);
          when(rebuildWith).thenReturn(rebuiltList);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedRefreshTriggered(),
          );
        },
        expect: () => [
          state.copyWith(
            refreshStatus: RefreshStatus.loading,
          ),
          state.copyWith(
            refreshStatus: RefreshStatus.success,
            fetchStatus: FetchStatus.success,
            feed: rebuiltList,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
          verify(rebuildWith).called(1);
        },
      );

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedRefreshTriggered(),
          );
        },
        expect: () => [
          state.copyWith(
            refreshStatus: RefreshStatus.loading,
          ),
          state.copyWith(
            refreshStatus: RefreshStatus.failure,
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group(ThreadFeedItemExpansionToggled, () {
      final feed = _MockThreadFeedModel();
      final extendedList = _MockThreadFeedModel();

      final state = initialState.copyWith(feed: feed);

      final toggleExpansion = () => feed.toggleExpansion(item: item);

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'emits updated feed',
        setUp: () {
          when(toggleExpansion).thenReturn(extendedList);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedItemExpansionToggled(item),
          );
        },
        expect: () => [
          state.copyWith(
            feed: extendedList,
          ),
        ],
        verify: (_) {
          verify(toggleExpansion).called(1);
        },
      );
    });

    group(ThreadFeedItemVotePressed, () {
      final vote = () => voteRepository.vote(
        upvoteUrl: item.upvoteUrl,
        hasBeenUpvoted: item.hasBeenUpvoted,
      );

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'calls vote',
        setUp: () {
          when(vote).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedItemVotePressed(item),
          );
        },
        verify: (_) {
          verify(vote).called(1);
        },
      );
    });

    group(ThreadFeedItemLinkPressed, () {
      const url = 'url';
      final launch = () => linkLauncher.launch(url);

      blocTest<ThreadFeedBloc, ThreadFeedState>(
        'calls launch',
        setUp: () {
          when(launch).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            ThreadFeedItemLinkPressed(url),
          );
        },
        verify: (_) {
          verify(launch).called(1);
        },
      );
    });
  });
}
