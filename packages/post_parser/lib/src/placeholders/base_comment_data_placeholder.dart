import 'package:post_parser/post_parser.dart';

class CommentDataPlaceholder extends BaseCommentData {
  CommentDataPlaceholder({
    String? id,
    int? indent,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    String? replyUrl,
  }) : super(
         id: id ?? 'id',
         indent: indent ?? 1,
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         replyUrl: replyUrl ?? 'replyUrl',
       );
}
