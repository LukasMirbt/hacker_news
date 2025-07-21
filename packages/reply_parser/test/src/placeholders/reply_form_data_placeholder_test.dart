import 'package:flutter_test/flutter_test.dart';

import '../../../lib/reply_parser.dart';

void main() {
  group(ReplyFormDataPlaceholder, () {
    test('returns $ReplyFormData', () {
      expect(
        ReplyFormDataPlaceholder(),
        isA<ReplyFormData>(),
      );
    });
  });
}
