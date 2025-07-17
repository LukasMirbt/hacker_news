import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class ThreadListBloc extends Bloc<ThreadListEvent, ThreadListState> {
  ThreadListBloc({
    required ThreadRepository threadRepository,
    required AuthenticationRepository authenticationRepository,
    required VoteRepository voteRepository,
    ThreadListVoteModel? voteModel,
    LinkLauncher? linkLauncher,
  }) : _threadRepository = threadRepository,
       _authenticationRepository = authenticationRepository,
       _voteRepository = voteRepository,
       _voteModel = voteModel ?? const ThreadListVoteModel(),
       _linkLauncher = linkLauncher ?? const LinkLauncher(),
       super(
         ThreadListState.initial(),
       ) {
    on<ThreadListVoteSubscriptionRequested>(
      _onVoteSubscriptionRequested,
    );
    on<ThreadListStarted>(_onStarted);
    on<ThreadListExpansionToggled>(_onExpansionToggled);
    on<ThreadListBottomReached>(_onBottomReached);
    on<ThreadListRefreshTriggered>(_onRefreshTriggered);
    on<ThreadListLinkPressed>(_onLinkPressed);
  }

  final ThreadRepository _threadRepository;
  final AuthenticationRepository _authenticationRepository;
  final VoteRepository _voteRepository;
  final ThreadListVoteModel _voteModel;
  final LinkLauncher _linkLauncher;

  Future<void> _onVoteSubscriptionRequested(
    ThreadListVoteSubscriptionRequested event,
    Emitter<ThreadListState> emit,
  ) async {
    return emit.onEach(
      _voteRepository.stream,
      onData: (repositoryState) {
        if (repositoryState is VoteSuccess) {
          emit(
            state.copyWith(
              list: _voteModel.updateThreadList(
                vote: repositoryState.vote,
                threadList: state.list,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _onStarted(
    ThreadListStarted event,
    Emitter<ThreadListState> emit,
  ) async {
    try {
      final user = _authenticationRepository.state.user;

      final list = await _threadRepository.fetchMore(
        PaginatedThreadList.initial(user),
      );

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          list: ThreadListModel.fromRepository(list),
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

  void _onExpansionToggled(
    ThreadListExpansionToggled event,
    Emitter<ThreadListState> emit,
  ) {
    emit(
      state.copyWith(
        list: state.list.toggleExpansion(
          comment: event.comment,
        ),
      ),
    );
  }

  Future<void> _onBottomReached(
    ThreadListBottomReached event,
    Emitter<ThreadListState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchStatus: FetchStatus.loading,
      ),
    );

    try {
      final extendedList = await _threadRepository.fetchMore(
        state.list.toRepository(),
      );

      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          list: state.list.rebuildWith(
            repositoryList: extendedList,
            comments: extendedList.items,
          ),
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
    ThreadListRefreshTriggered event,
    Emitter<ThreadListState> emit,
  ) async {
    emit(
      state.copyWith(
        refreshStatus: RefreshStatus.loading,
      ),
    );

    try {
      final user = _authenticationRepository.state.user;

      final list = await _threadRepository.fetchMore(
        PaginatedThreadList.initial(user),
      );

      emit(
        state.copyWith(
          refreshStatus: RefreshStatus.success,
          fetchStatus: FetchStatus.success,
          list: state.list.rebuildWith(
            repositoryList: list,
            comments: list.items,
          ),
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

  void _onLinkPressed(
    ThreadListLinkPressed event,
    Emitter<ThreadListState> emit,
  ) {
    _linkLauncher.launch(event.url);
  }
}
