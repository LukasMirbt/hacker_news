import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(CurrentUserReplyParentDataPlaceholder, () {
    test('returns $CurrentUserReplyParentData', () {
      expect(
        CurrentUserReplyParentDataPlaceholder(),
        isA<CurrentUserReplyParentData>(),
      );
    });
  });
}
