import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_post_header_data.dart';
export 'post_header_action_row.dart';
export 'post_header_button_placeholder.dart';
export 'post_header_comment_button.dart';
export 'post_header_content_row.dart';
export 'post_header_share_button.dart';
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
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.lg),
          const PostHeaderContentRow(),
          if (data.htmlText != null)
            const Padding(
              padding: EdgeInsets.only(top: AppSpacing.lg),
              child: Divider(height: 1),
            )
          else
            const SizedBox(height: AppSpacing.xs),
          const PostHeaderActionRow(),
          const Divider(height: 1),
        ],
      ),
    );
  }
}
