import 'package:thread_repository/thread_repository.dart';

class ThreadCommentPlaceholder extends ThreadComment {
  ThreadCommentPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    int? indent,
    int? score,
    bool? hasBeenUpvoted,
    String? parentUrl,
    String? contextUrl,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         indent: indent ?? 1,
         score: score ?? 0,
         hasBeenUpvoted: hasBeenUpvoted ?? false,
         parentUrl: parentUrl ?? 'parentUrl',
         contextUrl: contextUrl ?? 'contextUrl',
       );
}
