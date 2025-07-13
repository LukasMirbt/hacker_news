import 'package:thread_parser/thread_parser.dart';

class ThreadCommentDataPlaceholder extends ThreadCommentData {
  ThreadCommentDataPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    int? indent,
    super.score,
    super.hasBeenUpvoted,
    super.parentUrl,
    super.contextUrl,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         indent: indent ?? 1,
       );
}
