import 'package:flutter_test/flutter_test.dart';
import 'package:post_parser/post_parser.dart';

void main() {
  group(BaseCommentData, () {
    group('fromParsed', () {
      test('returns $BaseCommentData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const indent = 1;
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const htmlText = 'htmlText';
        const replyUrl = 'replyUrl';

        expect(
          BaseCommentData.fromParsed(
            id: id,
            indent: indent,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            replyUrl: replyUrl,
          ),
          BaseCommentData(
            id: id,
            indent: indent,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            replyUrl: replyUrl,
          ),
        );
      });

      test('returns $BaseCommentData with correct values '
          'when data is null', () {
        expect(
          BaseCommentData.fromParsed(
            id: null,
            indent: null,
            hnuser: null,
            age: null,
            htmlText: null,
            replyUrl: null,
          ),
          BaseCommentData(
            id: '',
            indent: 0,
            hnuser: Hnuser.empty,
            age: DateTime(0),
            htmlText: '',
            replyUrl: null,
          ),
        );
      });
    });
  });
}
