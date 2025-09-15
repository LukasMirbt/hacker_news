import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderHtml extends StatelessWidget {
  const PostHeaderHtml({
    required this.htmlText,
    super.key,
  });

  final String htmlText;

  @override
  Widget build(BuildContext context) {
    return AppHtmlWidget(
      html: htmlText,
      onLinkPressed: (url) {
        final data = context.read<AppPostHeaderData>();
        data.onTextLinkPressed(url);
      },
    );
  }
}
