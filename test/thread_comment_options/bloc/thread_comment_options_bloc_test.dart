import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  final comment = OtherUserThreadCommentPlaceholder();

  group(ThreadCommentOptionsBloc, () {
    ThreadCommentOptionsBloc buildBloc() {
      return ThreadCommentOptionsBloc(comment: comment);
    }

    test('initial state is $ThreadCommentOptionsState', () {
      expect(
        buildBloc().state,
        ThreadCommentOptionsState.from(comment),
      );
    });
  });
}
