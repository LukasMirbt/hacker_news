import 'package:post_repository/post_repository.dart';

class PostHeaderPlaceholder extends PostHeader {
  PostHeaderPlaceholder({
    String? id,
    String? title,
    String? url,
    String? upvoteUrl,
    bool? hasBeenUpvoted,
    String? urlHost,
    int? score,
    Hnuser? hnuser,
    DateTime? age,
    int? commentCount,
    String? htmlText,
    CommentForm? commentForm,
  }) : super(
         id: id ?? 'id',
         title: title ?? 'title',
         url: url ?? 'url',
         upvoteUrl: upvoteUrl ?? 'upvoteUrl',
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         urlHost: urlHost ?? 'urlHost',
         score: score ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         commentCount: commentCount ?? 1,
         htmlText: htmlText ?? 'htmlText',
         commentForm: commentForm ?? const CommentFormPlaceholder(),
       );
}
