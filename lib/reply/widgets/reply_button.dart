import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyButton extends StatelessWidget {
  const ReplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (ReplyBloc bloc) => bloc.state.isSubmissionLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.expand(
      isLoading: isLoading,
      onPressed: () {
        context.read<ReplyBloc>().add(
          const ReplySubmitted(),
        );
      },
      child: Text(l10n.replyForm_submitAction),
    );
  }
}
