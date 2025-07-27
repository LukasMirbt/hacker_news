import 'package:reply_repository/reply_repository.dart';

class ReplyFormPlaceholder extends ReplyForm {
  ReplyFormPlaceholder({
    String? parentId,
    String? goto,
    String? hmac,
    String? text,
  }) : super(
         parentId: parentId ?? 'parentId',
         goto: goto ?? 'goto',
         hmac: hmac ?? 'hmac',
         text: text ?? 'text',
       );
}
