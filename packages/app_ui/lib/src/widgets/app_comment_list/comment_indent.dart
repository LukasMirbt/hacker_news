import 'package:app_ui/src/widgets/app_comment_list/app_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentIndent extends StatelessWidget {
  const CommentIndent({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final indentPadding = context.select(
      (AppCommentModel comment) => comment.indentPadding,
    );

    return Padding(
      padding: EdgeInsets.only(left: indentPadding),
      child: child,
    );
  }
}
