import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:post_repository/post_repository.dart';

class CommentListModel extends Equatable {
  CommentListModel({required this.items})
    : visibleItems = [
        for (final item in items)
          if (item.isParentExpanded) item,
      ];

  factory CommentListModel.from(List<Comment> items) {
    return CommentListModel(
      items: [
        for (final item in items) CommentModel(comment: item),
      ],
    );
  }

  @visibleForTesting
  final List<CommentModel> items;

  final List<CommentModel> visibleItems;

  CommentModel? findById(String id) {
    return items.firstWhereOrNull(
      (item) => item.id == id,
    );
  }

  CommentListModel update(CommentModel updatedItem) {
    final updatedList = [
      for (final item in items)
        if (item.id == updatedItem.id) updatedItem else item,
    ];
    return CommentListModel(items: updatedList);
  }

  CommentListModel rebuildWith(List<Comment> comments) {
    final oldExpansionStates = {
      for (final item in items) item.id: item.isExpanded,
    };

    final itemsWithPreservedExpansion = [
      for (final comment in comments)
        CommentModel(
          comment: comment,
          isExpanded: oldExpansionStates[comment.id] ?? true,
        ),
    ];

    final parentStatus = <int, bool>{-1: true};
    final fullyCorrectedItems = <CommentModel>[];

    for (final item in itemsWithPreservedExpansion) {
      final isParentExpanded = parentStatus[item.indent - 1] ?? false;
      fullyCorrectedItems.add(
        item.copyWith(isParentExpanded: isParentExpanded),
      );
      parentStatus[item.indent] = isParentExpanded && item.isExpanded;
    }

    return CommentListModel(items: fullyCorrectedItems);
  }

  CommentListModel toggleExpansion({
    required CommentModel comment,
  }) {
    final updatedItems = [...items];

    final index = updatedItems.indexWhere(
      (item) => item.id == comment.id,
    );

    if (index == -1) return this;

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

    return CommentListModel(items: updatedItems);
  }

  @override
  List<Object> get props => [
    items,
    visibleItems,
  ];
}
