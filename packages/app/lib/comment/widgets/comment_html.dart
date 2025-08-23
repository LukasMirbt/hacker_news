import 'package:app/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentHtml extends StatelessWidget {
  const CommentHtml({
    required this.padding,
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (CommentBloc bloc) => bloc.state.header.htmlText,
    );

    if (htmlText == null) return const SizedBox.shrink();

    return Padding(
      padding: padding,
      child: CommentHtmlBody(htmlText: htmlText),
    );
  }
}
