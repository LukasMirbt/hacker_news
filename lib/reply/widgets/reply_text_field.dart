import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyTextField extends StatefulWidget {
  const ReplyTextField({super.key});

  @override
  State<ReplyTextField> createState() => _ReplyTextFieldState();
}

class _ReplyTextFieldState extends State<ReplyTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final state = context.read<ReplyBloc>().state;
    final text = state.form.text;
    _controller = TextEditingController(text: text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocListener<ReplyBloc, ReplyState>(
      listenWhen: (previous, current) =>
          previous.form.text != current.form.text,
      listener: (context, state) {
        final text = state.form.text;
        if (text != _controller.text) {
          _controller.text = text;
        }
      },
      child: TextField(
        controller: _controller,
        autofocus: true,
        expands: true,
        maxLines: null,
        decoration: InputDecoration.collapsed(
          hintText: l10n.reply_textFieldHintText,
        ),
        onChanged: (value) {
          context.read<ReplyBloc>().add(
            ReplyTextChanged(value),
          );
        },
      ),
    );
  }
}
