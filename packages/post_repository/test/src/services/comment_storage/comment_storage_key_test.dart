// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  const parentId = 'parentId';
  const userId = 'userId';

  group(CommentStorageKey, () {
    CommentStorageKey createSubject() {
      return CommentStorageKey(
        parentId: parentId,
        userId: userId,
      );
    }

    group('value', () {
      test('returns correct value', () {
        final storageKey = createSubject();
        expect(storageKey.key, '$parentId:$userId');
      });
    });
  });
}
