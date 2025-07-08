// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:post_repository/post_repository.dart';

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
    CommentListModel createSubject() {
      return CommentListModel(items: items);
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
      final initialItems = [
        CommentModel(
          comment: CommentPlaceholder(
            id: '0',
            indent: 0,
          ),
        ),
        CommentModel(
          comment: CommentPlaceholder(
            id: '1',
            indent: 1,
          ),
          isExpanded: false,
        ),
        CommentModel(
          comment: CommentPlaceholder(
            id: '2',
            indent: 2,
          ),
          isParentExpanded: false,
        ),
        CommentModel(
          comment: CommentPlaceholder(
            id: '3',
            indent: 0,
          ),
        ),
      ];

      final newRepositoryComments = [
        CommentPlaceholder(id: '0', indent: 0),
        CommentPlaceholder(id: '1', indent: 1),
        CommentPlaceholder(id: '2', indent: 2),
        CommentPlaceholder(id: '3', indent: 0),
        CommentPlaceholder(id: '4', indent: 1),
      ];

      test('preserves existing expansion states for old comments', () {
        final model = CommentListModel(items: initialItems);
        final rebuiltModel = model.rebuildWith(newRepositoryComments);
        final rebuiltItem1 = rebuiltModel.findById('1');
        expect(rebuiltItem1?.isExpanded, false);
      });

      test('sets isExpanded to true for new comments', () {
        final model = CommentListModel(items: initialItems);
        final rebuiltModel = model.rebuildWith(newRepositoryComments);
        final newItem = rebuiltModel.findById('4');
        expect(newItem?.isExpanded, true);
      });

      test('correctly recalculates isParentExpanded for all items', () {
        final model = CommentListModel(items: initialItems);
        final rebuiltModel = model.rebuildWith(newRepositoryComments);
        final items = rebuiltModel.items;
        expect(items[0].isExpanded, true);
        expect(items[0].isParentExpanded, true);
        expect(items[1].isExpanded, false);
        expect(items[1].isParentExpanded, true);
        expect(items[2].isParentExpanded, false);
        expect(items[3].isExpanded, true);
        expect(items[3].isParentExpanded, true);
        expect(items[4].isExpanded, true);
        expect(items[4].isParentExpanded, true);
      });

      test('handles an empty initial list', () {
        final model = CommentListModel(items: []);
        final rebuiltModel = model.rebuildWith(newRepositoryComments);
        expect(rebuiltModel.items.length, 5);
        expect(rebuiltModel.visibleItems.length, 5);
        expect(rebuiltModel.items.every((item) => item.isExpanded), true);
      });
    });

    group('toggleExpansion', () {
      CommentListModel createSubject({
        required List<CommentModel> items,
      }) {
        return CommentListModel(items: items);
      }

      final nestedItems = [
        CommentModel(
          comment: CommentPlaceholder(id: '0', indent: 0),
        ),
        CommentModel(
          comment: CommentPlaceholder(id: '1', indent: 1),
        ),
        CommentModel(
          comment: CommentPlaceholder(id: '2', indent: 2),
        ),
        CommentModel(
          comment: CommentPlaceholder(id: '3', indent: 1),
        ),
        CommentModel(
          comment: CommentPlaceholder(id: '4', indent: 0),
        ),
      ];

      test('returns original model when comment is not found', () {
        final comment = CommentModel(
          comment: CommentPlaceholder(id: ''),
        );
        final model = createSubject(items: nestedItems);
        final updatedModel = model.toggleExpansion(comment: comment);
        expect(updatedModel, model);
      });

      test('correctly collapses a parent comment '
          'and hides all its children', () {
        final model = createSubject(items: nestedItems);
        final tappedComment = model.items[0];
        final updatedModel = model.toggleExpansion(comment: tappedComment);
        expect(updatedModel.items[0].isExpanded, false);
        expect(updatedModel.items[1].isParentExpanded, false);
        expect(updatedModel.items[2].isParentExpanded, false);
        expect(updatedModel.items[3].isParentExpanded, false);
        expect(updatedModel.items[4].isParentExpanded, true);
      });

      test('correctly expands a collapsed parent comment '
          'and shows its children', () {
        final initialItems = [
          nestedItems[0].copyWith(isExpanded: false),
          nestedItems[1].copyWith(isParentExpanded: false),
          nestedItems[2].copyWith(isParentExpanded: false),
          nestedItems[3].copyWith(isParentExpanded: false),
          nestedItems[4],
        ];
        final model = createSubject(items: initialItems);
        final tappedComment = model.items[0];
        final updatedModel = model.toggleExpansion(
          comment: tappedComment,
        );
        expect(updatedModel.items[0].isExpanded, true);
        expect(updatedModel.items[1].isParentExpanded, true);
        expect(updatedModel.items[2].isParentExpanded, true);
        expect(updatedModel.items[3].isParentExpanded, true);
      });

      test('correctly expands a parent but keeps grandchildren hidden '
          'when their direct parent is collapsed', () {
        final initialItems = [
          nestedItems[0].copyWith(isExpanded: false),
          nestedItems[1].copyWith(isExpanded: false, isParentExpanded: false),
          nestedItems[2].copyWith(isParentExpanded: false),
          nestedItems[3].copyWith(isParentExpanded: false),
          nestedItems[4],
        ];
        final model = createSubject(items: initialItems);
        final tappedComment = model.items[0];
        final updatedModel = model.toggleExpansion(comment: tappedComment);
        expect(updatedModel.items[0].isExpanded, true);
        expect(updatedModel.items[1].isParentExpanded, true);
        expect(updatedModel.items[2].isParentExpanded, false);
      });
    });
  });
}
