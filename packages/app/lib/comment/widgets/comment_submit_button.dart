import 'package:app/comment/comment.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentSubmitButton extends StatelessWidget {
  const CommentSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select(
      (CommentBloc bloc) => bloc.state.form.isValid,
    );

    final isLoading = context.select(
      (CommentBloc bloc) => bloc.state.form.isSubmissionLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.shrink(
      isLoading: isLoading,
      onPressed: !isValid
          ? null
          : () {
              context.read<CommentBloc>().add(
                const CommentSubmitted(),
              );
            },
      child: Text(l10n.comment_submitAction),
    );
  }
}
