import 'package:reply_repository/reply_repository.dart';

class ReplyPagePlaceholder extends ReplyPage {
  ReplyPagePlaceholder({
    ReplyParent? parent,
    ReplyForm? form,
  }) : super(
         parent: parent ?? OtherUserReplyParentPlaceholder(),
         form: form ?? ReplyFormPlaceholder(),
       );
}
