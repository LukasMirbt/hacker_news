import 'package:app/comment_list/comment_list.dart';

class CommentListModelPlaceholder extends CommentListModel {
  CommentListModelPlaceholder()
    : super(
        items: List.generate(
          10,
          OtherUserCommentModelPlaceholder.from,
        ),
      );
}
