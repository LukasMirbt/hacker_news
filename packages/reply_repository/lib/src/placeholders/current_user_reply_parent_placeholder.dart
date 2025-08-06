import 'package:reply_repository/reply_repository.dart';

class CurrentUserReplyParentPlaceholder extends CurrentUserReplyParent {
  CurrentUserReplyParentPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    int? score,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         score: score ?? 1,
       );
}
