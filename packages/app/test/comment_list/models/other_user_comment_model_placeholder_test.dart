import 'package:app/comment_list/comment_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(OtherUserCommentModelPlaceholder, () {
    group('unnamed constructor', () {
      test('returns $OtherUserCommentModel', () {
        expect(
          OtherUserCommentModelPlaceholder(
            comment: OtherUserCommentPlaceholder(),
          ),
          isA<OtherUserCommentModel>(),
        );
      });
    });

    group('from', () {
      test('returns $OtherUserCommentModelPlaceholder '
          'when index.isEven', () {
        expect(
          OtherUserCommentModelPlaceholder.from(0),
          isA<OtherUserCommentModelPlaceholder>(),
        );
      });

      test('returns $OtherUserCommentModelPlaceholder '
          'when !index.isEven', () {
        expect(
          OtherUserCommentModelPlaceholder.from(1),
          isA<OtherUserCommentModelPlaceholder>(),
        );
      });
    });
  });
}
