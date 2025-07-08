import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_form/comment_form.dart';

class CommentFormTextField extends StatelessWidget {
  const CommentFormTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 5,
      maxLines: null,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        context.read<CommentFormBloc>().add(
          CommentFormTextChanged(value),
        );
      },
    );
  }
}
