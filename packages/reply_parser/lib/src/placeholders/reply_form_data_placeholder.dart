import 'package:reply_parser/reply_parser.dart';

class ReplyFormDataPlaceholder extends ReplyFormData {
  const ReplyFormDataPlaceholder({
    String? parent,
    String? goto,
    String? hmac,
  }) : super(
         parent: parent ?? 'parent',
         goto: goto ?? 'goto',
         hmac: hmac ?? 'hmac',
       );
}
