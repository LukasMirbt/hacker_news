import 'package:app/feed/feed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(PaginatedFeedModelPlaceholder, () {
    PaginatedFeedModelPlaceholder createSubject() {
      return PaginatedFeedModelPlaceholder();
    }

    group('constructor', () {
      test('returns $PaginatedFeedModel', () {
        expect(
          createSubject(),
          isA<PaginatedFeedModel>(),
        );
      });
    });

    group('items', () {
      test('returns ${PostFeedItemModelPlaceholder}s', () {
        final model = createSubject();
        expect(
          model.items,
          List.filled(
            10,
            PostFeedItemModelPlaceholder(),
          ),
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
