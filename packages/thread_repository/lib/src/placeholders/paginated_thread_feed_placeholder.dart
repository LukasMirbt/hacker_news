import 'package:thread_repository/thread_repository.dart';

class PaginatedThreadFeedPlaceholder extends PaginatedThreadFeed {
  PaginatedThreadFeedPlaceholder({
    Uri? initialUri,
    List<ThreadFeedItem>? items,
    bool? isInitial,
    String? nextUrl,
  }) : super(
         initialUri: initialUri ?? Uri.parse('https://example.com'),
         items: items ?? const [],
         isInitial: isInitial ?? false,
         nextUrl: nextUrl ?? 'nextUrl',
       );
}
