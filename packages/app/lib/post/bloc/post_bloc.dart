import 'package:app/post/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({
    required String id,
    required PostRepository postRepository,
  }) : _repository = postRepository,
       super(
         PostState.from(
           id: id,
           postRepository: postRepository,
         ),
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
      onData: (repositoryState) => state.copyWith(
        fetchStatus: repositoryState.fetchStatus,
        refreshStatus: repositoryState.refreshStatus,
      ),
    );
  }

  void _onStarted(
    PostStarted event,
    Emitter<PostState> emit,
  ) {
    _repository.fetchPostStream(id: state.id);
  }

  void _onRefreshTriggered(
    PostRefreshTriggered event,
    Emitter<PostState> emit,
  ) {
    _repository.refreshPost(id: state.id);
  }
}
