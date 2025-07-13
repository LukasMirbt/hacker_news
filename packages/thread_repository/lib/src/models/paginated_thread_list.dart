import 'package:authentication_api/authentication_api.dart';
import 'package:equatable/equatable.dart';
import 'package:thread_repository/thread_repository.dart';

class ReachedMaxFailure with EquatableMixin implements Exception {
  const ReachedMaxFailure();

  @override
  List<Object?> get props => [];
}

class PaginatedThreadList extends Equatable {
  const PaginatedThreadList({
    required this.initialUri,
    required this.items,
    required String? nextUrl,
    this.isInitial = false,
  }) : _next = nextUrl;

  factory PaginatedThreadList.initial(User user) {
    return PaginatedThreadList(
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
  final List<ThreadCommentData> items;
  final bool isInitial;

  bool get isEmpty => !isInitial && items.isEmpty;
  bool get hasReachedMax => !isInitial && _next == null;

  String get nextUrl {
    if (isInitial) return initialUri.toString();

    final next = _next;
    if (next == null) throw const ReachedMaxFailure();

    return next;
  }

  PaginatedThreadList extendWith(ThreadListPageData nextPage) {
    return PaginatedThreadList(
      initialUri: initialUri,
      nextUrl: nextPage.moreLink,
      items: [
        ...items,
        ...nextPage.comments,
      ],
    );
  }

  PaginatedThreadList updateItem(ThreadCommentData updatedItem) {
    return PaginatedThreadList(
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
