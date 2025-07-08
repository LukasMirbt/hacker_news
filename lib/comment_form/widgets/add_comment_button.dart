import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:hacker_client/l10n/l10n.dart';

class AddCommentButton extends StatelessWidget {
  const AddCommentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (CommentFormBloc bloc) => bloc.state.isLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.expand(
      isLoading: isLoading,
      onPressed: () {
        context.read<CommentFormBloc>().add(
          const CommentFormSubmitted(),
        );
      },
      child: Text(l10n.commentForm_submitAction),
    );
  }
}
