import 'package:equatable/equatable.dart';
import 'package:feed_repository/feed_repository.dart';

class ReachedMaxFailure with EquatableMixin implements Exception {
  const ReachedMaxFailure();

  @override
  List<Object?> get props => [];
}

class PaginatedFeed extends Equatable {
  const PaginatedFeed({
    required this.type,
    required this.items,
    required String? next,
    this.isInitial = false,
  }) : _next = next;

  factory PaginatedFeed.initial(FeedType type) {
    return PaginatedFeed(
      type: type,
      next: null,
      isInitial: true,
      items: const [],
    );
  }

  final String? _next;
  final FeedType type;
  final List<FeedItem> items;
  final bool isInitial;

  bool get isEmpty => !isInitial && items.isEmpty;
  bool get hasReachedMax => !isInitial && _next == null;

  String get nextUrl {
    if (isInitial) return type.endpoint;

    final next = _next;
    if (next == null) throw const ReachedMaxFailure();

    return next;
  }

  PaginatedFeed extendWith(FeedPageData nextPage) {
    return PaginatedFeed(
      type: type,
      next: nextPage.moreLink,
      items: [
        ...items,
        for (final item in nextPage.items) FeedItem.from(item),
      ],
    );
  }

  PaginatedFeed update(FeedItem updatedItem) {
    return PaginatedFeed(
      type: type,
      next: _next,
      isInitial: isInitial,
      items: [
        for (final item in items)
          if (item.id == updatedItem.id) updatedItem else item,
      ],
    );
  }

  @override
  List<Object?> get props => [
    _next,
    type,
    items,
    isInitial,
  ];
}
