import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentUserThreadCommentOptionsBody extends StatelessWidget {
  const CurrentUserThreadCommentOptionsBody(
    this.comment, {
    super.key,
  });

  final CurrentUserThreadCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: comment,
      child: const AppBottomSheet(
        children: [
          EditOption(),
          ViewPostOption(),
          ReplyOption(),
          ShareOption(),
          OpenOnWebOption(),
          DeleteOption(),
        ],
      ),
    );
  }
}
