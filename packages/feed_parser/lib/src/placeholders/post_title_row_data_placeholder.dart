import 'package:feed_parser/feed_parser.dart';

class PostTitleRowDataPlaceholder extends PostTitleRowData {
  const PostTitleRowDataPlaceholder({
    String? upvoteUrl,
    bool? hasBeenUpvoted,
    BaseTitleRowData? base,
  }) : super(
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         base: base ?? const BaseTitleRowDataPlaceholder(),
       );
}
