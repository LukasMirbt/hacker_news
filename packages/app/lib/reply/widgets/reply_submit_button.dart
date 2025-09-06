import 'package:app/l10n/l10n.dart';
import 'package:app/reply/reply.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplySubmitButton extends StatelessWidget {
  const ReplySubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isValid = context.select(
      (ReplyBloc bloc) => bloc.state.form.isValid,
    );

    final isLoading = context.select(
      (ReplyBloc bloc) => bloc.state.form.isSubmissionLoading,
    );

    final l10n = AppLocalizations.of(context);

    return AppFilledButton.shrink(
      isLoading: isLoading,
      onPressed: !isValid
          ? null
          : () {
              context.read<ReplyBloc>().add(
                const ReplySubmitted(),
              );
            },
      child: Text(l10n.reply_submitAction),
    );
  }
}
