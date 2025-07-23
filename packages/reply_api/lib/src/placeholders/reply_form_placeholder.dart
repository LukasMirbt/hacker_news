import 'package:reply_api/reply_api.dart';

class ReplyFormPlaceholder extends ReplyForm {
  const ReplyFormPlaceholder({
    String? parent,
    String? goto,
    String? hmac,
    String? text,
  }) : super(
         parent: parent ?? 'parent',
         goto: goto ?? 'goto',
         hmac: hmac ?? 'hmac',
         text: text ?? 'text',
       );
}
