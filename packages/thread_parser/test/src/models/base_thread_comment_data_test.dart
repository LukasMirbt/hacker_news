import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(BaseThreadCommentData, () {
    group('fromParsed', () {
      test('returns $BaseThreadCommentData with correct values '
          'when data is non-null', () {
        const id = 'id';
        const indent = 1;
        const hnuser = HnuserPlaceholder();
        final age = DateTime(1);
        const htmlText = 'htmlText';
        const replyUrl = 'replyUrl';
        const parentUrl = 'parentUrl';
        const contextUrl = 'contextUrl';
        const onUrl = 'onUrl';
        const onTitle = 'onTitle';

        expect(
          BaseThreadCommentData.fromParsed(
            id: id,
            indent: indent,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            replyUrl: replyUrl,
            parentUrl: parentUrl,
            contextUrl: contextUrl,
            onUrl: onUrl,
            onTitle: onTitle,
          ),
          BaseThreadCommentData(
            id: id,
            indent: indent,
            hnuser: hnuser,
            age: age,
            htmlText: htmlText,
            replyUrl: replyUrl,
            parentUrl: parentUrl,
            contextUrl: contextUrl,
            onUrl: onUrl,
            onTitle: onTitle,
          ),
        );
      });

      test('returns $BaseThreadCommentData with correct values '
          'when data is null', () {
        expect(
          BaseThreadCommentData.fromParsed(
            id: null,
            indent: null,
            hnuser: null,
            age: null,
            htmlText: null,
            replyUrl: null,
            parentUrl: null,
            contextUrl: null,
            onUrl: null,
            onTitle: null,
          ),
          BaseThreadCommentData(
            id: '',
            indent: 0,
            hnuser: Hnuser.empty,
            age: DateTime(0),
            htmlText: '',
            replyUrl: null,
            parentUrl: null,
            contextUrl: null,
            onUrl: null,
            onTitle: null,
          ),
        );
      });
    });
  });
}
