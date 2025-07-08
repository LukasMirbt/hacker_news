import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_form/reply_form.dart';

class ReplyFormHtml extends StatelessWidget {
  const ReplyFormHtml({
    required this.padding,
    super.key,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (ReplyFormBloc bloc) => bloc.state.replyForm.htmlText,
    );

    if (htmlText == null) return const SizedBox.shrink();

    return Padding(
      padding: padding,
      child: ReplyFormHtmlBody(htmlText: htmlText),
    );
  }
}
