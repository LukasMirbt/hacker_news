// ignore_for_file: prefer_function_declarations_over_variables

import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockCollapseHandler extends Mock
    implements CollapseHandler<CommentModel> {}

void main() {
  final repositoryItems = List.generate(
    10,
    (index) => CommentPlaceholder(
      id: index.toString(),
    ),
  );

  final items = [
    for (final item in repositoryItems)
      CommentModel(
        comment: item,
      ),
  ];

  group(CommentListModel, () {
    late CollapseHandler<CommentModel> collapseHandler;

    setUp(() {
      collapseHandler = _MockCollapseHandler();
    });

    CommentListModel createSubject() {
      return CommentListModel(
        items: items,
        collapseHandler: collapseHandler,
      );
    }

    group('constructor', () {
      test('returns $CommentListModel with correct visibleItems', () {
        final items = [
          CommentModel(
            comment: CommentPlaceholder(),
          ),
          CommentModel(
            isParentExpanded: false,
            comment: CommentPlaceholder(),
          ),
        ];

        final model = CommentListModel(items: items);

        expect(
          model.visibleItems,
          [
            items[0],
          ],
        );
      });
    });

    group('from', () {
      test('returns $CommentListModel', () {
        expect(
          CommentListModel.from(repositoryItems),
          CommentListModel(items: items),
        );
      });
    });

    group('findById', () {
      test('returns $CommentModel when items contains id', () {
        final item = items.first;
        final model = createSubject();
        expect(model.findById(item.id), item);
      });

      test('returns null when items does not contain id', () {
        final model = createSubject();
        expect(model.findById(''), null);
      });
    });

    group('update', () {
      test('returns updated $CommentListModel', () {
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
      final comments = [
        CommentPlaceholder(id: '0'),
        CommentPlaceholder(id: '1'),
      ];

      final updatedItems = [
        CommentModel(
          comment: CommentPlaceholder(),
        ),
      ];

      final rebuildWith = () => collapseHandler.rebuildWith(
        oldItems: items,
        newItems: [
          for (final comment in comments) CommentModel(comment: comment),
        ],
      );

      test('returns updated $CommentListModel', () {
        when(rebuildWith).thenReturn(updatedItems);
        final model = createSubject();
        expect(
          model.rebuildWith(comments),
          CommentListModel(items: updatedItems),
        );
        verify(rebuildWith).called(1);
      });
    });

    group('toggleExpansion', () {
      final comment = items.first;

      final updatedItems = [
        CommentModel(
          comment: CommentPlaceholder(),
        ),
      ];

      final toggleExpansion = () => collapseHandler.toggleExpansion(
        items: items,
        itemToToggle: comment,
      );

      test('returns updated $CommentListModel', () {
        when(toggleExpansion).thenReturn(updatedItems);
        final model = createSubject();
        expect(
          model.toggleExpansion(comment: comment),
          CommentListModel(items: updatedItems),
        );
        verify(toggleExpansion).called(1);
      });
    });
  });
}
