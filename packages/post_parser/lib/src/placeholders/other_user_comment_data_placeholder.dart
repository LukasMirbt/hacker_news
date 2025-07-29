import 'package:post_parser/post_parser.dart';

class OtherUserCommentDataPlaceholder extends OtherUserCommentData {
  OtherUserCommentDataPlaceholder({
    BaseCommentData? base,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
  }) : super(
         base: base ?? BaseCommentDataPlaceholder(),
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
       );
}
