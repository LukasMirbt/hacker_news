import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Html extends StatelessWidget {
  const Html({super.key});

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (AppCurrentUserCommentData data) => data.htmlText,
    );

    final onLinkPressed = context.select(
      (AppCurrentUserCommentData data) => data.onLinkPressed,
    );

    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: onLinkPressed,
    );
  }
}
