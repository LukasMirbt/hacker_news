import 'package:app/post_search/post_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostSearchBloc extends Bloc<PostSearchEvent, PostSearchState> {
  PostSearchBloc({
    required PostRepository postRepository,
  }) : _repository = postRepository,
       super(
         PostSearchState.initial(
           comments: postRepository.state.post.comments,
           query: postRepository.state.searchQuery,
         ),
       ) {
    on<PostSearchCommentListSubscriptionRequested>(
      _onCommentListSubscriptionRequested,
    );
    on<PostSearchQueryChanged>(_onQueryChanged);
    on<PostSearchItemPressed>(_onItemPressed);
  }

  final PostRepository _repository;

  Future<void> _onCommentListSubscriptionRequested(
    PostSearchCommentListSubscriptionRequested event,
    Emitter<PostSearchState> emit,
  ) {
    return emit.forEach(
      _repository.stream,
      onData: (repositoryState) {
        return state.copyWith.resultList(
          comments: repositoryState.post.comments,
        );
      },
    );
  }

  void _onQueryChanged(
    PostSearchQueryChanged event,
    Emitter<PostSearchState> emit,
  ) {
    emit(
      state.copyWith.resultList(
        query: event.query,
      ),
    );

    _repository.search(event.query);
  }

  void _onItemPressed(
    PostSearchItemPressed event,
    Emitter<PostSearchState> emit,
  ) {
    _repository.selectComment(
      event.result.toRepository(),
    );
  }
}
