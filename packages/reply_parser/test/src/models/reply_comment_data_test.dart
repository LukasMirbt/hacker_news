import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(ReplyCommentData, () {
    group('fromParsed', () {
      test('returns $ReplyCommentData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const htmlText = 'htmlText';

        expect(
          ReplyCommentData.fromParsed(
            id: id,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
          ReplyCommentData(
            id: id,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
          ),
        );
      });

      test('returns $ReplyCommentData with correct values '
          'when data is null', () {
        expect(
          ReplyCommentData.fromParsed(
            id: null,
            age: null,
            hnuser: null,
            htmlText: null,
          ),
          ReplyCommentData(
            id: '',
            hnuser: Hnuser.empty,
            age: DateTime(0),
            htmlText: '',
          ),
        );
      });
    });

    group('empty', () {
      test('returns $ReplyCommentData', () {
        expect(
          ReplyCommentData.empty,
          isA<ReplyCommentData>(),
        );
      });
    });
  });
}
