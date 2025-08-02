import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(BaseReplyParentDataPlaceholder, () {
    test('returns $BaseReplyParentData', () {
      expect(
        BaseReplyParentDataPlaceholder(),
        isA<BaseReplyParentData>(),
      );
    });
  });
}
