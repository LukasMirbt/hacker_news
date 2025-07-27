// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  const parentId = 'parentId';
  const userId = 'userId';

  group(ReplyStorageKey, () {
    ReplyStorageKey createSubject() {
      return ReplyStorageKey(
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
