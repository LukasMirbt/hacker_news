import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteOption extends StatelessWidget {
  const DeleteOption({super.key});

  @override
  Widget build(BuildContext context) {
    final deleteUrl = context.select(
      (CurrentUserThreadCommentModel model) => model.deleteUrl,
    );

    if (deleteUrl == null) return const SizedBox.shrink();

    return DeleteOptionBody(url: deleteUrl);
  }
}
