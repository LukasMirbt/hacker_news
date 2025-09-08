import 'package:app/post_search/post_search.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'post_search_state.freezed.dart';

@freezed
abstract class PostSearchState with _$PostSearchState {
  const factory PostSearchState({
    required List<Comment> comments,
    @Default('') String query,
  }) = _PostSearchState;

  const PostSearchState._();

  List<SearchResult> get results {
    if (query.isEmpty) return [];

    final allResults = [
      for (final comment in comments)
        SearchResult(
          comment: comment,
        ),
    ];

    final matchedResults = [
      for (final result in allResults)
        if (result.text.toLowerCase().contains(query.toLowerCase())) result,
    ];

    return matchedResults;
  }
}
