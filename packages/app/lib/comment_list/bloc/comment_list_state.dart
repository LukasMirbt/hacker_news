import 'package:app/comment_list/comment_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_list_state.freezed.dart';

@freezed
abstract class CommentListState with _$CommentListState {
  const factory CommentListState({
    required String id,
    required CommentListModel commentList,
  }) = _CommentListState;

  factory CommentListState.initial({
    required String id,
  }) {
    return CommentListState(
      id: id,
      commentList: CommentListModelPlaceholder(),
    );
  }
}
