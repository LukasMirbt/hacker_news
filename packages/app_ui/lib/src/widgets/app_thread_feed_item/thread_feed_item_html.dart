import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadFeedItemHtml extends StatelessWidget {
  const ThreadFeedItemHtml({super.key});

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (AppThreadFeedItemData data) => data.htmlText,
    );

    final onLinkPressed = context.select(
      (AppThreadFeedItemData data) => data.onLinkPressed,
    );

    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: onLinkPressed,
    );
  }
}
