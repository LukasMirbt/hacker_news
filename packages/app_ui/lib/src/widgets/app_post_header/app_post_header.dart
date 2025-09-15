import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_post_header_data.dart';
export 'app_post_header_data_placeholder.dart';
export 'post_header_action_row.dart';
export 'post_header_body.dart';
export 'post_header_body_with_html.dart';
export 'post_header_button_placeholder.dart';
export 'post_header_comment_button.dart';
export 'post_header_content_row.dart';
export 'post_header_html.dart';
export 'post_header_options_button.dart';
export 'post_header_share_button.dart';
export 'post_header_subtitle.dart';
export 'post_header_title.dart';
export 'post_header_vote_button.dart';

class AppPostHeader extends StatelessWidget {
  const AppPostHeader({
    required this.data,
    super.key,
  });

  final AppPostHeaderData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (AppPostHeaderData data) => data.htmlText,
    );

    if (htmlText == null) return const PostHeaderBody();

    return PostHeaderBodyWithHtml(htmlText: htmlText);
  }
}
