import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentHtml extends StatelessWidget {
  const CommentHtml({super.key});

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (AppCommentData data) => data.htmlText,
    );

    final onLinkPressed = context.select(
      (AppCommentData data) => data.onLinkPressed,
    );

    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: onLinkPressed,
    );
  }
}
