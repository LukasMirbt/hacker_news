import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:vote_repository/vote_repository.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({
    required FeedType type,
    required FeedRepository feedRepository,
    required VoteRepository voteRepository,
    ShareLauncher? shareLauncher,
    FeedVoteModel? voteModel,
  }) : _feedRepository = feedRepository,
       _voteRepository = voteRepository,
       _shareLauncher = shareLauncher ?? ShareLauncher(),
       _voteModel = voteModel ?? const FeedVoteModel(),
       super(
         FeedState.initial(type),
       ) {
    on<FeedVoteSubscriptionRequested>(
      _onVoteSubscriptionRequested,
    );
    on<FeedStarted>(_onStarted);
    on<FeedItemPressed>(_onItemPressed);
    on<FeedItemVotePressed>(_onItemVotePressed);
    on<FeedItemSharePressed>(_onItemSharePressed);
    on<FeedBottomReached>(_onBottomReached);
    on<FeedRefreshTriggered>(_onRefreshTriggered);
  }

  final FeedRepository _feedRepository;
  final VoteRepository _voteRepository;
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

  Future<void> _onBottomReached(
    FeedBottomReached event,
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

  void _onItemPressed(
    FeedItemPressed event,
    Emitter<FeedState> emit,
  ) {
    final item = event.item;

    emit(
      state.copyWith(
        itemPress: ItemPress(
          id: item.id,
          urlHost: item.urlHost,
          url: item.url,
        ),
      ),
    );
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
}
