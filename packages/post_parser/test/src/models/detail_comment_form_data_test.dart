// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(DetailCommentFormData, () {
    group('fromParsed', () {
      test('returns $DetailCommentFormData with correct values '
          'when data is non-null', () {
        const parent = 'parent';
        const goto = 'goto';
        const hmac = 'hmac';

        expect(
          DetailCommentFormData.fromParsed(
            parent: parent,
            goto: goto,
            hmac: hmac,
          ),
          DetailCommentFormData(
            parent: parent,
            goto: goto,
            hmac: hmac,
          ),
        );
      });

      test('returns $DetailCommentFormData with correct values '
          'when data is null', () {
        expect(
          DetailCommentFormData.fromParsed(
            parent: null,
            goto: null,
            hmac: null,
          ),
          DetailCommentFormData(
            parent: '',
            goto: '',
            hmac: '',
          ),
        );
      });
    });

    group('empty', () {
      test('returns $DetailCommentFormData', () {
        expect(
          DetailCommentFormData.empty,
          isA<DetailCommentFormData>(),
        );
      });
    });
  });
}
