import 'package:thread_parser/thread_parser.dart';

class ThreadFeedPageDataPlaceholder extends ThreadFeedPageData {
  const ThreadFeedPageDataPlaceholder({
    List<ThreadCommentData>? comments,
    super.moreLink,
  }) : super(
         comments: comments ?? const [],
       );
}
