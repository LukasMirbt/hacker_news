import 'package:app/comment_options/comment_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockOtherUserComment extends Mock implements OtherUserComment {}

void main() {
  group(OtherUserCommentModel, () {
    late OtherUserComment comment;

    setUp(() {
      comment = _MockOtherUserComment();
    });

    OtherUserCommentModel createSubject() {
      return OtherUserCommentModel(comment);
    }

    test('is a $CommentModel', () {
      expect(
        createSubject(),
        isA<CommentModel>(),
      );
    });
  });
}
