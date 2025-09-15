import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Html extends StatelessWidget {
  const Html({super.key});

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (AppOtherUserCommentData data) => data.htmlText,
    );

    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: (url) {
        final data = context.read<AppOtherUserCommentData>();
        data.onLinkPressed(url);
      },
    );
  }
}
