import 'package:collapse_handler/collapse_handler.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:thread_repository/thread_repository.dart';

class PaginatedThreadFeedModel extends Equatable {
  PaginatedThreadFeedModel({
    required this.feed,
    required this.items,
    CollapseHandler<ThreadFeedItemModel>? collapseHandler,
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
        for (final item in feed.items) ThreadFeedItemModel(item: item),
      ],
    );
  }

  final CollapseHandler<ThreadFeedItemModel> _collapseHandler;

  @visibleForTesting
  final PaginatedThreadFeed feed;

  final List<ThreadFeedItemModel> items;

  final List<ThreadFeedItemModel> visibleItems;

  bool get isPlaceholder => false;
  bool get hasReachedMax => feed.hasReachedMax;
  bool get isEmpty => feed.isEmpty;

  PaginatedThreadFeed toRepository() => feed;

  ThreadFeedItemModel? findById(String id) {
    return items.firstWhereOrNull(
      (item) => item.id == id,
    );
  }

  PaginatedThreadFeedModel update(ThreadFeedItemModel updatedItem) {
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
    required ThreadFeedItemModel afterItem,
    required ThreadFeedItemModel newItem,
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
        for (final item in feed.items) ThreadFeedItemModel(item: item),
      ],
    );

    return PaginatedThreadFeedModel(
      feed: feed,
      items: updatedItems,
    );
  }

  PaginatedThreadFeedModel toggleExpansion({
    required ThreadFeedItemModel item,
  }) {
    final updatedItems = _collapseHandler.toggleExpansion(
      items: items,
      itemToToggle: item,
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
