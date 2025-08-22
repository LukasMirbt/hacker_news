// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/thread_feed/thread_feed.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:thread_repository/thread_repository.dart';

class _MockPaginatedFeed extends Mock implements PaginatedThreadFeed {}

class _MockCollapseHandler extends Mock
    implements CollapseHandler<ThreadCommentModel> {}

void main() {
  final repositoryItems = List.generate(
    10,
    (index) => OtherUserThreadCommentPlaceholder(
      id: index.toString(),
    ),
  );

  final items = [
    for (final item in repositoryItems)
      OtherUserThreadCommentModel(comment: item),
  ];

  group(PaginatedThreadFeedModel, () {
    late PaginatedThreadFeed feed;
    late CollapseHandler<ThreadCommentModel> collapseHandler;

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
              for (final item in repositoryItems) ThreadCommentModel.from(item),
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
      test('returns $ThreadCommentModel when items contains id', () {
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

    group('insertAfter', () {
      final newItem = OtherUserThreadCommentModel(
        comment: OtherUserThreadCommentPlaceholder(),
      );

      test('returns updated $PaginatedThreadFeedModel '
          'when afterItem index is found', () {
        final feed = createSubject();
        final afterItem = feed.items.first;
        final updatedFeed = feed.insertAfter(
          afterItem: afterItem,
          newItem: newItem,
        );
        expect(
          updatedFeed.items,
          [
            feed.items.first,
            newItem,
            ...feed.items.skip(1),
          ],
        );
      });

      test('returns same $PaginatedThreadFeedModel '
          'when afterItem index is not found', () {
        final feed = createSubject();
        final afterItem = OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(id: 'non-existent'),
        );
        final updatedFeed = feed.insertAfter(
          afterItem: afterItem,
          newItem: newItem,
        );
        expect(updatedFeed, feed);
      });
    });

    group('rebuildWith', () {
      final feed = PaginatedThreadFeedPlaceholder(
        items: [
          OtherUserThreadCommentPlaceholder(id: '0'),
          OtherUserThreadCommentPlaceholder(id: '1'),
        ],
      );

      final updatedItems = [
        OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(),
        ),
      ];

      final rebuildWith = () => collapseHandler.rebuildWith(
        oldItems: items,
        newItems: [
          for (final item in feed.items) ThreadCommentModel.from(item),
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
      final comment = items.first;

      final updatedItems = [
        OtherUserThreadCommentModel(
          comment: OtherUserThreadCommentPlaceholder(),
        ),
      ];

      final toggleExpansion = () => collapseHandler.toggleExpansion(
        items: items,
        itemToToggle: comment,
      );

      test('returns updated $PaginatedThreadFeedModel', () {
        when(toggleExpansion).thenReturn(updatedItems);
        final model = createSubject();
        expect(
          model.toggleExpansion(comment: comment),
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
