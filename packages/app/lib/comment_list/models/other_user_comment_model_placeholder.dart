import 'package:app/comment_list/comment_list.dart';
import 'package:post_repository/post_repository.dart';

class OtherUserCommentModelPlaceholder extends OtherUserCommentModel {
  const OtherUserCommentModelPlaceholder({
    required super.comment,
  });

  factory OtherUserCommentModelPlaceholder.from(int index) {
    if (index.isEven) {
      return _EvenPlaceholder();
    } else {
      return _OddPlaceholder();
    }
  }
}

class _EvenPlaceholder extends OtherUserCommentModelPlaceholder {
  _EvenPlaceholder()
    : super(
        comment: OtherUserCommentPlaceholder(
          indent: 0,
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
      );
}

class _OddPlaceholder extends OtherUserCommentModelPlaceholder {
  _OddPlaceholder()
    : super(
        comment: OtherUserCommentPlaceholder(
          indent: 1,
          htmlText: '''
                  Lorem ipsum dolor sit amet, consectetur, sed
                  do eiusmod tempor incididunt ut labore et dolore
                  magna aliqua. Ut enim ad minim veniam, quis''',
        ),
      );
}
