import 'package:thread_parser/thread_parser.dart';

class ThreadFeedPageDataPlaceholder extends ThreadFeedPageData {
  const ThreadFeedPageDataPlaceholder({
    List<ThreadFeedItemData>? comments,
    super.moreLink,
  }) : super(
         comments: comments ?? const [],
       );
}
