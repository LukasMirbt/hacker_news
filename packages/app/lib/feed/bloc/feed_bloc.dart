import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:vote_repository/vote_repository.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({
    required FeedType type,
    required FeedRepository feedRepository,
    required VoteRepository voteRepository,
    required LinkLauncher linkLauncher,
    ShareLauncher? shareLauncher,
    FeedVoteModel? voteModel,
  }) : _feedRepository = feedRepository,
       _voteRepository = voteRepository,
       _linkLauncher = linkLauncher,
       _shareLauncher = shareLauncher ?? ShareLauncher(),
       _voteModel = voteModel ?? const FeedVoteModel(),
       super(
         FeedState.initial(
           type: type,
           visitedPosts: feedRepository.readVisitedPosts(),
         ),
       ) {
    on<FeedVoteSubscriptionRequested>(
      _onVoteSubscriptionRequested,
    );
    on<FeedVisitedPostSubscriptionRequested>(
      _onVisitedPostSubscriptionRequested,
    );
    on<FeedStarted>(_onStarted);
    on<FeedDataFetched>(_onDataFetched);
    on<FeedRefreshTriggered>(_onRefreshTriggered);
    on<FeedItemPressed>(_onItemPressed);
    on<FeedItemLinkLaunched>(_onItemLinkLaunched);
    on<FeedItemVotePressed>(_onItemVotePressed);
    on<FeedItemSharePressed>(_onItemSharePressed);
  }

  final FeedRepository _feedRepository;
  final VoteRepository _voteRepository;
  final LinkLauncher _linkLauncher;
  final ShareLauncher _shareLauncher;
  final FeedVoteModel _voteModel;

  Future<void> _onVoteSubscriptionRequested(
    FeedVoteSubscriptionRequested event,
    Emitter<FeedState> emit,
  ) {
    return emit.onEach(
      _voteRepository.stream,
      onData: (repositoryState) {
        if (repositoryState is VoteSuccess) {
          emit(
            state.copyWith(
              feed: _voteModel.updateFeed(
                vote: repositoryState.vote,
                feed: state.feed,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _onVisitedPostSubscriptionRequested(
    FeedVisitedPostSubscriptionRequested event,
    Emitter<FeedState> emit,
  ) {
    return emit.onEach(
      _feedRepository.visitedPosts,
      onData: (visitedPosts) {
        emit(
          state.copyWith(
            visitedPosts: visitedPosts,
          ),
        );
      },
    );
  }

  Future<void> _onStarted(
    FeedStarted event,
    Emitter<FeedState> emit,
  ) async {
    try {
      final feed = await _feedRepository.fetchMore(
        PaginatedFeed.initial(state.type),
      );

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          feed: PaginatedFeedModel.fromRepository(feed),
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
    }
  }

  Future<void> _onDataFetched(
    FeedDataFetched event,
    Emitter<FeedState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchStatus: FetchStatus.loading,
      ),
    );

    try {
      final feed = await _feedRepository.fetchMore(
        state.feed.toRepository(),
      );

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          feed: PaginatedFeedModel.fromRepository(feed),
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          fetchStatus: FetchStatus.failure,
        ),
      );
    }
  }

  Future<void> _onRefreshTriggered(
    FeedRefreshTriggered event,
    Emitter<FeedState> emit,
  ) async {
    emit(
      state.copyWith(
        refreshStatus: RefreshStatus.loading,
      ),
    );

    try {
      final feed = await _feedRepository.fetchMore(
        PaginatedFeed.initial(state.type),
      );

      emit(
        state.copyWith(
          refreshStatus: RefreshStatus.success,
          fetchStatus: FetchStatus.success,
          feed: PaginatedFeedModel.fromRepository(feed),
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          refreshStatus: RefreshStatus.failure,
        ),
      );
    }
  }

  void _onItemPressed(
    FeedItemPressed event,
    Emitter<FeedState> emit,
  ) {
    final item = event.item;
    final id = item.id;

    emit(
      state.copyWith(
        itemPress: ItemPress(
          id: id,
          urlHost: item.urlHost,
          url: item.url,
        ),
      ),
    );

    _feedRepository.addVisitedPost(id);
  }

  void _onItemLinkLaunched(
    FeedItemLinkLaunched event,
    Emitter<FeedState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }

  void _onItemVotePressed(
    FeedItemVotePressed event,
    Emitter<FeedState> emit,
  ) {
    _voteRepository.vote(
      upvoteUrl: event.item.upvoteUrl,
      hasBeenUpvoted: event.item.hasBeenUpvoted,
    );
  }

  void _onItemSharePressed(
    FeedItemSharePressed event,
    Emitter<FeedState> emit,
  ) {
    _shareLauncher.share(text: event.text);
  }
}
