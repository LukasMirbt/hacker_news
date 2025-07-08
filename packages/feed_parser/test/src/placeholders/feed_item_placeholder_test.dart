import 'package:feed_parser/feed_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(FeedItemDataPlaceholder, () {
    test('returns $FeedItemData', () {
      expect(
        FeedItemDataPlaceholder(),
        isA<FeedItemData>(),
      );
    });
  });
}
