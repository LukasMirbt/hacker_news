import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(JobFeedItemPlaceholder, () {
    test('returns $JobFeedItem', () {
      expect(
        JobFeedItemPlaceholder(),
        isA<JobFeedItem>(),
      );
    });
  });
}
