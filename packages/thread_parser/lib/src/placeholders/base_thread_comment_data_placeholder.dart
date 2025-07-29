import 'package:thread_parser/thread_parser.dart';

class BaseThreadCommentDataPlaceholder extends BaseThreadCommentData {
  BaseThreadCommentDataPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    int? indent,
    String? parentUrl,
    String? contextUrl,
    String? onUrl,
    String? onTitle,
    String? replyUrl,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         indent: indent ?? 1,
         parentUrl: parentUrl ?? 'parentUrl',
         contextUrl: contextUrl ?? 'contextUrl',
         onUrl: onUrl ?? 'onUrl',
         onTitle: onTitle ?? 'onTitle',
         replyUrl: replyUrl ?? 'replyUrl',
       );
}
