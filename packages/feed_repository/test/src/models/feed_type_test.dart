import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(FeedType, () {
    group('endpoint', () {
      test('returns correct value for ${FeedType.top}', () {
        const type = FeedType.top;
        expect(type.endpoint, 'news');
      });

      test('returns correct value for ${FeedType.newest}', () {
        const type = FeedType.newest;
        expect(type.endpoint, 'newest');
      });

      test('returns correct value for ${FeedType.past}', () {
        const type = FeedType.past;
        expect(type.endpoint, 'front');
      });

      test('returns correct value for ${FeedType.ask}', () {
        const type = FeedType.ask;
        expect(type.endpoint, 'ask');
      });

      test('returns correct value for ${FeedType.show}', () {
        const type = FeedType.show;
        expect(type.endpoint, 'show');
      });

      test('returns correct value for ${FeedType.jobs}', () {
        const type = FeedType.jobs;
        expect(type.endpoint, 'jobs');
      });

      test('returns correct value for ${FeedType.whoIsHiring}', () {
        const type = FeedType.whoIsHiring;
        expect(type.endpoint, 'submitted?id=whoishiring');
      });
    });
  });
}
