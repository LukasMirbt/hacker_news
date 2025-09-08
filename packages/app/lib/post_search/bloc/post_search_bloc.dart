import 'package:app/post_search/post_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostSearchBloc extends Bloc<PostSearchEvent, PostSearchState> {
  PostSearchBloc({
    required PostRepository postRepository,
  }) : _postRepository = postRepository,
       super(
         PostSearchState(
           comments: postRepository.state.post.comments,
         ),
       ) {
    on<PostSearchCommentListSubscriptionRequested>(
      _onCommentListSubscriptionRequested,
    );
    on<PostSearchQueryChanged>(_onQueryChanged);
    on<PostSearchItemPressed>(_onItemPressed);
  }

  final PostRepository _postRepository;

  Future<void> _onCommentListSubscriptionRequested(
    PostSearchCommentListSubscriptionRequested event,
    Emitter<PostSearchState> emit,
  ) async {
    return emit.forEach(
      _postRepository.stream,
      onData: (repositoryState) => state.copyWith(
        comments: repositoryState.post.comments,
      ),
    );
  }

  void _onQueryChanged(
    PostSearchQueryChanged event,
    Emitter<PostSearchState> emit,
  ) {
    emit(
      state.copyWith(
        query: event.query,
      ),
    );
  }

  void _onItemPressed(
    PostSearchItemPressed event,
    Emitter<PostSearchState> emit,
  ) {
    _postRepository.selectComment(
      event.result.toRepository(),
    );
  }
}
