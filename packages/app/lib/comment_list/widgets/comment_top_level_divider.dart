import 'package:app/comment_list/comment_list.dart';
import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentTopLevelDivider extends StatelessWidget {
  const CommentTopLevelDivider({
    required this.comment,
    required this.nextComment,
    super.key,
  });

  final CommentModel comment;
  final CommentModel nextComment;

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select(
      (PostSearchBloc bloc) => bloc.state.isSelected(
        comment.toRepository(),
      ),
    );

    final isNextSelected = context.select(
      (PostSearchBloc bloc) => bloc.state.isSelected(
        nextComment.toRepository(),
      ),
    );

    return Column(
      children: [
        Container(
          color: isSelected ? Colors.yellow : Colors.transparent,
          height: comment.isExpanded ? AppSpacing.lg : AppSpacing.xs,
        ),
        const Divider(height: 1),
        Container(
          height: AppSpacing.xs,
          color: isNextSelected ? Colors.yellow : Colors.transparent,
        ),
      ],
    );
  }
}
