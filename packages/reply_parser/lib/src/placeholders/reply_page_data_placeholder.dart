import 'package:reply_parser/reply_parser.dart';

class ReplyPageDataPlaceholder extends ReplyPageData {
  ReplyPageDataPlaceholder({
    ReplyParentData? parentData,
    ReplyFormData? formData,
  }) : super(
         parentData: parentData ?? OtherUserReplyParentDataPlaceholder(),
         formData: formData ?? const ReplyFormDataPlaceholder(),
       );
}
