import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_comment_data.dart';
export 'app_comment_data_placeholder.dart';
export 'collapsed_comment_body.dart';
export 'comment_header_row.dart';
export 'comment_html.dart';
export 'comment_more_button.dart';
export 'comment_user_and_age.dart';
export 'comment_vote_button.dart';
export 'expanded_comment_body.dart';

class AppComment extends StatelessWidget {
  const AppComment({
    required this.data,
    super.key,
  });

  final AppCommentData data;

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
    final isExpanded = context.select(
      (AppCommentData data) => data.isExpanded,
    );

    if (isExpanded) return const ExpandedCommentBody();

    return const CollapsedCommentBody();
  }
}
