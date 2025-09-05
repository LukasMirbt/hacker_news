import 'package:reply_repository/reply_repository.dart';

class ReplyPlaceholder extends Reply {
  ReplyPlaceholder({
    String? id,
    String? parentId,
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
         parentId: parentId ?? 'parentId',
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
