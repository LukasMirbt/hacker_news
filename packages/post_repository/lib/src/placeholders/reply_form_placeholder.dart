import 'package:post_repository/post_repository.dart';

class ReplyFormPlaceholder extends ReplyForm {
  ReplyFormPlaceholder({
    String? id,
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    super.hmac,
  }) : super(
         id: id ?? 'id',
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
       );
}
