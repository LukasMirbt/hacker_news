import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_form/comment_form.dart';

class CommentFormHtml extends StatelessWidget {
  const CommentFormHtml({
    required this.padding,
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (CommentFormBloc bloc) => bloc.state.post.header.htmlText,
    );

    if (htmlText == null) return const SizedBox.shrink();

    return Padding(
      padding: padding,
      child: CommentFormHtmlBody(htmlText: htmlText),
    );
  }
}
