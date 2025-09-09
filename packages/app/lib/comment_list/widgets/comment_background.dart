import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBackground extends StatelessWidget {
  const CommentBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final comment = context.watch<CommentModel>();

    final isSelected = context.select(
      (CommentListBloc bloc) => bloc.state.isSelected(comment),
    );

    final colorScheme = ExtendedColorScheme.of(context);

    return Material(
      color: isSelected ? colorScheme.highlight : Colors.transparent,
      child: child,
    );
  }
}
