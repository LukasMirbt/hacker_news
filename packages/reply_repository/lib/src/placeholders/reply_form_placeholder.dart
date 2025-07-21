import 'package:reply_repository/reply_repository.dart';

class ReplyFormPlaceholder extends ReplyForm {
  ReplyFormPlaceholder({
    Hnuser? hnuser,
    DateTime? age,
    String? htmlText,
    String? parent,
    String? goto,
    String? hmac,
    String? text,
  }) : super(
         hnuser: hnuser ?? const HnuserPlaceholder(),
         age: age ?? DateTime(1),
         htmlText: htmlText ?? 'htmlText',
         parent: parent ?? 'parent',
         goto: goto ?? 'goto',
         hmac: hmac ?? 'hmac',
         text: text ?? 'text',
       );
}
