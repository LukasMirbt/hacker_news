import 'package:post_parser/post_parser.dart';

class CurrentUserCommentDataPlaceholder extends CurrentUserCommentData {
  CurrentUserCommentDataPlaceholder({
    BaseCommentData? base,
    int? score,
  }) : super(
         base: base ?? BaseCommentDataPlaceholder(),
         score: score ?? 0,
       );
}
