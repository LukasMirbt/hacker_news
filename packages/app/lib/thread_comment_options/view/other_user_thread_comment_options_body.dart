import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OtherUserThreadCommentOptionsBody extends StatelessWidget {
  const OtherUserThreadCommentOptionsBody(
    this.comment, {
    super.key,
  });

  final OtherUserThreadCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: comment,
      child: const AppBottomSheet(
        children: [
          ReplyOption(),
          ViewPostOption(),
          ShareOption(),
          OpenOnWebOption(),
        ],
      ),
    );
  }
}
