import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_form/reply_form.dart';

class ReplyFormTextField extends StatelessWidget {
  const ReplyFormTextField({super.key});

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
        context.read<ReplyFormBloc>().add(
          ReplyFormTextChanged(value),
        );
      },
    );
  }
}
