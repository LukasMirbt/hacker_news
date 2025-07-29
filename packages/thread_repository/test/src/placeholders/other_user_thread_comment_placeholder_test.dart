import 'package:flutter_test/flutter_test.dart';
import 'package:thread_repository/thread_repository.dart';

void main() {
  group(OtherUserThreadCommentPlaceholder, () {
    test('returns $OtherUserThreadComment', () {
      expect(
        OtherUserThreadCommentPlaceholder(),
        isA<OtherUserThreadComment>(),
      );
    });
  });
}
