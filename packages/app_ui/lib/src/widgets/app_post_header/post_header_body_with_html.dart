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
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xlg,
            ),
            child: _Content(htmlText: htmlText),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Divider(height: 1),
          const PostHeaderActionRow(),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.htmlText});

  final String htmlText;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.lg,
      children: [
        const PostHeaderContentRow(),
        PostHeaderHtml(htmlText: htmlText),
      ],
    );
  }
}
