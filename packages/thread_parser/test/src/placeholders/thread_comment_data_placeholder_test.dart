import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(ThreadCommentDataPlaceholder, () {
    test('returns $ThreadCommentData', () {
      expect(
        ThreadCommentDataPlaceholder(),
        isA<ThreadCommentData>(),
      );
    });
  });
}
