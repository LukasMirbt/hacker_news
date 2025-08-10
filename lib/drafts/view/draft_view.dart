import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:provider/provider.dart';

class DraftView extends StatelessWidget {
  const DraftView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (DraftBloc bloc) => bloc.state.status,
    );

    return switch (status) {
      DraftStatus.loading => const Spinner(),
      DraftStatus.success => const DraftBody(),
      DraftStatus.failure => const ErrorText(),
    };
  }
}
