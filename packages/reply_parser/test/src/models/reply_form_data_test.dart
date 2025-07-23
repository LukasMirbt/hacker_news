// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(ReplyFormData, () {
    group('fromParsed', () {
      test('returns $ReplyFormData with correct values '
          'when data is non-null', () {
        const parent = 'parent';
        const goto = 'goto';
        const hmac = 'hmac';

        expect(
          ReplyFormData.fromParsed(
            parent: parent,
            goto: goto,
            hmac: hmac,
          ),
          ReplyFormData(
            parent: parent,
            goto: goto,
            hmac: hmac,
          ),
        );
      });

      test('returns $ReplyFormData with correct values '
          'when data is null', () {
        expect(
          ReplyFormData.fromParsed(
            parent: null,
            goto: null,
            hmac: null,
          ),
          ReplyFormData(
            parent: '',
            goto: '',
            hmac: '',
          ),
        );
      });
    });

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
