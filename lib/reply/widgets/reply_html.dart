import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyHtml extends StatelessWidget {
  const ReplyHtml({
    required this.padding,
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (ReplyBloc bloc) => bloc.state.form.htmlText,
    );

    if (htmlText == null) return const SizedBox.shrink();

    return Padding(
      padding: padding,
      child: ReplyHtmlBody(htmlText: htmlText),
    );
  }
}
