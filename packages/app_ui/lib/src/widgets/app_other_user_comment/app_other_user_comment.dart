import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_other_user_comment_data.dart';
export 'app_other_user_comment_data_placeholder.dart';
export 'collapsed_body.dart';
export 'expanded_body.dart';
export 'header_row.dart';
export 'html.dart';
export 'more_button.dart';
export 'user_and_age.dart';
export 'vote_button.dart';

class AppOtherUserComment extends StatelessWidget {
  const AppOtherUserComment({
    required this.data,
    super.key,
  });

  final AppOtherUserCommentData data;

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
      (AppOtherUserCommentData data) => data.isExpanded,
    );

    if (isExpanded) return const ExpandedBody();

    return const CollapsedBody();
  }
}
