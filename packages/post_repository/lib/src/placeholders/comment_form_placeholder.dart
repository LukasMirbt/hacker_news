import 'package:post_repository/post_repository.dart';

class CommentFormPlaceholder extends CommentForm {
  const CommentFormPlaceholder({
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
