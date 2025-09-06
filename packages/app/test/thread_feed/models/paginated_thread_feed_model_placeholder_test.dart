import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PaginatedThreadFeedModelPlaceholder, () {
    PaginatedThreadFeedModelPlaceholder createSubject() {
      return PaginatedThreadFeedModelPlaceholder();
    }

    group('constructor', () {
      test('returns $PaginatedThreadFeedModel', () {
        expect(
          createSubject(),
          isA<PaginatedThreadFeedModel>(),
        );
      });
    });

    group('isPlaceholder', () {
      test('returns true', () {
        final model = createSubject();
        expect(model.isPlaceholder, true);
      });
    });

    group('hasReachedMax', () {
      test('returns true', () {
        final model = createSubject();
        expect(model.hasReachedMax, true);
      });
    });

    group('isEmpty', () {
      test('returns false', () {
        final model = createSubject();
        expect(model.isEmpty, false);
      });
    });

    group('toRepository', () {
      test('throws $UnimplementedError', () {
        final model = createSubject();
        expect(
          model.toRepository,
          throwsUnimplementedError,
        );
      });
    });
  });
}
