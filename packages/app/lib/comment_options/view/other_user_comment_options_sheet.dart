import 'package:app/comment_options/comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherUserCommentOptionsSheet extends StatelessWidget {
  const OtherUserCommentOptionsSheet(
    this.comment, {
    super.key,
  });

  final OtherUserCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: comment,
      child: const AppBottomSheet(
        children: [
          ReplyOption(),
          ShareOption(),
          OpenOnWebOption(),
        ],
      ),
    );
  }
}
