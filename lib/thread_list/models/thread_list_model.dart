import 'package:collapsible_list/collapsible_list.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadListModel extends Equatable {
  ThreadListModel({
    required this.repositoryList,
    required this.items,
  }) : _collapseHandler = const CollapseHandler(),
       visibleItems = [
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

  final CollapseHandler<ThreadCommentModel> _collapseHandler;

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
    final updatedItems = _collapseHandler.rebuildWith(
      oldItems: items,
      newItems: [
        for (final comment in comments) ThreadCommentModel(comment: comment),
      ],
    );

    return ThreadListModel(
      repositoryList: repositoryList,
      items: updatedItems,
    );
  }

  ThreadListModel toggleExpansion({
    required ThreadCommentModel comment,
  }) {
    final updatedItems = _collapseHandler.toggleExpansion(
      items: items,
      itemToToggle: comment,
    );
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
