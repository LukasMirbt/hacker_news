import 'package:flutter_test/flutter_test.dart';
import 'package:thread_parser/thread_parser.dart';

void main() {
  group(ThreadFeedItemDataPlaceholder, () {
    test('returns $ThreadFeedItemData', () {
      expect(
        ThreadFeedItemDataPlaceholder(),
        isA<ThreadFeedItemData>(),
      );
    });
  });
}
