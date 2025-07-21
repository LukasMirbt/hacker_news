import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyTextField extends StatelessWidget {
  const ReplyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 5,
      maxLines: null,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        context.read<ReplyBloc>().add(
          ReplyTextChanged(value),
        );
      },
    );
  }
}
