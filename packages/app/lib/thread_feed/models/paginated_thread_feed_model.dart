import 'package:app/thread_feed/thread_feed.dart';
import 'package:collapse_handler/collapse_handler.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:thread_repository/thread_repository.dart';

class PaginatedThreadFeedModel extends Equatable {
  PaginatedThreadFeedModel({
    required this.feed,
    required this.items,
    CollapseHandler<ThreadCommentModel>? collapseHandler,
  }) : _collapseHandler = collapseHandler ?? const CollapseHandler(),
       visibleItems = [
         for (final item in items)
           if (item.isParentExpanded) item,
       ];

  factory PaginatedThreadFeedModel.fromRepository(
    PaginatedThreadFeed feed,
  ) {
    return PaginatedThreadFeedModel(
      feed: feed,
      items: [
        for (final item in feed.items) ThreadCommentModel.from(item),
      ],
    );
  }

  final CollapseHandler<ThreadCommentModel> _collapseHandler;

  @visibleForTesting
  final PaginatedThreadFeed feed;

  final List<ThreadCommentModel> items;

  final List<ThreadCommentModel> visibleItems;

  bool get isPlaceholder => false;
  bool get hasReachedMax => feed.hasReachedMax;
  bool get isEmpty => feed.isEmpty;

  PaginatedThreadFeed toRepository() => feed;

  ThreadCommentModel? findById(String id) {
    return items.firstWhereOrNull(
      (item) => item.id == id,
    );
  }

  PaginatedThreadFeedModel update(ThreadCommentModel updatedItem) {
    final updatedList = [
      for (final item in items)
        if (item.id == updatedItem.id) updatedItem else item,
    ];

    return PaginatedThreadFeedModel(
      feed: feed,
      items: updatedList,
    );
  }

  PaginatedThreadFeedModel insertAfter({
    required ThreadCommentModel afterItem,
    required ThreadCommentModel newItem,
  }) {
    final index = items.indexOf(afterItem);
    if (index == -1) return this;

    final updatedItems = [...items]..insert(index + 1, newItem);

    return PaginatedThreadFeedModel(
      feed: feed,
      items: updatedItems,
    );
  }

  PaginatedThreadFeedModel rebuildWith(PaginatedThreadFeed feed) {
    final updatedItems = _collapseHandler.rebuildWith(
      oldItems: items,
      newItems: [
        for (final item in feed.items) ThreadCommentModel.from(item),
      ],
    );

    return PaginatedThreadFeedModel(
      feed: feed,
      items: updatedItems,
    );
  }

  PaginatedThreadFeedModel toggleExpansion({
    required ThreadCommentModel comment,
  }) {
    final index = items.indexOf(comment);
    if (index == -1) return this;

    final updatedItems = _collapseHandler.toggleExpansion(
      items: items,
      index: index,
    );

    return PaginatedThreadFeedModel(
      feed: feed,
      items: updatedItems,
    );
  }

  @override
  List<Object?> get props => [
    _collapseHandler,
    feed,
    items,
  ];
}
