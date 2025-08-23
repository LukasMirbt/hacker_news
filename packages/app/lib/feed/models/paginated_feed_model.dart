import 'package:app/feed/feed.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:feed_repository/feed_repository.dart';

class PaginatedFeedModel extends Equatable {
  const PaginatedFeedModel({
    required this.items,
    required PaginatedFeed feed,
  }) : _feed = feed;

  factory PaginatedFeedModel.fromRepository(PaginatedFeed feed) {
    return PaginatedFeedModel(
      feed: feed,
      items: [
        for (final item in feed.items) FeedItemModel(item),
      ],
    );
  }

  final PaginatedFeed _feed;
  final List<FeedItemModel> items;

  bool get isPlaceholder => false;
  bool get hasReachedMax => _feed.hasReachedMax;
  bool get isEmpty => _feed.isEmpty;

  PaginatedFeed toRepository() => _feed;

  FeedItemModel? findById(String id) {
    return items.firstWhereOrNull(
      (item) => item.id == id,
    );
  }

  PaginatedFeedModel update(FeedItemModel updatedItem) {
    final updatedFeed = _feed.update(
      updatedItem.toRepository(),
    );
    return PaginatedFeedModel.fromRepository(updatedFeed);
  }

  @override
  List<Object?> get props => [
    _feed,
    items,
  ];
}
