import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditOption extends StatelessWidget {
  const EditOption({super.key});

  @override
  Widget build(BuildContext context) {
    final editUrl = context.select(
      (CurrentUserThreadCommentModel model) => model.editUrl,
    );

    if (editUrl == null) return const SizedBox.shrink();

    return EditOptionBody(url: editUrl);
  }
}
