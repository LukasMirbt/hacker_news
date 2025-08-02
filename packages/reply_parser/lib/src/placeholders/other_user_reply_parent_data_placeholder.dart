import 'package:reply_parser/reply_parser.dart';

class OtherUserReplyParentDataPlaceholder extends OtherUserReplyParentData {
  OtherUserReplyParentDataPlaceholder({
    BaseReplyParentData? base,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
  }) : super(
         base: base ?? BaseReplyParentDataPlaceholder(),
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
       );
}
