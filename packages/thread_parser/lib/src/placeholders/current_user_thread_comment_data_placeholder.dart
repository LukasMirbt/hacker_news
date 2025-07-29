import 'package:thread_parser/thread_parser.dart';

class CurrentUserThreadCommentDataPlaceholder
    extends CurrentUserThreadCommentData {
  CurrentUserThreadCommentDataPlaceholder({
    BaseThreadCommentData? base,
    int? score,
  }) : super(
         base: base ?? BaseThreadCommentDataPlaceholder(),
         score: score ?? 1,
       );
}
