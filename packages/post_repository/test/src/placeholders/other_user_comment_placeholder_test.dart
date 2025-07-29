import 'package:flutter_test/flutter_test.dart';
import 'package:post_repository/post_repository.dart';

void main() {
  group(OtherUserCommentPlaceholder, () {
    test('returns $OtherUserComment', () {
      expect(
        OtherUserCommentPlaceholder(),
        isA<OtherUserComment>(),
      );
    });
  });
}
