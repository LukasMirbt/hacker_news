// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:reply_api/reply_api.dart';

void main() {
  group(ReplyFormPlaceholder, () {
    test('returns $ReplyForm', () {
      expect(
        ReplyFormPlaceholder(),
        isA<ReplyForm>(),
      );
    });
  });
}
