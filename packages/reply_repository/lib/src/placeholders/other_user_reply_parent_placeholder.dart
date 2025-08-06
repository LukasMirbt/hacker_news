import 'package:reply_repository/reply_repository.dart';

class OtherUserReplyParentPlaceholder extends OtherUserReplyParent {
  OtherUserReplyParentPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
       );
}
