import 'package:flutter_test/flutter_test.dart';
import 'package:reply_form_parser/reply_form_parser.dart';

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
