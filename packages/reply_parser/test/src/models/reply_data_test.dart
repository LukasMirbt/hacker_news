import 'package:flutter_test/flutter_test.dart';
import 'package:reply_parser/reply_parser.dart';

void main() {
  group(ReplyData, () {
    group('empty', () {
      test('returns $ReplyData', () {
        expect(
          ReplyData.empty,
          isA<ReplyData>(),
        );
      });
    });
  });
}
