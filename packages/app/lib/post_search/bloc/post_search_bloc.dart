import 'package:app/post_search/post_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_search_repository/post_search_repository.dart';

class PostSearchBloc extends Bloc<PostSearchEvent, PostSearchState> {
  PostSearchBloc({
    required PostRepository postRepository,
    required PostSearchRepository postSearchRepository,
  }) : _postRepository = postRepository,
       _postSearchRepository = postSearchRepository,
       super(
         PostSearchState.initial(
           status: postRepository.state.fetchStatus,
           comments: postRepository.state.post.comments,
           query: postSearchRepository.query,
         ),
       ) {
    on<PostSearchSubscriptionRequested>(
      _onCommentListSubscriptionRequested,
    );
    on<PostSearchQueryChanged>(_onQueryChanged);
    on<PostSearchItemPressed>(_onItemPressed);
    on<PostSearchCleared>(_onCleared);
  }

  final PostRepository _postRepository;
  final PostSearchRepository _postSearchRepository;

  Future<void> _onCommentListSubscriptionRequested(
    PostSearchSubscriptionRequested event,
    Emitter<PostSearchState> emit,
  ) {
    return emit.forEach(
      _postRepository.stream,
      onData: (repositoryState) {
        return state.copyWith(
          status: repositoryState.fetchStatus,
          resultList: state.resultList.copyWith(
            comments: repositoryState.post.comments,
          ),
        );
      },
    );
  }

  void _onQueryChanged(
    PostSearchQueryChanged event,
    Emitter<PostSearchState> emit,
  ) {
    final query = event.query;

    emit(
      state.copyWith.resultList(
        query: query,
      ),
    );

    _postSearchRepository.update(
      query: query,
    );
  }

  void _onItemPressed(
    PostSearchItemPressed event,
    Emitter<PostSearchState> emit,
  ) {
    final id = event.result.id;
    _postSearchRepository.select(id: id);
  }

  void _onCleared(
    PostSearchCleared event,
    Emitter<PostSearchState> emit,
  ) {
    emit(
      state.copyWith.resultList(
        query: '',
      ),
    );

    _postSearchRepository.clear();
  }
}
