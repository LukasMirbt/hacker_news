import 'package:reply_parser/reply_parser.dart';

class ReplyDataPlaceholder extends ReplyData {
  ReplyDataPlaceholder({
    ReplyCommentData? commentData,
    ReplyFormData? formData,
  }) : super(
         commentData: commentData ?? ReplyCommentDataPlaceholder(),
         formData: formData ?? const ReplyFormDataPlaceholder(),
       );
}
