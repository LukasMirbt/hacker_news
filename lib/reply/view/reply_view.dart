import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyView extends StatelessWidget {
  const ReplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReplySuccessListener(
      child: ReplyFailureListener(
        child: Scaffold(
          appBar: ReplyAppBar(),
          body: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final fetchStatus = context.select(
      (ReplyBloc bloc) => bloc.state.fetchStatus,
    );

    return switch (fetchStatus) {
      FetchStatus.loading => const Spinner(),
      FetchStatus.success => const ReplyBody(),
      FetchStatus.failure => const ErrorText(),
    };
  }
}
