import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentIndent extends StatelessWidget {
  const CommentIndent({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final comment = context.select(
      (CommentModel comment) => comment.indent * AppSpacing.md,
    );

    return Padding(
      padding: EdgeInsets.only(left: comment),
      child: child,
    );
  }
}
