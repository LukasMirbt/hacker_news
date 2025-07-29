import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:post_repository/post_repository.dart' as repository;

class CommentListModelPlaceholder extends CommentListModel {
  CommentListModelPlaceholder()
    : super(
        items: List.filled(
          10,
          OtherUserCommentModel(
            comment: repository.OtherUserCommentPlaceholder(
              htmlText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Praesent vel urna vitae sapien ullamcorper facilisis. '
                  'Phasellus sit amet sapien non elit tincidunt euismod. '
                  'Integer ullamcorper, nisl at ultricies commodo, purus '
                  'justo vestibulum lectus, sit amet feugiat eros nulla ac '
                  'erat. Vestibulum convallis lacus vitae turpis placerat, '
                  'at tincidunt nisl odio.',
            ),
          ),
        ),
      );
}
