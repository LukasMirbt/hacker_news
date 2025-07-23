import 'package:post_api/post_api.dart';

class CommentFormPlaceholder extends CommentForm {
  const CommentFormPlaceholder({
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
