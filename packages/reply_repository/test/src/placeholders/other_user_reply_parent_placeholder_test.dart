import 'package:flutter_test/flutter_test.dart';
import 'package:reply_repository/reply_repository.dart';

void main() {
  group(OtherUserReplyParentPlaceholder, () {
    test('returns $OtherUserReplyParent', () {
      expect(
        OtherUserReplyParentPlaceholder(),
        isA<OtherUserReplyParent>(),
      );
    });
  });
}
