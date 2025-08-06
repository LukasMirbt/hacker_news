import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(OtherUserReplyParentDataPlaceholder, () {
    test('returns $OtherUserReplyParentData', () {
      expect(
        OtherUserReplyParentDataPlaceholder(),
        isA<OtherUserReplyParentData>(),
      );
    });
  });
}
