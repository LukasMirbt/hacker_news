import 'package:reply_repository/reply_repository.dart';

class ReplyParentPlaceholder extends ReplyParent {
  ReplyParentPlaceholder({
    String? id,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
  }) : super(
         id: id ?? 'id',
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
       );
}
