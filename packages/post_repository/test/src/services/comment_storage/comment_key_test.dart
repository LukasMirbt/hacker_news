// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  const postId = 'postId';
  const userId = 'userId';

  group(CommentKey, () {
    CommentKey createSubject() {
      return CommentKey(
        postId: postId,
        userId: userId,
      );
    }

    group('value', () {
      test('returns correct value', () {
        final key = createSubject();
        expect(key.value, '$postId:$userId');
      });
    });
  });
}
