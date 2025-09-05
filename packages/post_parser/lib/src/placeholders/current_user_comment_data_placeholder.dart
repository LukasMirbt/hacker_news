import 'package:post_parser/post_parser.dart';

class CurrentUserCommentDataPlaceholder extends CurrentUserCommentData {
  CurrentUserCommentDataPlaceholder({
    BaseCommentData? base,
    int? score,
    String? editUrl,
    String? deleteUrl,
  }) : super(
         base: base ?? BaseCommentDataPlaceholder(),
         score: score ?? 0,
         editUrl: editUrl ?? 'editUrl',
         deleteUrl: deleteUrl ?? 'deleteUrl',
       );
}
