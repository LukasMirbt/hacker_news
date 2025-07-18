import 'package:authentication_api/authentication_api.dart';
import 'package:thread_repository/thread_repository.dart';

class PaginatedThreadFeedPlaceholder extends PaginatedThreadFeed {
  const PaginatedThreadFeedPlaceholder({
    User? user,
    List<ThreadFeedItem>? items,
    bool? isInitial,
    String? next,
  }) : super(
         user: user ?? const UserPlaceholder(),
         items: items ?? const [],
         isInitial: isInitial ?? false,
         next: next ?? 'next',
       );
}
