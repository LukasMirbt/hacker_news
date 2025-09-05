import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(ThreadCommentOptionsState, () {
    group('from', () {
      test('returns $ThreadCommentOptionsState', () {
        final comment = OtherUserThreadCommentPlaceholder();
        expect(
          ThreadCommentOptionsState.from(comment),
          ThreadCommentOptionsState(
            comment: ThreadCommentModel.from(comment),
          ),
        );
      });
    });
  });
}
