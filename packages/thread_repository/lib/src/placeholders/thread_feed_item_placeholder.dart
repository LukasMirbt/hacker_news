import 'package:thread_repository/thread_repository.dart';

class ThreadFeedItemPlaceholder extends ThreadFeedItem {
  ThreadFeedItemPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    int? indent,
    super.score,
    super.hasBeenUpvoted,
    super.upvoteUrl,
    super.parentUrl,
    super.contextUrl,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         indent: indent ?? 1,
       );
}
