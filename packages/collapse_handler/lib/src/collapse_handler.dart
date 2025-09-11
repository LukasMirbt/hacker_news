import 'package:collapse_handler/collapse_handler.dart';

class CollapseHandler<T extends Collapsible<T>> {
  const CollapseHandler();

  List<T> toggleExpansion({
    required List<T> items,
    required int index,
  }) {
    final updatedItems = [...items];

    final tappedItem = updatedItems[index];
    final newIsExpanded = !tappedItem.isExpanded;

    updatedItems[index] = tappedItem.copyWith(
      isExpanded: newIsExpanded,
    );

    final parentIndent = tappedItem.indent;

    if (!newIsExpanded) {
      for (var i = index + 1; i < updatedItems.length; i++) {
        final child = updatedItems[i];
        if (child.indent <= parentIndent) break;
        updatedItems[i] = child.copyWith(isParentExpanded: false);
      }
    } else {
      final parentExpansionStatus = <int, bool>{
        tappedItem.indent: true,
      };

      for (var i = index + 1; i < updatedItems.length; i++) {
        final child = updatedItems[i];
        if (child.indent <= parentIndent) break;

        final isDirectParentExpanded =
            parentExpansionStatus[child.indent - 1] ?? false;

        updatedItems[i] = child.copyWith(
          isParentExpanded: isDirectParentExpanded,
        );

        parentExpansionStatus[child.indent] =
            isDirectParentExpanded && child.isExpanded;
      }
    }

    return updatedItems;
  }

  List<T> ensureVisible({
    required List<T> items,
    required int index,
  }) {
    final item = items[index];

    final idsToExpand = {item.id};
    var parentIndentToFind = item.indent - 1;

    if (parentIndentToFind >= 0) {
      for (var i = index - 1; i >= 0; i--) {
        final currentItem = items[i];
        if (currentItem.indent == parentIndentToFind) {
          idsToExpand.add(currentItem.id);
          parentIndentToFind--;
          if (parentIndentToFind < 0) break;
        }
      }
    }

    final itemsWithAncestorsExpanded = [
      for (final item in items)
        if (idsToExpand.contains(item.id))
          item.copyWith(isExpanded: true)
        else
          item,
    ];

    return _recalculateParentExpansion(itemsWithAncestorsExpanded);
  }

  List<T> rebuildWith({
    required List<T> oldItems,
    required List<T> newItems,
  }) {
    final oldExpansionStates = {
      for (final item in oldItems) item.id: item.isExpanded,
    };

    final itemsWithPreservedExpansion = [
      for (final item in newItems)
        item.copyWith(
          isExpanded: oldExpansionStates[item.id] ?? true,
        ),
    ];

    return _recalculateParentExpansion(itemsWithPreservedExpansion);
  }

  List<T> _recalculateParentExpansion(List<T> items) {
    final parentStatus = <int, bool>{-1: true};
    final fullyCorrectedItems = <T>[];

    for (final item in items) {
      final isParentExpanded = parentStatus[item.indent - 1] ?? false;
      fullyCorrectedItems.add(
        item.copyWith(isParentExpanded: isParentExpanded),
      );
      parentStatus[item.indent] = isParentExpanded && item.isExpanded;
    }

    return fullyCorrectedItems;
  }
}
