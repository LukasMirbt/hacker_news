import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply_form/reply_form.dart';

class ReplyButton extends StatelessWidget {
  const ReplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (ReplyFormBloc bloc) => bloc.state.isSubmissionLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.expand(
      isLoading: isLoading,
      onPressed: () {
        context.read<ReplyFormBloc>().add(
          const ReplyFormSubmitted(),
        );
      },
      child: Text(l10n.replyForm_submitAction),
    );
  }
}
