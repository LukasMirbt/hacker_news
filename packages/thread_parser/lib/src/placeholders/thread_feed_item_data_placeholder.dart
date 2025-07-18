import 'package:thread_parser/thread_parser.dart';

class ThreadFeedItemDataPlaceholder extends ThreadFeedItemData {
  ThreadFeedItemDataPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    int? indent,
    int? score,
    bool? hasBeenUpvoted,
    String? upvoteUrl,
    String? parentUrl,
    String? contextUrl,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         indent: indent ?? 1,
         score: score ?? 1,
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         parentUrl: parentUrl ?? 'parentUrl',
         contextUrl: contextUrl ?? 'contextUrl',
       );
}
