// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

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
