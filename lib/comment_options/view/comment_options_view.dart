import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment_options/comment_options.dart';

class CommentOptionsView extends StatelessWidget {
  const CommentOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        ReplyOption(),
        OpenOnWebOption(),
      ],
    );
  }
}
