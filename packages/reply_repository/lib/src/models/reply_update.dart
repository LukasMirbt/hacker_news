import 'package:reply_repository/reply_repository.dart';

class ReplyUpdate {
  const ReplyUpdate({
    required this.form,
    required this.comment,
  });

  final ReplyForm form;
  final CommentData comment;
}
