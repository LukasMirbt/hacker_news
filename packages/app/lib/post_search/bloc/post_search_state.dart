import 'package:app/post_search/post_search.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'post_search_state.freezed.dart';

@freezed
abstract class PostSearchState with _$PostSearchState {
  const factory PostSearchState({
    required FetchStatus status,
    required SearchResultListModel resultList,
  }) = _PostSearchState;

  factory PostSearchState.initial({
    required FetchStatus status,
    required List<Comment> comments,
    required String query,
  }) {
    return PostSearchState(
      status: status,
      resultList: SearchResultListModel(
        comments: comments,
        query: query,
      ),
    );
  }
}
