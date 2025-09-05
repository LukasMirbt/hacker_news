import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

class _MockOtherUserThreadComment extends Mock
    implements OtherUserThreadComment {}

void main() {
  group(OtherUserThreadCommentModel, () {
    late OtherUserThreadComment comment;

    setUp(() {
      comment = _MockOtherUserThreadComment();
    });

    OtherUserThreadCommentModel createSubject() {
      return OtherUserThreadCommentModel(comment);
    }

    test('is a $ThreadCommentModel', () {
      expect(
        createSubject(),
        isA<ThreadCommentModel>(),
      );
    });
  });
}
