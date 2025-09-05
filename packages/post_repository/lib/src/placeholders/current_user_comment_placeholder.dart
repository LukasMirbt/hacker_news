import 'package:post_repository/post_repository.dart';

class CurrentUserCommentPlaceholder extends CurrentUserComment {
  CurrentUserCommentPlaceholder({
    String? id,
    int? indent,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    String? replyUrl,
    int? score,
    String? editUrl,
    String? deleteUrl,
  }) : super(
         id: id ?? 'id',
         indent: indent ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         replyUrl: replyUrl ?? 'replyUrl',
         score: score ?? 1,
         editUrl: editUrl ?? 'editUrl',
         deleteUrl: deleteUrl ?? 'deleteUrl',
       );
}
