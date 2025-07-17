import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadItemHtml extends StatelessWidget {
  const ThreadItemHtml({super.key});

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (AppThreadItemData data) => data.htmlText,
    );

    final onLinkPressed = context.select(
      (AppThreadItemData data) => data.onLinkPressed,
    );

    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: onLinkPressed,
    );
  }
}
