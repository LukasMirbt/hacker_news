import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/post/post.dart';
import 'package:post_repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({
    required String id,
    required PostRepository postRepository,
  }) : _repository = postRepository,
       super(
         PostState(id: id),
       ) {
    on<PostSubscriptionRequested>(
      _onSubscriptionRequested,
    );
    on<PostStarted>(_onStarted);
    on<PostRefreshTriggered>(_onRefreshTriggered);
  }

  final PostRepository _repository;

  Future<void> _onSubscriptionRequested(
    PostSubscriptionRequested event,
    Emitter<PostState> emit,
  ) async {
    return emit.forEach(
      _repository.stream,
      onData: (_) => state.copyWith(
        fetchStatus: FetchStatus.success,
      ),
    );
  }

  Future<void> _onStarted(
    PostStarted event,
    Emitter<PostState> emit,
  ) async {
    try {
      await _repository.fetchPostStream(id: state.id);
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
    PostRefreshTriggered event,
    Emitter<PostState> emit,
  ) async {
    emit(
      state.copyWith(
        refreshStatus: RefreshStatus.loading,
      ),
    );

    try {
      await _repository.fetchPost(id: state.id);

      emit(
        state.copyWith(
          refreshStatus: RefreshStatus.success,
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
