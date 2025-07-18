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
    required this.user,
    required this.items,
    required String? next,
    this.isInitial = false,
  }) : _next = next;

  factory PaginatedThreadFeed.initial(User user) {
    return PaginatedThreadFeed(
      user: user,
      next: null,
      isInitial: true,
      items: const [],
    );
  }

  final String? _next;
  final User user;
  final List<ThreadFeedItem> items;
  final bool isInitial;

  bool get isEmpty => !isInitial && items.isEmpty;
  bool get hasReachedMax => !isInitial && _next == null;

  ThreadFeedPageUrl get nextUrl {
    if (isInitial) return InitialPageUrl(id: user.id);

    final next = _next;
    if (next == null) throw const ReachedMaxFailure();

    return NextPageUrl(url: next);
  }

  PaginatedThreadFeed extendWith(ThreadListPageData nextPage) {
    return PaginatedThreadFeed(
      user: user,
      next: nextPage.moreLink,
      items: [
        ...items,
        for (final item in nextPage.comments) ThreadFeedItem.from(item),
      ],
    );
  }

  @override
  List<Object?> get props => [
    _next,
    user,
    items,
    isInitial,
  ];
}
