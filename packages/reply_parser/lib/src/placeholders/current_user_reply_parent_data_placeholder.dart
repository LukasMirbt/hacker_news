import 'package:reply_parser/reply_parser.dart';

class CurrentUserReplyParentDataPlaceholder extends CurrentUserReplyParentData {
  CurrentUserReplyParentDataPlaceholder({
    BaseReplyParentData? base,
    int? score,
  }) : super(
         base: base ?? BaseReplyParentDataPlaceholder(),
         score: score ?? 0,
       );
}
