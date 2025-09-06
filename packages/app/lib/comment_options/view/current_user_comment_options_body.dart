import 'package:app/comment_options/comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentUserCommentOptionsBody extends StatelessWidget {
  const CurrentUserCommentOptionsBody(
    this.comment, {
    super.key,
  });

  final CurrentUserCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: comment,
      child: const AppBottomSheet(
        children: [
          EditOption(),
          ReplyOption(),
          ShareOption(),
          OpenOnWebOption(),
          DeleteOption(),
        ],
      ),
    );
  }
}
