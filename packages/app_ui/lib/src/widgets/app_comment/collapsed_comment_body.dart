import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

export 'app_comment_data.dart';
export 'comment_header_row.dart';
export 'comment_html.dart';
export 'comment_more_button.dart';
export 'comment_user_and_age.dart';
export 'comment_vote_button.dart';

class CollapsedCommentBody extends StatelessWidget {
  const CollapsedCommentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommentHeaderRow();
  }
}
