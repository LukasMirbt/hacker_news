import 'package:post_repository/post_repository.dart';

class CommentPlaceholder extends Comment {
  CommentPlaceholder({
    String? id,
    int? indent,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
    int? score,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    String? replyUrl,
  }) : super(
         id: id ?? 'id',
         indent: indent ?? 1,
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         score: score ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         replyUrl: replyUrl ?? 'replyUrl',
       );
}
