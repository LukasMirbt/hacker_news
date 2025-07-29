import 'package:post_repository/post_repository.dart';

class OtherUserCommentPlaceholder extends OtherUserComment {
  OtherUserCommentPlaceholder({
    String? id,
    int? indent,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    String? replyUrl,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
  }) : super(
         id: id ?? 'id',
         indent: indent ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         replyUrl: replyUrl ?? 'replyUrl',
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
       );
}
