import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_form/comment_form.dart';

class CommentFormHtmlBody extends StatelessWidget {
  const CommentFormHtmlBody({
    required this.htmlText,
    super.key,
  });

  final String htmlText;

  @override
  Widget build(BuildContext context) {
    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: (url) {
        context.read<CommentFormBloc>().add(
          CommentFormLinkPressed(url),
        );
      },
    );
  }
}
