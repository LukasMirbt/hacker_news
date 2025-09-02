import 'package:app/comment_list/comment_list.dart';
import 'package:post_repository/post_repository.dart' as repository;

class CommentListModelPlaceholder extends CommentListModel {
  CommentListModelPlaceholder()
    : super(
        items: List.filled(
          10,
          OtherUserCommentModel(
            comment: repository.OtherUserCommentPlaceholder(
              htmlText: '''
                  Lorem ipsum dolor sit amet, consectetur, sed
                  do eiusmod tempor incididunt ut labore et dolore
                  magna aliqua. Ut enim ad minim veniam, quis<p>nostrud
                  exercitation ullamco laboris nisi ut aliquip(ex ea commodo
                  consequat. Duis auto irure dolor in reprehenderit in
                  voluptate velit) esse cillum dolore eu fugiat,
                  nulla parriatur. Excepteur sint occaecat cupidatat
                  non proident, sunt in culpa officia deserunt.</p>''',
            ),
          ),
        ),
      );
}
