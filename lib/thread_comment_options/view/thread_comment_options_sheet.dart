import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadCommentOptionsSheet extends StatelessWidget {
  const ThreadCommentOptionsSheet({super.key});

  static void show({
    required BuildContext context,
    required ThreadComment comment,
  }) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        create: (_) => ThreadCommentOptionsBloc(comment: comment),
        child: const ThreadCommentOptionsSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        ReplyOption(),
        ViewPostOption(),
        OpenOnWebOption(),
      ],
    );
  }
}
