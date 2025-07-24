import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentSubmitButton extends StatelessWidget {
  const CommentSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (CommentBloc bloc) => bloc.state.isSubmissionLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.shrink(
      isLoading: isLoading,
      onPressed: () {
        context.read<CommentBloc>().add(
          const CommentSubmitted(),
        );
      },
      child: Text(l10n.comment_submitAction),
    );
  }
}
