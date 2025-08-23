import 'package:app/comment_options/comment_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(CommentOptionsState, () {
    group('from', () {
      test('returns $CommentOptionsState', () {
        final comment = OtherUserCommentPlaceholder();
        expect(
          CommentOptionsState.from(comment),
          CommentOptionsState(
            comment: CommentModel(comment),
          ),
        );
      });
    });
  });
}
