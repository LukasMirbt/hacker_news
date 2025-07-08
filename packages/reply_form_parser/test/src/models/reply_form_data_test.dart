import 'package:flutter_test/flutter_test.dart';
import 'package:reply_form_parser/reply_form_parser.dart';

void main() {
  group(ReplyFormData, () {
    group('empty', () {
      test('returns $ReplyFormData', () {
        expect(
          ReplyFormData.empty,
          isA<ReplyFormData>(),
        );
      });
    });
  });
}
