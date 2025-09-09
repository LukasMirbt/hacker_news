import 'package:app/comment_list/comment_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'comment_list_state.freezed.dart';

@freezed
abstract class CommentListState with _$CommentListState {
  const factory CommentListState({
    required String id,
    required CommentListModel commentList,
    SelectedComment? selectedComment,
  }) = _CommentListState;

  factory CommentListState.initial({
    required String id,
  }) {
    return CommentListState(
      id: id,
      commentList: CommentListModelPlaceholder(),
    );
  }

  const CommentListState._();

  bool isSelected(CommentModel comment) {
    final selected = selectedComment;
    if (selected == null) return false;
    return selected.comment.id == comment.id;
  }
}
