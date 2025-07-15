import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

export 'app_post_header_data.dart';
export 'app_post_header_data_placeholder.dart';
export 'post_header_action_row.dart';
export 'post_header_button_placeholder.dart';
export 'post_header_comment_button.dart';
export 'post_header_content_row.dart';
export 'post_header_share_button.dart';
export 'post_header_vote_button.dart';

class PostHeaderBodyWithHtml extends StatelessWidget {
  const PostHeaderBodyWithHtml({
    required this.htmlText,
    super.key,
  });

  final String htmlText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PostHeaderContentRow(),
        const SizedBox(height: AppSpacing.lg),
        const Divider(height: 1),
        PostHeaderHtml(htmlText: htmlText),
        const SizedBox(height: AppSpacing.xs),
        const PostHeaderActionRow(),
      ],
    );
  }
}
