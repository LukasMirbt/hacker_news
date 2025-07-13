import 'package:thread_parser/thread_parser.dart';

class ThreadListPageDataPlaceholder extends ThreadListPageData {
  const ThreadListPageDataPlaceholder({
    List<ThreadCommentData>? comments,
    super.moreLink,
  }) : super(
         comments: comments ?? const [],
       );
}
