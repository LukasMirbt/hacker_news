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

  List<Comment> get results {
    return [
      for (final comment in comments)
        if (query.isEmpty)
          comment
        else if (comment.htmlText.toLowerCase().contains(query.toLowerCase()))
          comment,
    ];
  }
}
