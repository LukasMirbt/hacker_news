// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_redundant_argument_values

import 'package:collapse_handler/collapse_handler.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestItem extends Equatable implements Collapsible<_TestItem> {
  const _TestItem({
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

  @override
  List<Object?> get props => [
    id,
    indent,
    isExpanded,
    isParentExpanded,
  ];
}

void main() {
  group(CollapseHandler, () {
    CollapseHandler createSubject() => CollapseHandler<_TestItem>();

    group('toggleExpansion', () {
      test('correctly collapses a parent item '
          'and hides all its children', () {
        final items = [
          _TestItem(id: '0', indent: 0),
          _TestItem(id: '1', indent: 1),
          _TestItem(id: '2', indent: 2),
          _TestItem(id: '3', indent: 1),
          _TestItem(id: '4', indent: 0),
        ];
        final handler = createSubject();
        final updatedItems = handler.toggleExpansion(
          items: items,
          index: 0,
        );
        expect(
          updatedItems,
          [
            items[0].copyWith(isExpanded: false),
            items[1].copyWith(isParentExpanded: false),
            items[2].copyWith(isParentExpanded: false),
            items[3].copyWith(isParentExpanded: false),
            items[4],
          ],
        );
      });

      test('correctly expands a collapsed parent item '
          'and shows its children', () {
        final items = [
          _TestItem(id: '0', indent: 0, isExpanded: false),
          _TestItem(id: '1', indent: 1, isParentExpanded: false),
          _TestItem(id: '2', indent: 2, isParentExpanded: false),
          _TestItem(id: '3', indent: 1, isParentExpanded: false),
          _TestItem(id: '4', indent: 0),
        ];
        final handler = createSubject();
        final updatedItems = handler.toggleExpansion(
          items: items,
          index: 0,
        );
        expect(updatedItems, [
          items[0].copyWith(isExpanded: true),
          items[1].copyWith(isParentExpanded: true),
          items[2].copyWith(isParentExpanded: true),
          items[3].copyWith(isParentExpanded: true),
          items[4],
        ]);
      });

      test('correctly expands a parent but keeps grandchildren hidden '
          'when their direct parent is collapsed', () {
        final items = [
          _TestItem(id: '0', indent: 0, isExpanded: false),
          _TestItem(
            id: '1',
            indent: 1,
            isExpanded: false,
            isParentExpanded: false,
          ),
          _TestItem(id: '2', indent: 2, isParentExpanded: false),
          _TestItem(id: '3', indent: 1, isParentExpanded: false),
          _TestItem(id: '4', indent: 0),
        ];
        final handler = createSubject();
        final updatedItems = handler.toggleExpansion(
          items: items,
          index: 0,
        );
        expect(
          updatedItems,
          [
            items[0].copyWith(isExpanded: true),
            items[1].copyWith(isParentExpanded: true),
            items[2].copyWith(isParentExpanded: false),
            items[3].copyWith(isParentExpanded: true),
            items[4],
          ],
        );
      });
    });

    group('ensureVisible', () {
      final items = [
        _TestItem(id: '0', indent: 0),
        _TestItem(id: '1', indent: 1, isExpanded: false),
        _TestItem(id: '2', indent: 2, isParentExpanded: false),
        _TestItem(id: '3', indent: 1),
        _TestItem(id: '4', indent: 0),
      ];

      test('correctly expands all parent items '
          'to make a nested item visible', () {
        final handler = createSubject();
        final updatedItems = handler.ensureVisible(
          items: items,
          index: 2,
        );
        expect(
          updatedItems,
          [
            items[0],
            items[1].copyWith(isExpanded: true),
            items[2].copyWith(isParentExpanded: true),
            items[3],
            items[4],
          ],
        );
      });

      test('returns same items when item is already visible', () {
        final handler = createSubject();
        final updatedItems = handler.ensureVisible(
          items: items,
          index: 4,
        );
        expect(updatedItems, items);
      });

      test('handles the root item correctly', () {
        final handler = createSubject();
        final updatedItems = handler.ensureVisible(
          items: items,
          index: 0,
        );
        expect(updatedItems, items);
      });
    });

    group('rebuildWith', () {
      final oldItems = [
        _TestItem(id: '0', indent: 0),
        _TestItem(id: '1', indent: 1, isExpanded: false),
        _TestItem(id: '2', indent: 2, isParentExpanded: false),
        _TestItem(id: '3', indent: 0),
      ];

      final newItems = [
        _TestItem(id: '0', indent: 0),
        _TestItem(id: '1', indent: 1),
        _TestItem(id: '2', indent: 2),
        _TestItem(id: '3', indent: 0),
        _TestItem(id: '4', indent: 1),
      ];

      test('correctly preserves old states, defaults new states, '
          'and recalculates visibility', () {
        final handler = createSubject();
        final rebuiltItems = handler.rebuildWith(
          oldItems: oldItems,
          newItems: newItems,
        );

        expect(
          rebuiltItems,
          [
            _TestItem(id: '0', indent: 0),
            _TestItem(
              id: '1',
              indent: 1,
              isExpanded: false,
              isParentExpanded: true,
            ),
            _TestItem(id: '2', indent: 2, isParentExpanded: false),
            _TestItem(id: '3', indent: 0),
            _TestItem(id: '4', indent: 1),
          ],
        );
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
  });
}
