import 'package:thread_parser/thread_parser.dart';

class CurrentUserThreadCommentDataPlaceholder
    extends CurrentUserThreadCommentData {
  CurrentUserThreadCommentDataPlaceholder({
    int? score,
    String? editUrl,
    String? deleteUrl,
    BaseThreadCommentData? base,
  }) : super(
         score: score ?? 1,
         editUrl: editUrl ?? 'editUrl',
         deleteUrl: deleteUrl ?? 'deleteUrl',
         base: base ?? BaseThreadCommentDataPlaceholder(),
       );
}
