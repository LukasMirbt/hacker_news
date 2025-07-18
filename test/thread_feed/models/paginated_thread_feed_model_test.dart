// ignore_for_file: prefer_function_declarations_over_variables

import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

class _MockPaginatedFeed extends Mock implements PaginatedThreadFeed {}

class _MockCollapseHandler extends Mock
    implements CollapseHandler<ThreadFeedItemModel> {}

void main() {
  final repositoryItems = List.generate(
    10,
    (index) => ThreadFeedItemPlaceholder(
      id: index.toString(),
    ),
  );

  final items = [
    for (final item in repositoryItems) ThreadFeedItemModel(item: item),
  ];

  group(PaginatedThreadFeedModel, () {
    late PaginatedThreadFeed feed;
    late CollapseHandler<ThreadFeedItemModel> collapseHandler;

    setUp(() {
      feed = _MockPaginatedFeed();
      collapseHandler = _MockCollapseHandler();
      when(() => feed.items).thenReturn(repositoryItems);
    });

    PaginatedThreadFeedModel createSubject() {
      return PaginatedThreadFeedModel(
        feed: feed,
        items: items,
        collapseHandler: collapseHandler,
      );
    }

    group('fromRepository', () {
      test('returns $PaginatedThreadFeed', () {
        expect(
          PaginatedThreadFeedModel.fromRepository(feed),
          PaginatedThreadFeedModel(
            feed: feed,
            items: [
              for (final item in repositoryItems)
                ThreadFeedItemModel(item: item),
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
      test('returns $ThreadFeedItemModel when items contains id', () {
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
      test('returns updated $PaginatedThreadFeedModel', () {
        final model = createSubject();
        final updatedItem = items.first.copyWith(isExpanded: false);
        final updatedModel = model.update(updatedItem);
        expect(
          updatedModel.items,
          [
            updatedItem,
            ...model.items.skip(1),
          ],
        );
      });
    });

    group('rebuildWith', () {
      final feed = PaginatedThreadFeedPlaceholder(
        items: [
          ThreadFeedItemPlaceholder(id: '0'),
          ThreadFeedItemPlaceholder(id: '1'),
        ],
      );

      final updatedItems = [
        ThreadFeedItemModel(
          item: ThreadFeedItemPlaceholder(),
        ),
      ];

      final rebuildWith = () => collapseHandler.rebuildWith(
        oldItems: items,
        newItems: [
          for (final item in feed.items) ThreadFeedItemModel(item: item),
        ],
      );

      test('returns updated $PaginatedThreadFeedModel', () {
        when(rebuildWith).thenReturn(updatedItems);
        final model = createSubject();
        expect(
          model.rebuildWith(feed),
          PaginatedThreadFeedModel(
            feed: feed,
            items: updatedItems,
          ),
        );
        verify(rebuildWith).called(1);
      });
    });

    group('toggleExpansion', () {
      final item = items.first;

      final updatedItems = [
        ThreadFeedItemModel(
          item: ThreadFeedItemPlaceholder(),
        ),
      ];

      final toggleExpansion = () => collapseHandler.toggleExpansion(
        items: items,
        itemToToggle: item,
      );

      test('returns updated $PaginatedThreadFeedModel', () {
        when(toggleExpansion).thenReturn(updatedItems);
        final model = createSubject();
        expect(
          model.toggleExpansion(item: item),
          PaginatedThreadFeedModel(
            feed: feed,
            items: updatedItems,
          ),
        );
        verify(toggleExpansion).called(1);
      });
    });
  });
}
