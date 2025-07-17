import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadListModel extends Equatable {
  ThreadListModel({
    required this.repositoryList,
    required this.items,
  }) : visibleItems = [
         for (final item in items)
           if (item.isParentExpanded) item,
       ];

  factory ThreadListModel.fromRepository(PaginatedThreadList repositoryList) {
    return ThreadListModel(
      repositoryList: repositoryList,
      items: [
        for (final item in repositoryList.items)
          ThreadCommentModel(comment: item),
      ],
    );
  }

  @visibleForTesting
  final PaginatedThreadList repositoryList;

  final List<ThreadCommentModel> items;

  final List<ThreadCommentModel> visibleItems;

  bool get isPlaceholder => false;
  bool get hasReachedMax => repositoryList.hasReachedMax;
  bool get isEmpty => repositoryList.isEmpty;

  PaginatedThreadList toRepository() => repositoryList;

  ThreadCommentModel? findById(String id) {
    return items.firstWhereOrNull(
      (item) => item.id == id,
    );
  }

  ThreadListModel update(ThreadCommentModel updatedItem) {
    final updatedList = [
      for (final item in items)
        if (item.id == updatedItem.id) updatedItem else item,
    ];
    return ThreadListModel(
      repositoryList: repositoryList,
      items: updatedList,
    );
  }

  ThreadListModel rebuildWith({
    required PaginatedThreadList repositoryList,
    required List<ThreadComment> comments,
  }) {
    final oldExpansionStates = {
      for (final item in items) item.id: item.isExpanded,
    };

    final itemsWithPreservedExpansion = [
      for (final comment in comments)
        ThreadCommentModel(
          comment: comment,
          isExpanded: oldExpansionStates[comment.id] ?? true,
        ),
    ];

    final parentStatus = <int, bool>{-1: true};
    final fullyCorrectedItems = <ThreadCommentModel>[];

    for (final item in itemsWithPreservedExpansion) {
      final isParentExpanded = parentStatus[item.indent - 1] ?? false;
      fullyCorrectedItems.add(
        item.copyWith(isParentExpanded: isParentExpanded),
      );
      parentStatus[item.indent] = isParentExpanded && item.isExpanded;
    }

    return ThreadListModel(
      repositoryList: repositoryList,
      items: fullyCorrectedItems,
    );
  }

  ThreadListModel toggleExpansion({
    required ThreadCommentModel comment,
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

    return ThreadListModel(
      repositoryList: repositoryList,
      items: updatedItems,
    );
  }

  @override
  List<Object?> get props => [
    repositoryList,
    items,
  ];
}
