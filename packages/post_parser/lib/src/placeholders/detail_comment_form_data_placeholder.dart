import 'package:post_parser/post_parser.dart';

class DetailCommentFormDataPlaceholder extends DetailCommentFormData {
  const DetailCommentFormDataPlaceholder({
    String? parent,
    String? goto,
    String? hmac,
  }) : super(
         parent: parent ?? 'parent',
         goto: goto ?? 'goto',
         hmac: hmac ?? 'hmac',
       );
}
