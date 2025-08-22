import 'package:app/comment/comment.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentHtmlBody extends StatelessWidget {
  const CommentHtmlBody({
    required this.htmlText,
    super.key,
  });

  final String htmlText;

  @override
  Widget build(BuildContext context) {
    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: (url) {
        context.read<CommentBloc>().add(
          CommentLinkPressed(url),
        );
      },
    );
  }
}
