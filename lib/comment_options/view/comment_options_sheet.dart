import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:post_repository/post_repository.dart';

class CommentOptionsSheet extends StatelessWidget {
  const CommentOptionsSheet({super.key});

  static Future<void> show({
    required BuildContext context,
    required Comment comment,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        create: (_) => CommentOptionsBloc(comment: comment),
        child: const CommentOptionsSheet(),
      ),
    );
  }

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
