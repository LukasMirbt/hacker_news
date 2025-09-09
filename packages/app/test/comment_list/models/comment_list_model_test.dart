// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/comment_list/comment_list.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:post_repository/post_repository.dart';

class _MockCollapseHandler extends Mock
    implements CollapseHandler<CommentModel> {}

void main() {
  final repositoryItems = List.generate(
    10,
    (index) => OtherUserCommentPlaceholder(
      id: index.toString(),
    ),
  );

  final items = [
    for (final item in repositoryItems)
      OtherUserCommentModel(
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
          OtherUserCommentModel(
            comment: OtherUserCommentPlaceholder(),
          ),
          OtherUserCommentModel(
            isParentExpanded: false,
            comment: OtherUserCommentPlaceholder(),
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

    group('insertAfter', () {
      final newItem = OtherUserCommentModel(
        comment: OtherUserCommentPlaceholder(),
      );

      test('returns same $CommentListModel when afterItem index '
          'is not found', () {
        final model = createSubject();
        final afterItem = OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(id: 'non-existent'),
        );
        final updatedModel = model.insertAfter(
          afterItem: afterItem,
          newItem: newItem,
        );
        expect(updatedModel, model);
      });

      test('returns updated $CommentListModel when afterItem index '
          'is found', () {
        final model = createSubject();
        final afterItem = model.items.first;
        final updatedModel = model.insertAfter(
          afterItem: afterItem,
          newItem: newItem,
        );
        expect(
          updatedModel.items,
          [
            model.items.first,
            newItem,
            ...model.items.skip(1),
          ],
        );
      });
    });

    group('rebuildWith', () {
      final comments = [
        OtherUserCommentPlaceholder(id: '0'),
        OtherUserCommentPlaceholder(id: '1'),
      ];

      final updatedItems = [
        OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(),
        ),
      ];

      final rebuildWith = () => collapseHandler.rebuildWith(
        oldItems: items,
        newItems: [
          for (final comment in comments) CommentModel.from(comment),
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
      test('returns same $CommentListModel when index '
          'is not found', () {
        final comment = OtherUserCommentModel(
          comment: OtherUserCommentPlaceholder(
            id: '',
          ),
        );
        final model = createSubject();
        expect(
          model.toggleExpansion(comment: comment),
          model,
        );
      });

      test('returns updated $CommentListModel when index '
          'is found', () {
        final comment = items.first;
        final updatedItems = [
          OtherUserCommentModel(
            comment: OtherUserCommentPlaceholder(),
          ),
        ];
        final toggleExpansion = () => collapseHandler.toggleExpansion(
          items: items,
          index: 0,
        );
        when(toggleExpansion).thenReturn(updatedItems);
        final model = createSubject();
        expect(
          model.toggleExpansion(comment: comment),
          CommentListModel(items: updatedItems),
        );
        verify(toggleExpansion).called(1);
      });
    });

    group('ensureVisible', () {
      test('returns same $CommentListModel when index '
          'is not found', () {
        final comment = OtherUserCommentPlaceholder(id: '');
        final model = createSubject();
        expect(
          model.ensureVisible(comment: comment),
          model,
        );
      });

      test('returns updated $CommentListModel when index '
          'is found', () {
        final comment = repositoryItems.first;
        final updatedItems = [
          OtherUserCommentModel(
            comment: OtherUserCommentPlaceholder(),
          ),
        ];
        final ensureVisible = () => collapseHandler.ensureVisible(
          items: items,
          index: 0,
        );
        when(ensureVisible).thenReturn(updatedItems);
        final model = createSubject();
        expect(
          model.ensureVisible(comment: comment),
          CommentListModel(items: updatedItems),
        );
        verify(ensureVisible).called(1);
      });
    });
  });
}
