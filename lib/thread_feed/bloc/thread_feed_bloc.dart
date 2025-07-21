import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class ThreadFeedBloc extends Bloc<ThreadFeedEvent, ThreadFeedState> {
  ThreadFeedBloc({
    required ThreadRepository threadRepository,
    required AuthenticationRepository authenticationRepository,
    required VoteRepository voteRepository,
    required ReplyRepository replyRepository,
    ThreadFeedVoteModel? voteModel,
    ThreadFeedReplyModel? replyModel,
    LinkLauncher? linkLauncher,
  }) : _threadRepository = threadRepository,
       _authenticationRepository = authenticationRepository,
       _voteRepository = voteRepository,
       _replyRepository = replyRepository,
       _voteModel = voteModel ?? const ThreadFeedVoteModel(),
       _replyModel = replyModel ?? const ThreadFeedReplyModel(),
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         ThreadFeedState.initial(),
       ) {
    on<ThreadFeedVoteSubscriptionRequested>(
      _onVoteSubscriptionRequested,
    );
    on<ThreadFeedReplySubscriptionRequested>(
      _onReplySubscriptionRequested,
    );
    on<ThreadFeedStarted>(_onStarted);
    on<ThreadFeedDataFetched>(_onDataFetched);
    on<ThreadFeedRefreshTriggered>(_onRefreshTriggered);
    on<ThreadFeedItemExpansionToggled>(_onItemExpansionToggled);
    on<ThreadFeedItemVotePressed>(_onItemVotePressed);
    on<ThreadFeedItemLinkPressed>(_onItemLinkPressed);
  }

  final ThreadRepository _threadRepository;
  final AuthenticationRepository _authenticationRepository;
  final VoteRepository _voteRepository;
  final ReplyRepository _replyRepository;
  final ThreadFeedVoteModel _voteModel;
  final ThreadFeedReplyModel _replyModel;
  final LinkLauncher _linkLauncher;

  Future<void> _onVoteSubscriptionRequested(
    ThreadFeedVoteSubscriptionRequested event,
    Emitter<ThreadFeedState> emit,
  ) async {
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

  Future<void> _onReplySubscriptionRequested(
    ThreadFeedReplySubscriptionRequested event,
    Emitter<ThreadFeedState> emit,
  ) async {
    return emit.onEach(
      _replyRepository.stream,
      onData: (update) {
        emit(
          state.copyWith(
            feed: _replyModel.updateFeed(
              user: _authenticationRepository.state.user,
              update: update,
              feed: state.feed,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onStarted(
    ThreadFeedStarted event,
    Emitter<ThreadFeedState> emit,
  ) async {
    try {
      final user = _authenticationRepository.state.user;

      final feed = await _threadRepository.fetchMore(
        PaginatedThreadFeed.initial(user),
      );

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          feed: PaginatedThreadFeedModel.fromRepository(feed),
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
    ThreadFeedDataFetched event,
    Emitter<ThreadFeedState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchStatus: FetchStatus.loading,
      ),
    );

    try {
      final extendedList = await _threadRepository.fetchMore(
        state.feed.toRepository(),
      );

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          feed: state.feed.rebuildWith(extendedList),
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
    ThreadFeedRefreshTriggered event,
    Emitter<ThreadFeedState> emit,
  ) async {
    emit(
      state.copyWith(
        refreshStatus: RefreshStatus.loading,
      ),
    );

    try {
      final user = _authenticationRepository.state.user;

      final repositoryList = await _threadRepository.fetchMore(
        PaginatedThreadFeed.initial(user),
      );

      emit(
        state.copyWith(
          refreshStatus: RefreshStatus.success,
          fetchStatus: FetchStatus.success,
          feed: state.feed.rebuildWith(repositoryList),
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

  void _onItemExpansionToggled(
    ThreadFeedItemExpansionToggled event,
    Emitter<ThreadFeedState> emit,
  ) {
    emit(
      state.copyWith(
        feed: state.feed.toggleExpansion(
          item: event.item,
        ),
      ),
    );
  }

  void _onItemVotePressed(
    ThreadFeedItemVotePressed event,
    Emitter<ThreadFeedState> emit,
  ) {
    final item = event.item;

    _voteRepository.vote(
      upvoteUrl: item.upvoteUrl,
      hasBeenUpvoted: item.hasBeenUpvoted,
    );
  }

  void _onItemLinkPressed(
    ThreadFeedItemLinkPressed event,
    Emitter<ThreadFeedState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }
}
