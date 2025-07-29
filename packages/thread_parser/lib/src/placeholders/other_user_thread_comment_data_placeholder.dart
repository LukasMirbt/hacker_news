import 'package:thread_parser/thread_parser.dart';

class OtherUserThreadCommentDataPlaceholder extends OtherUserThreadCommentData {
  OtherUserThreadCommentDataPlaceholder({
    BaseThreadCommentData? base,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
  }) : super(
         base: base ?? BaseThreadCommentDataPlaceholder(),
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
       );
}
