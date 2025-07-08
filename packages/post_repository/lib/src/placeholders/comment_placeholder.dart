import 'package:post_repository/post_repository.dart';

class CommentPlaceholder extends Comment {
  CommentPlaceholder({
    String? id,
    int? indent,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
  }) : super(
         id: id ?? 'id',
         indent: indent ?? 1,
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
       );
}
