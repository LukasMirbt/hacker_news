// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPaginatedFeed extends Mock implements PaginatedFeed {}

void main() {
  final repositoryItems = List.generate(
    10,
    (index) => FeedItemPlaceholder(
      id: index.toString(),
    ),
  );

  final items = [
    for (final item in repositoryItems) FeedItemModel(item),
  ];

  group(PaginatedFeedModel, () {
    late PaginatedFeed feed;

    setUp(() {
      feed = _MockPaginatedFeed();
      when(() => feed.items).thenReturn(repositoryItems);
    });

    PaginatedFeedModel createSubject() {
      return PaginatedFeedModel(
        feed: feed,
        items: items,
      );
    }

    group('fromRepository', () {
      test('returns $PaginatedFeed', () {
        expect(
          PaginatedFeedModel.fromRepository(feed),
          PaginatedFeedModel(
            feed: feed,
            items: [
              for (final item in repositoryItems) FeedItemModel(item),
            ],
          ),
        );
      });
    });

    group('isPlaceholder', () {
      test('returns false', () {
        final model = createSubject();
        expect(model.isPlaceholder, false);
      });
    });

    group('hasReachedMax', () {
      test('returns feed.hasReachedMax', () {
        const hasReachedMax = true;
        when(() => feed.hasReachedMax).thenReturn(hasReachedMax);
        final model = createSubject();
        expect(model.hasReachedMax, hasReachedMax);
      });
    });

    group('isEmpty', () {
      test('returns feed.isEmpty', () {
        const isEmpty = true;
        when(() => feed.isEmpty).thenReturn(isEmpty);
        final model = createSubject();
        expect(model.isEmpty, isEmpty);
      });
    });

    group('toRepository', () {
      test('returns feed', () {
        final model = createSubject();
        expect(
          model.toRepository(),
          feed,
        );
      });
    });

    group('findById', () {
      test('returns $FeedItemModel when items contains id', () {
        final model = createSubject();
        final item = items.first;
        expect(model.findById(item.id), item);
      });

      test('returns null when items does not contain id', () {
        final model = createSubject();
        expect(model.findById(''), null);
      });
    });

    group('update', () {
      test('returns updated $PaginatedFeedModel', () {
        final updatedItem = FeedItemModel(
          FeedItemPlaceholder(),
        );
        final updatedRepositoryItem = updatedItem.toRepository();
        final updatedFeed = PaginatedFeedPlaceholder(
          items: [
            updatedRepositoryItem,
          ],
        );
        final update = () => feed.update(updatedRepositoryItem);
        when(update).thenReturn(updatedFeed);
        final model = createSubject();
        expect(
          model.update(updatedItem),
          PaginatedFeedModel.fromRepository(updatedFeed),
        );
        verify(update).called(1);
      });
    });
  });
}
