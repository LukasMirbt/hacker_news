import 'package:app/comment_list/comment_list.dart';
import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentSpacer extends StatelessWidget {
  const CommentSpacer({
    required this.comment,
    super.key,
  });

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select(
      (PostSearchBloc bloc) => bloc.state.isSelected(
        comment.toRepository(),
      ),
    );

    return ColoredBox(
      color: isSelected ? Colors.yellow : Colors.transparent,
      child: const SizedBox(height: AppSpacing.sm),
    );
  }
}
