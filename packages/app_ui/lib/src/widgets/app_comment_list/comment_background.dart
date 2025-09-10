import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentBackground extends StatelessWidget {
  const CommentBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final isSelected = context.select(
      (AppCommentListData data) => data.isSelected(index),
    );

    final colorScheme = ExtendedColorScheme.of(context);

    final backgroundColor = context.select(
      (AppCommentModel comment) => comment.backgroundColor(
        colorScheme: colorScheme,
        isSelected: isSelected,
      ),
    );

    return Material(
      color: backgroundColor,
      child: child,
    );
  }
}
