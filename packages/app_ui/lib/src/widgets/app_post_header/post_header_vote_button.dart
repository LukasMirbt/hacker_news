import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderVoteButton extends StatelessWidget {
  const PostHeaderVoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final voteButton = context.select(
      (AppPostHeaderData data) => data.voteButton,
    );

    if (voteButton != null) return voteButton;

    return const PostHeaderButtonPlaceholder();
  }
}
