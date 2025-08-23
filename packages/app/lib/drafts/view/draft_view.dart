import 'package:app/drafts/drafts.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DraftView extends StatelessWidget {
  const DraftView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (DraftBloc bloc) => bloc.state.status,
    );

    final isEmpty = context.select(
      (DraftBloc bloc) => bloc.state.drafts.isEmpty,
    );

    return switch (status) {
      DraftStatus.loading => const AppLoadingBody(),
      DraftStatus.success when isEmpty => const DraftEmptyBody(),
      DraftStatus.success => const DraftBody(),
      DraftStatus.failure => const AppErrorBody(),
    };
  }
}
