import 'package:app/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentTitle extends StatelessWidget {
  const CommentTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.select(
      (CommentBloc bloc) => bloc.state.header.title,
    );

    final textTheme = TextTheme.of(context);

    return Text(
      title,
      style: textTheme.titleMedium,
    );
  }
}
