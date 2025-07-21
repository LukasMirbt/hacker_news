import 'package:flutter_test/flutter_test.dart';

import '../../../lib/reply_parser.dart';

void main() {
  group(ReplyFormTitleRowDataPlaceholder, () {
    test('returns $ReplyFormTitleRowData', () {
      expect(
        ReplyFormTitleRowDataPlaceholder(),
        isA<ReplyFormTitleRowData>(),
      );
    });
  });
}
