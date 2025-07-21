import 'package:flutter_test/flutter_test.dart';

import '../../../lib/reply_parser.dart';

void main() {
  group(ReplyFormTitleRowData, () {
    group('fromParsed', () {
      test('returns $ReplyFormTitleRowData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);

        expect(
          ReplyFormTitleRowData.fromParsed(
            id: id,
            hnuser: hnuser,
            age: age,
          ),
          ReplyFormTitleRowData(
            id: id,
            hnuser: hnuser,
            age: age,
          ),
        );
      });

      test('returns $ReplyFormTitleRowData with correct values '
          'when data is null', () {
        expect(
          ReplyFormTitleRowData.fromParsed(
            id: null,
            age: null,
            hnuser: null,
          ),
          ReplyFormTitleRowData(
            id: '',
            hnuser: Hnuser.empty,
            age: DateTime(0),
          ),
        );
      });
    });

    group('empty', () {
      test('returns $ReplyFormTitleRowData', () {
        expect(
          ReplyFormTitleRowData.empty,
          isA<ReplyFormTitleRowData>(),
        );
      });
    });
  });
}
