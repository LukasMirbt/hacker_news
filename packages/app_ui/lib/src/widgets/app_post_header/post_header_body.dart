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

class PostHeaderBody extends StatelessWidget {
  const PostHeaderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: AppSpacing.sm),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xlg,
            ),
            child: PostHeaderContentRow(),
          ),
          SizedBox(height: AppSpacing.lg),
          Divider(height: 1),
          PostHeaderActionRow(),
        ],
      ),
    );
  }
}
