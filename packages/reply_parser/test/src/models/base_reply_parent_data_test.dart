import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(BaseReplyParentData, () {
    group('fromParsed', () {
      test('returns $BaseReplyParentData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const htmlText = 'htmlText';

        expect(
          BaseReplyParentData.fromParsed(
            id: id,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
          BaseReplyParentData(
            id: id,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
        );
      });

      test('returns $BaseReplyParentData with correct values '
          'when data is null', () {
        expect(
          BaseReplyParentData.fromParsed(
            id: null,
            hnuser: null,
            age: null,
            htmlText: null,
          ),
          BaseReplyParentData(
            id: '',
            hnuser: Hnuser.empty,
            age: DateTime(0),
            htmlText: '',
          ),
        );
      });
    });
  });
}
