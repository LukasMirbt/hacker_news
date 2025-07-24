import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      maxLines: null,

      decoration: const InputDecoration(
        hintText: 'Your comment',
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (value) {
        context.read<CommentBloc>().add(
          CommentTextChanged(value),
        );
      },
    );
  }
}
