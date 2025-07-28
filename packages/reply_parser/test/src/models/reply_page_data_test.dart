import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(ReplyPageData, () {
    group('empty', () {
      test('returns $ReplyPageData', () {
        expect(
          ReplyPageData.empty,
          isA<ReplyPageData>(),
        );
      });
    });
  });
}
