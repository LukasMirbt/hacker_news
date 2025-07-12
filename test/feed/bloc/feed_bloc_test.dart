// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:bloc_test/bloc_test.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:visited_post_repository/visited_post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class _MockFeedRepository extends Mock implements FeedRepository {}

class _MockVoteRepository extends Mock implements VoteRepository {}

class _MockVisitedPostRepository extends Mock
    implements VisitedPostRepository {}

class _MockShareLauncher extends Mock implements ShareLauncher {}

class _MockFeedVoteModel extends Mock implements FeedVoteModel {}

class _MockPaginatedFeedModel extends Mock implements PaginatedFeedModel {}

void main() {
  const type = FeedType.top;
  final visitedPosts = <String>{};

  final initialState = FeedState.initial(
    type: type,
    visitedPosts: visitedPosts,
  );

  group(FeedBloc, () {
    late FeedRepository feedRepository;
    late VoteRepository voteRepository;
    late VisitedPostRepository visitedPostRepository;
    late ShareLauncher shareLauncher;
    late FeedVoteModel voteModel;

    setUp(() {
      feedRepository = _MockFeedRepository();
      voteRepository = _MockVoteRepository();
      visitedPostRepository = _MockVisitedPostRepository();
      shareLauncher = _MockShareLauncher();
      voteModel = _MockFeedVoteModel();
      when(() => visitedPostRepository.state).thenReturn(
        VisitedPostState(items: visitedPosts),
      );
    });

    FeedBloc buildBloc() {
      return FeedBloc(
        type: type,
        feedRepository: feedRepository,
        voteRepository: voteRepository,
        visitedPostRepository: visitedPostRepository,
        shareLauncher: shareLauncher,
        voteModel: voteModel,
      );
    }

    test('initial state is $FeedState', () {
      expect(buildBloc().state, initialState);
    });

    group(FeedVoteSubscriptionRequested, () {
      final repositoryState = VoteSuccess(
        vote: VotePlaceholder(),
      );

      final state = initialState.copyWith(
        feed: _MockPaginatedFeedModel(),
      );

      final updatedFeed = _MockPaginatedFeedModel();

      final updateFeed = () => voteModel.updateFeed(
        vote: repositoryState.vote,
        feed: state.feed,
      );

      blocTest<FeedBloc, FeedState>(
        'emits updated feed when repository emits $VoteSuccess',
        setUp: () {
          when(() => voteRepository.stream).thenAnswer(
            (_) => Stream.value(repositoryState),
          );
          when(updateFeed).thenReturn(updatedFeed);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedVoteSubscriptionRequested(),
          );
        },
        expect: () => [
          state.copyWith(
            feed: updatedFeed,
          ),
        ],
        verify: (_) {
          verify(updateFeed).called(1);
        },
      );
    });

    group(FeedVisitedPostSubscriptionRequested, () {
      final updatedRepositoryState = VisitedPostState(
        items: {'id'},
      );

      blocTest<FeedBloc, FeedState>(
        'emits updated feed when repository emits $VoteSuccess',
        setUp: () {
          when(() => visitedPostRepository.stream).thenAnswer(
            (_) => Stream.value(updatedRepositoryState),
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedVisitedPostSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(
            visitedPosts: updatedRepositoryState.items,
          ),
        ],
      );
    });

    group(FeedStarted, () {
      final request = () => feedRepository.fetchMore(
        PaginatedFeed.initial(type),
      );

      final feed = PaginatedFeedPlaceholder(
        items: [
          FeedItemPlaceholder(),
        ],
      );

      blocTest<FeedBloc, FeedState>(
        'emits [success] and $PaginatedFeedModel '
        'when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async => feed);
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedStarted(),
          );
        },
        expect: () => [
          initialState.copyWith(
            fetchStatus: FetchStatus.success,
            feed: PaginatedFeedModel.fromRepository(feed),
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<FeedBloc, FeedState>(
        'emits [failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedStarted(),
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

    group(FeedBottomReached, () {
      final feed = _MockPaginatedFeedModel();

      final initialRepositoryFeed = PaginatedFeedPlaceholder(
        items: [
          FeedItemPlaceholder(),
        ],
      );

      final updatedRepositoryFeed = PaginatedFeedPlaceholder(
        items: [
          FeedItemPlaceholder(),
          FeedItemPlaceholder(),
        ],
      );

      final state = initialState.copyWith(
        feed: feed,
        fetchStatus: FetchStatus.success,
      );

      final request = () => feedRepository.fetchMore(initialRepositoryFeed);

      blocTest<FeedBloc, FeedState>(
        'emits [loading, success] and $PaginatedFeedModel '
        'when request succeeds',
        setUp: () {
          when(feed.toRepository).thenReturn(initialRepositoryFeed);
          when(request).thenAnswer((_) async => updatedRepositoryFeed);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedBottomReached(),
          );
        },
        expect: () => [
          state.copyWith(
            fetchStatus: FetchStatus.loading,
          ),
          state.copyWith(
            fetchStatus: FetchStatus.success,
            feed: PaginatedFeedModel.fromRepository(updatedRepositoryFeed),
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<FeedBloc, FeedState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(feed.toRepository).thenReturn(initialRepositoryFeed);
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedBottomReached(),
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

    group(FeedItemPressed, () {
      final item = FeedItemModel(
        FeedItemPlaceholder(),
      );

      final addVisitedPost = () =>
          visitedPostRepository.addVisitedPost(item.id);

      blocTest<FeedBloc, FeedState>(
        'emits $ItemPress and updates visited posts',
        setUp: () {
          when(addVisitedPost).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedItemPressed(item),
          );
        },
        expect: () => [
          isA<FeedState>().having(
            (state) => state.itemPress,
            'itemPress',
            isA<ItemPress>()
                .having(
                  (press) => press.id,
                  'id',
                  item.id,
                )
                .having(
                  (press) => press.urlHost,
                  'urlHost',
                  item.urlHost,
                )
                .having(
                  (press) => press.url,
                  'title',
                  item.url,
                ),
          ),
        ],
        verify: (_) {
          verify(addVisitedPost).called(1);
        },
      );
    });

    group(FeedItemVotePressed, () {
      final item = FeedItemModel(
        FeedItemPlaceholder(),
      );

      final vote = () => voteRepository.vote(
        upvoteUrl: item.upvoteUrl,
        hasBeenUpvoted: item.hasBeenUpvoted,
      );

      blocTest<FeedBloc, FeedState>(
        'calls vote',
        setUp: () {
          when(vote).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedItemVotePressed(item),
          );
        },
        verify: (_) {
          verify(vote).called(1);
        },
      );
    });

    group(FeedItemSharePressed, () {
      const text = 'text';
      final share = () => shareLauncher.share(text: text);

      blocTest<FeedBloc, FeedState>(
        'calls share',
        setUp: () {
          when(share).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedItemSharePressed(text: text),
          );
        },
        verify: (_) {
          verify(share).called(1);
        },
      );
    });

    group(FeedRefreshTriggered, () {
      final request = () => feedRepository.fetchMore(
        PaginatedFeed.initial(type),
      );

      final feed = PaginatedFeedPlaceholder(
        items: [
          FeedItemPlaceholder(),
        ],
      );

      final state = initialState.copyWith(
        fetchStatus: FetchStatus.success,
      );

      blocTest<FeedBloc, FeedState>(
        'emits [loading, success] and $PaginatedFeedModel '
        'when request succeeds',
        setUp: () {
          when(request).thenAnswer((_) async => feed);
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedRefreshTriggered(),
          );
        },
        expect: () => [
          state.copyWith(
            refreshStatus: RefreshStatus.loading,
          ),
          state.copyWith(
            refreshStatus: RefreshStatus.success,
            fetchStatus: FetchStatus.success,
            feed: PaginatedFeedModel.fromRepository(feed),
          ),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<FeedBloc, FeedState>(
        'emits [loading, failure] when request throws',
        setUp: () {
          when(request).thenThrow(Exception('oops'));
        },
        seed: () => state,
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            FeedRefreshTriggered(),
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
  });
}
