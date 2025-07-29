import 'package:thread_repository/thread_repository.dart';

class CurrentUserThreadCommentPlaceholder extends CurrentUserThreadComment {
  CurrentUserThreadCommentPlaceholder({
    String? id,
    int? indent,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    String? replyUrl,
    String? parentUrl,
    String? contextUrl,
    String? onUrl,
    String? onTitle,
    int? score,
  }) : super(
         id: id ?? 'id',
         indent: indent ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         score: score ?? 1,
         replyUrl: replyUrl ?? 'replyUrl',
         parentUrl: parentUrl ?? 'parentUrl',
         contextUrl: contextUrl ?? 'contextUrl',
         onUrl: onUrl ?? 'onUrl',
         onTitle: onTitle ?? 'onTitle',
       );
}
