// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_redundant_argument_values

import 'package:collapse_handler/collapse_handler.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestItem implements Collapsible<_TestItem> {
  _TestItem({
    required this.id,
    this.indent = 0,
    this.isExpanded = true,
    this.isParentExpanded = true,
  });

  @override
  final String id;

  @override
  final int indent;

  @override
  final bool isExpanded;

  @override
  final bool isParentExpanded;

  @override
  _TestItem copyWith({
    String? id,
    int? indent,
    bool? isExpanded,
    bool? isParentExpanded,
  }) {
    return _TestItem(
      id: id ?? this.id,
      indent: indent ?? this.indent,
      isExpanded: isExpanded ?? this.isExpanded,
      isParentExpanded: isParentExpanded ?? this.isParentExpanded,
    );
  }
}

void main() {
  group(CollapseHandler, () {
    CollapseHandler createSubject() => CollapseHandler<_TestItem>();

    group('rebuildWith', () {
      final initialItems = [
        _TestItem(
          id: '0',
          indent: 0,
        ),
        _TestItem(
          id: '1',
          indent: 1,
          isExpanded: false,
        ),
        _TestItem(
          id: '2',
          indent: 2,
          isParentExpanded: false,
        ),
        _TestItem(
          id: '3',
          indent: 0,
        ),
      ];

      final newItems = [
        _TestItem(id: '0', indent: 0),
        _TestItem(id: '1', indent: 1),
        _TestItem(id: '2', indent: 2),
        _TestItem(id: '3', indent: 0),
        _TestItem(id: '4', indent: 1),
      ];

      test('preserves existing expansion states for old items', () {
        final handler = createSubject();
        final rebuiltList = handler.rebuildWith(
          oldItems: initialItems,
          newItems: newItems,
        );
        expect(rebuiltList[1].isExpanded, false);
      });

      test('sets isExpanded to true for new items', () {
        final handler = createSubject();
        final rebuiltItems = handler.rebuildWith(
          oldItems: initialItems,
          newItems: newItems,
        );
        expect(rebuiltItems[4].isExpanded, true);
      });

      test('correctly recalculates isParentExpanded for all items', () {
        final handler = createSubject();
        final rebuiltItems = handler.rebuildWith(
          oldItems: initialItems,
          newItems: newItems,
        );
        expect(rebuiltItems[0].isExpanded, true);
        expect(rebuiltItems[0].isParentExpanded, true);
        expect(rebuiltItems[1].isExpanded, false);
        expect(rebuiltItems[1].isParentExpanded, true);
        expect(rebuiltItems[2].isParentExpanded, false);
        expect(rebuiltItems[3].isExpanded, true);
        expect(rebuiltItems[3].isParentExpanded, true);
        expect(rebuiltItems[4].isExpanded, true);
        expect(rebuiltItems[4].isParentExpanded, true);
      });

      test('handles an empty initial list', () {
        final handler = createSubject();
        final rebuiltItems = handler.rebuildWith(
          oldItems: <_TestItem>[],
          newItems: newItems,
        );
        expect(rebuiltItems.length, 5);
        expect(rebuiltItems.every((item) => item.isExpanded), true);
      });
    });

    group('toggleExpansion', () {
      final nestedItems = [
        _TestItem(id: '0', indent: 0),
        _TestItem(id: '1', indent: 1),
        _TestItem(id: '2', indent: 2),
        _TestItem(id: '3', indent: 1),
        _TestItem(id: '4', indent: 0),
      ];

      test('returns original items when item is not found', () {
        final handler = createSubject();
        final updatedItems = handler.toggleExpansion(
          items: nestedItems,
          itemToToggle: _TestItem(id: ''),
        );
        expect(updatedItems, nestedItems);
      });

      test('correctly collapses a parent item '
          'and hides all its children', () {
        final handler = createSubject();
        final tappedItem = nestedItems[0];
        final updatedItems = handler.toggleExpansion(
          items: nestedItems,
          itemToToggle: tappedItem,
        );
        expect(updatedItems[0].isExpanded, false);
        expect(updatedItems[1].isParentExpanded, false);
        expect(updatedItems[2].isParentExpanded, false);
        expect(updatedItems[3].isParentExpanded, false);
        expect(updatedItems[4].isParentExpanded, true);
      });

      test('correctly expands a collapsed parent item '
          'and shows its children', () {
        final initialItems = [
          nestedItems[0].copyWith(isExpanded: false),
          nestedItems[1].copyWith(isParentExpanded: false),
          nestedItems[2].copyWith(isParentExpanded: false),
          nestedItems[3].copyWith(isParentExpanded: false),
          nestedItems[4],
        ];
        final handler = createSubject();
        final tappedItem = initialItems[0];
        final updatedItems = handler.toggleExpansion(
          items: initialItems,
          itemToToggle: tappedItem,
        );
        expect(updatedItems[0].isExpanded, true);
        expect(updatedItems[1].isParentExpanded, true);
        expect(updatedItems[2].isParentExpanded, true);
        expect(updatedItems[3].isParentExpanded, true);
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
        final handler = createSubject();
        final tappedItem = initialItems[0];
        final updatedItems = handler.toggleExpansion(
          items: initialItems,
          itemToToggle: tappedItem,
        );
        expect(updatedItems[0].isExpanded, true);
        expect(updatedItems[1].isParentExpanded, true);
        expect(updatedItems[2].isParentExpanded, false);
      });
    });
  });
}
