// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:reply_api/reply_api.dart';

void main() {
  const parent = 'parent';
  const goto = 'goto';
  const hmac = 'hmac';
  const text = 'text';

  group(ReplyForm, () {
    ReplyForm createSubject() {
      return ReplyForm(
        parent: parent,
        goto: goto,
        hmac: hmac,
        text: text,
      );
    }

    group('toData', () {
      test('returns correct data', () {
        final form = createSubject();
        expect(
          form.toData(),
          {
            'parent': parent,
            'goto': goto,
            'hmac': hmac,
            'text': text,
          },
        );
      });
    });

    test('is equatable', () {
      final first = createSubject();
      final second = createSubject();
      expect(first == second, true);
    });
  });
}
