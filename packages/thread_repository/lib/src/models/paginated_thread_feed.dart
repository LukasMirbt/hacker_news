import 'package:authentication_api/authentication_api.dart';
import 'package:equatable/equatable.dart';
import 'package:thread_repository/thread_repository.dart';

class ReachedMaxFailure with EquatableMixin implements Exception {
  const ReachedMaxFailure();

  @override
  List<Object?> get props => [];
}

class PaginatedThreadFeed extends Equatable {
  const PaginatedThreadFeed({
    required this.initialUri,
    required this.items,
    required String? nextUrl,
    this.isInitial = false,
  }) : _next = nextUrl;

  factory PaginatedThreadFeed.initial(User user) {
    return PaginatedThreadFeed(
      initialUri: Uri(
        path: 'threads',
        queryParameters: {'id': user.id},
      ),
      nextUrl: null,
      isInitial: true,
      items: const [],
    );
  }

  final String? _next;
  final Uri initialUri;
  final List<ThreadFeedItem> items;
  final bool isInitial;

  bool get isEmpty => !isInitial && items.isEmpty;
  bool get hasReachedMax => !isInitial && _next == null;

  String get nextUrl {
    if (isInitial) return initialUri.toString();

    final next = _next;
    if (next == null) throw const ReachedMaxFailure();

    return next;
  }

  PaginatedThreadFeed extendWith(ThreadListPageData nextPage) {
    return PaginatedThreadFeed(
      initialUri: initialUri,
      nextUrl: nextPage.moreLink,
      items: [
        ...items,
        for (final item in nextPage.comments) ThreadFeedItem.from(item),
      ],
    );
  }

  PaginatedThreadFeed update(ThreadFeedItem updatedItem) {
    return PaginatedThreadFeed(
      initialUri: initialUri,
      nextUrl: _next,
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
    initialUri,
    items,
    isInitial,
  ];
}
